/* alloc.c
 * Garbage collector/allocator
 */

#include "globals.h"

#ifdef USE_STATIC_ALLOCATOR
static Object* objtable;
static Object* firstfree;
#endif

static Object* firstobj = NULL;
static int32 objcount = 0;

/* --- Forward references ------------------------------------------------ */

static void traverse(Object* o);

/* --- Initialise allocator ---------------------------------------------- */

void GCInit(void)
{
#ifdef USE_STATIC_ALLOCATOR
	int32 i;

	objtable = (Object*)mcalloc(GC_OBJECT_TABLE, sizeof(Object));
	for(i=0; i<=GC_OBJECT_TABLE; i++)
		objtable[i].next = &objtable[i+1];
	objtable[GC_OBJECT_TABLE-1].next = NULL;

	firstfree = objtable;
#endif
}

/* --- Allocate an Object structure -------------------------------------- */

Object* GCAllocObj(void)
{
#ifdef USE_STATIC_ALLOCATOR
	Object* obj = firstfree;
	firstfree = obj->next;
#else
	Object* obj = (Object*)mmalloc(sizeof(Object));
#endif
	obj->next = firstobj;
	firstobj = obj;
	objcount++;

	return obj;
}

/* --- Free an Object structure ------------------------------------------ */

void GCFreeObj(Object* obj)
{
#ifdef USE_STATIC_ALLOCATOR
	obj->next = firstfree;
	firstfree = obj;
	objcount--;
#else
	mfree(obj);
#endif
}

/* --- Check whether we need garbage collecting -------------------------- */

void GCCheck(void)
{
#ifdef USE_STATIC_ALLOCATOR
	if (objcount > (GC_OBJECT_TABLE*GC_THRESHOLD)/100)
		GCCollect();
#else
	if (objcount > GC_THRESHOLD)
		GCCollect();
#endif
}

/* --- Garbage collect now ----------------------------------------------- */

void GCCollect(void)
{
	Object* o;
	Object* o1;
	Object* old;
	int32 count = 0;
	int32 total = 0;
	int i;

	/* Phase 1: Tag all objects */

	o = firstobj;
	while (o)
	{
		o->gctag = 1;
		o = o->next;
		total++;
	}

	/* Phase 2: Traverse tree */

	if (savereg.t == SP_OBJECT)
		traverse(savereg.d.o);
	traverse(argvarray);
	for(i=0; i<sp; i++)
		if (stackType[i] == SP_OBJECT)
			traverse(stack[i].o);

	/* Phase 3: Remove unused objects */

	o = firstobj;
	old = NULL;
	while(o)
	{
		if (o->gctag)
		{
			count++;
			switch(o->type)
			{
				case OBJ_INT:
					break;

				case OBJ_STRING:
				case OBJ_BYTEARRAY:
				case OBJ_INTARRAY:
				case OBJ_OBJARRAY:
					if (o->ptr)
						mfree(o->ptr);
					break;

				case OBJ_INTDICT:
				case OBJ_OBJDICT:
					AVLTree_Nuke((AVLNode*)o->ptr, mfree);
					break;
			}
			if (old)
				old->next = o->next;
			else
				firstobj = o;
			o->magic = 0;
			o1 = o;
			o = o->next;
			GCFreeObj(o1);
		}
		else
		{
			old = o;
			o = o->next;
		}
	}
	msg(MSG_GC, "GC: %d/%d = %d", count, total, total-count);
#ifndef USE_STATIC_ALLOCATOR
	objcount = 0;
#endif
}

/* --- Traverse an object tree ------------------------------------------- */

static void tag_intdict(void* ptr)
{
	DictNode* dn = (DictNode*)ptr;
	traverse(dn->key);
}

static void tag_objdict(void* ptr)
{
	DictNode* dn = (DictNode*)ptr;
	traverse(dn->key);
	traverse(dn->data.o);
}

static void traverse(Object* o)
{
	if (!o)
		return;
	if (o->gctag == 0)
		return;

	o->gctag = 0;
	switch(o->type)
	{
		/* No extra action needed for these */

		case OBJ_STRING:
		case OBJ_INT:
		case OBJ_BYTEARRAY:
		case OBJ_INTARRAY:
			break;

		/* Recursively tag all objects in array */

		case OBJ_OBJARRAY:
			if (o->ptr)
			{
				int32 size = o->size;
				int32 i;
				Object **p = o->ptr;
				for(i=0; i<size; i++)
					traverse(p[i]);
			}
			break;

		/* Recursively tag all keys in dictionary */

		case OBJ_INTDICT:
			if (o->ptr)
				AVLTree_Traverse(o->ptr, tag_intdict);
			break;

		/* Recursively tag all keys and objects in dictionary */

		case OBJ_OBJDICT:
			if (o->ptr)
				AVLTree_Traverse(o->ptr, tag_objdict);
			break;

		default:
			fatalError(FATAL_INTERNAL, "Unknown object type in garbage collect");
	}
}

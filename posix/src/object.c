/* object.c
 * Complex object management
 */

#include "globals.h"

// #define DBGALLOC

#if 0
static void display_intdict(void* o1)
{
	DictNode* dn = (DictNode*)o1;
	printf("(%X:\"", dn->key);
	fwrite(dn->key->ptr, dn->key->size, 1, stdout);
	printf("\", %d)", dn->data);
}
#endif

/* --- Check object type ------------------------------------------------- */

void CheckObjType(Object* o, int type)
{
	checkNull(o);
	if (o->magic != OBJ_MAGIC)
		fatalError(FATAL_OBJTYPE, "Attempt to manipulate invalid object");
	if (o->type != type)
		fatalError(FATAL_OBJTYPE, "Operation on object of invalid type");
}

/* --- Object creation --------------------------------------------------- */

Object* CreateString(char* data, int size)
{
	Object *o = GCAllocObj();

#ifdef DBGALLOC
	msg(MSG_DEBUG, "allocating string %lX", o);
#endif
	o->magic = OBJ_MAGIC;
	o->type = OBJ_STRING;
	o->size = size;
	o->ptr = data;

	return o;
}

static Object* create_array(void)
{
	Object *o = GCAllocObj();

#ifdef DBGALLOC
	msg(MSG_DEBUG, "allocating array %lX", o);
#endif
	o->magic = OBJ_MAGIC;
	o->size = 0;
	o->ptr = NULL;

	return o;
}

Object* CreateByteArray(void)
{
	Object* o = create_array();
	o->type = OBJ_BYTEARRAY;
	return o;
}

Object* CreateIntArray(void)
{
	Object* o = create_array();
	o->type = OBJ_INTARRAY;
	return o;
}

Object* CreateObjArray(void)
{
	Object* o = create_array();
	o->type = OBJ_OBJARRAY;
	return o;
}

static Object* create_dict(void)
{
	Object* o = GCAllocObj();

#ifdef DBGALLOC
	msg(MSG_DEBUG, "allocating dict %lX", o);
#endif
	o->magic = OBJ_MAGIC;
	o->size = 0;
	o->ptr = NULL;

	return o;
}

Object* CreateIntDict(void)
{
	Object* o = create_dict();
	o->type = OBJ_INTDICT;
	return o;
}

Object* CreateObjDict(void)
{
	Object* o = create_dict();
	o->type = OBJ_OBJDICT;
	return o;
}

Object* CreateOInt(int i)
{
	Object* o = GCAllocObj();

	o->magic = OBJ_MAGIC;
	o->type = OBJ_INT;
	o->size = i;

	return o;
}

/* =======================================================================
			 SPECIAL STRING OPERATIONS
   ======================================================================= */

/* --- Concatenate two strings ------------------------------------------- */

Object* StringConcat(Object* o1, Object* o2)
{
	int size;
	char *data;

	if (o1 == NULL)
		return o2;

	if (o2 == NULL)
		return o1;

	size = o1->size + o2->size;
	data = (char*)mmalloc(size);

	memcpy(data, o1->ptr, o1->size);
	memcpy(data+o1->size, o2->ptr, o2->size);
	return CreateString(data, size);
}

/* --- Compare two strings ----------------------------------------------- */

int StringCompare(Object* o1, Object* o2)
{
	int r;
	int s;

	if (o1 == o2)
		return 0;
	if (o1 == NULL)
		return -1;
	if (o2 == NULL)
		return 1;

	CheckObjType(o1, OBJ_STRING);
	CheckObjType(o2, OBJ_STRING);

	if ((o1->size == 0) && (o2->size == 0))
		return 0;
	if (o1->size == 0)
		return -1;
	if (o2->size == 0)
		return 1;

	if (o1->size > o2->size)
		s = o2->size;
	else
		s = o1->size;

	r = memcmp(o1->ptr, o2->ptr, s);
	if (o1->size == o2->size)
	{
		if (r<0)
			return -1;
		else if (r>0)
			return 1;
		return 0;
	}

	if (o1->size > o2->size)
		return 1;
	return -1;
}

/* =======================================================================
			  SPECIAL ARRAY OPERATIONS
   ======================================================================= */

/* --- Resize an array --------------------------------------------------- */

void ArrayResize(Object* o, int32 newsize)
{
	int factor = 0;

	checkNull(o);
	if (o->magic != OBJ_MAGIC)
		fatalError(FATAL_OBJTYPE, "Attempt to manipulate invalid object");

	switch(o->type)
	{
		case OBJ_BYTEARRAY:	factor = 1;	break;
		case OBJ_INTARRAY:	factor = 4;	break;
		case OBJ_OBJARRAY:	factor = 4;
					if (newsize < o->size)
					{
						int32 i;
						for(i=newsize; i<o->size; i++)
							((Object**)(o->ptr))[i] = NULL;
					}
					break;
		default:
			fatalError(FATAL_OBJTYPE, "Operation on object of invalid type");
	}

	if (o->size)
	{
		o->ptr = mrealloc(o->ptr, newsize*factor);
		if (newsize > o->size)
			memset((byte*)o->ptr + o->size*factor, 0,
				(newsize - o->size) * factor);
	}
	else
		o->ptr = mcalloc(newsize, factor);

	o->size = newsize;
}

/* --- Insert elements into an array --------------------------------------- */

void ArrayInsert(Object* o, int32 index, int32 size)
{
	int factor = 0;

	checkNull(o);
	if (o->magic != OBJ_MAGIC)
		fatalError(FATAL_OBJTYPE, "Attempt to manipulate invalid object");
	ArrayResize(o, o->size+size);

	switch(o->type)
	{
		case OBJ_BYTEARRAY:	factor = 1;	break;
		case OBJ_INTARRAY:	factor = 4;	break;
		case OBJ_OBJARRAY:	factor = 4;	break;
		default:
			fatalError(FATAL_OBJTYPE, "Operation on object of invalid type");
	}

	memmove(((byte*)o->ptr)+(index+size)*factor,
		((byte*)o->ptr)+index*factor,
		(o->size-index-size)*factor);
	memset(((byte*)o->ptr)+index*factor, 0,
		size*factor);
}

/* --- Delete elements from an array --------------------------------------- */

void ArrayDelete(Object* o, int32 index, int32 size)
{
	int factor = 0;

	checkNull(o);
	if (o->magic != OBJ_MAGIC)
		fatalError(FATAL_OBJTYPE, "Attempt to manipulate invalid object");

	switch(o->type)
	{
		case OBJ_BYTEARRAY:	factor = 1;	break;
		case OBJ_INTARRAY:	factor = 4;	break;
		case OBJ_OBJARRAY:	factor = 4;	break;
		default:
			fatalError(FATAL_OBJTYPE, "Operation on object of invalid type");
	}

	memmove(((byte*)o->ptr)+index*factor,
		((byte*)o->ptr)+(index+size)*factor,
		(o->size-index-size)*factor);
	ArrayResize(o, o->size-size);
}

/* --- Set an entry in an array ------------------------------------------ */

void ArraySetByte(Object* o, int32 entry, int32 value)
{
	CheckObjType(o, OBJ_BYTEARRAY);

	if ((entry < 0) || (entry >= o->size))
		fatalError(FATAL_SYSCALL, "Array access out of bounds on write");
	if ((value < 0) || (value > 255))
		fatalError(FATAL_SYSCALL, "Attempt to store value into byte array outside 0..255 range");

	((byte*)o->ptr)[entry] = value;
}

void ArraySetInt(Object* o, int32 entry, int32 value)
{
	CheckObjType(o, OBJ_INTARRAY);

	if ((entry < 0) || (entry >= o->size))
		fatalError(FATAL_SYSCALL, "Array access out of bounds on write");

	((int32*)o->ptr)[entry] = value;
}

void ArraySetObj(Object* o, int32 entry, Object* value)
{
	CheckObjType(o, OBJ_OBJARRAY);

	if ((entry < 0) || (entry >= o->size))
		fatalError(FATAL_SYSCALL, "Array access out of bounds on write");

	((Object**)o->ptr)[entry] = value;
}

/* --- Get an entry from an array ---------------------------------------- */

int32 ArrayGetByte(Object* o, int32 entry)
{
	CheckObjType(o, OBJ_BYTEARRAY);

	if ((entry < 0) || (entry >= o->size))
		fatalError(FATAL_SYSCALL, "Array access out of bounds on read");

	return ((byte*)o->ptr)[entry];
}

int32 ArrayGetInt(Object* o, int32 entry)
{
	CheckObjType(o, OBJ_INTARRAY);

	if ((entry < 0) || (entry >= o->size))
		fatalError(FATAL_SYSCALL, "Array access out of bounds on read");

	return ((int32*)o->ptr)[entry];
}

Object* ArrayGetObj(Object* o, int32 entry)
{
	CheckObjType(o, OBJ_OBJARRAY);

	if ((entry < 0) || (entry >= o->size))
		fatalError(FATAL_SYSCALL, "Array access out of bounds on read");

	return ((Object**)o->ptr)[entry];
}

/* =======================================================================
		     SPECIAL DICTIONARY OPERATIONS
   ======================================================================= */

/* --- Compares two nodes (used for traversal) --------------------------- */

static int dict_comparefunc(void* n1, void* n2)
{
	return StringCompare(((DictNode*)n1)->key, ((DictNode*)n2)->key);
}

/* --- Add an entry to a dictionary -------------------------------------- */

static void dict_set(Object* o, Object* key, OSN data)
{
	DictNode* dn = (DictNode*)mmalloc(sizeof(DictNode));
	DictNode* fn;

	dn->key = key;
	dn->data = data;

	fn = AVLTree_Insert((AVLNode**)&o->ptr,	/* Root node */
			dict_comparefunc,	/* Comparison function */
			dn,			/* Item to add */
			NULL);			/* Changeflag */
	if (fn)
	{
		mfree(dn);
		fn->key = key;
		fn->data = data;
	}
}

void DictSetInt(Object* o, Object* key, int32 data)
{
	OSN d;

	d.i = data;
	CheckObjType(o, OBJ_INTDICT);
	CheckObjType(key, OBJ_STRING);
	dict_set(o, key, d);
}

void DictSetObj(Object* o, Object* key, Object* data)
{
	OSN d;

	d.o = data;
	CheckObjType(o, OBJ_OBJDICT);
	CheckObjType(key, OBJ_STRING);
	dict_set(o, key, d);
}

/* --- Retrieve an entry from a dictionary ------------------------------- */

static OSN dict_get(Object* o, Object* key)
{
	DictNode* fn;

	fn = AVLTree_Search(o->ptr,		/* Root node */
			dict_comparefunc,	/* Comparison function */
			&key,			/* Item to search for */
			0);			/* Comparison mode */

	if (!fn)
	{
		fprintf(stderr, "Entry '");
		fwrite(key->ptr, 1, key->size, stderr);
		fprintf(stderr, "' not in dictionary\n");
		fatalError(FATAL_SYSCALL, "Entry not found in dictionary");
	}

	return fn->data;
}

int32 DictGetInt(Object* o, Object* key)
{
	CheckObjType(o, OBJ_INTDICT);
	CheckObjType(key, OBJ_STRING);
	return dict_get(o, key).i;
}

Object* DictGetObj(Object* o, Object* key)
{
	CheckObjType(o, OBJ_OBJDICT);
	CheckObjType(key, OBJ_STRING);
	return dict_get(o, key).o;
}

/* --- Search for an entry in a dictionary ------------------------------- */

int DictStat(Object* o, Object* key)
{
	checkNull(o);
	if (o->magic != OBJ_MAGIC)
		fatalError(FATAL_OBJTYPE, "Attempt to manipulate invalid object");
	if ((o->type != OBJ_INTDICT) &&
	    (o->type != OBJ_OBJDICT))
		fatalError(FATAL_OBJTYPE, "Operation on object of invalid type");
	CheckObjType(key, OBJ_STRING);

	return (AVLTree_Search(o->ptr,		/* Root node */
			dict_comparefunc,	/* Comparison function */
			&key,			/* Item to search for */
			0) != NULL);		/* Comparison mode */
}

/* =========================================================================
                    SPECIAL ENCAPSULATED INTEGER OPERATIONS
   ========================================================================= */

int ExtractOInt(Object* o)
{
	CheckObjType(o, OBJ_INT);
	return o->size;
}


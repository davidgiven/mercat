/* convert.c
 * Conversion of one type to another
 */

#include "globals.h"
#include <ctype.h>

static int count;
static Object* ptr;

void sys_IntToStringRadix(void)
{
	int32 radix = popi();
	int32 v = popi();
	int32 size;
	char* buffer = (char*)mmalloc(33);

	(void*)itoa(v, buffer, radix);
	size = strlen(buffer);
	buffer = mrealloc(buffer, size);

	pusho(CreateString(buffer, size));
}

void sys_StringToIntRadix(void)
{
	int32 radix = popi();
	Object* o = popo();
	int32 v;

	CheckObjType(o, OBJ_STRING);

	if (o->size)
	{
		char* b = (char*)mmalloc(o->size+1);
		memcpy(b, o->ptr, o->size);
		b[o->size] = '\0';

		v = strtol(b, NULL, radix);
		mfree(b);
	}
	else
		v = 0;

	pushi(v);
}

void sys_StringByte(void)
{
	Object* o = popo();
	int v = 0;

	CheckObjType(o, OBJ_STRING);
	if (o->size)
		v = *(char*)o->ptr;

	pushi(v);
}

void sys_ByteString(void)
{
	char* b = (char*)mmalloc(1);

	*b = popi();
	pusho(CreateString(b, 1));
}

static void dictconv_count(void* d)
{
	count++;
}

static void dictconv_add(void* d)
{
	DictNode* dn = (DictNode*)d;

	ArraySetObj(ptr, count, dn->key);
	count++;
}

void sys_DictToArray(void)
{
	Object* o = popo();
	Object* c = CreateObjArray();

	checkNull(o);
	if (o->magic != OBJ_MAGIC)
		fatalError(FATAL_OBJTYPE, "Attempt to manipulate invalid object");
	if ((o->type != OBJ_INTDICT) &&
	    (o->type != OBJ_OBJDICT))
		fatalError(FATAL_OBJTYPE, "Operation on object of invalid type");

	count = 0;
	AVLTree_Traverse(o->ptr, dictconv_count);
	ArrayResize(c, count);

	count = 0;
	ptr = c;
	AVLTree_Traverse(o->ptr, dictconv_add);

	pusho(c);
}

void sys_IsHexDigit(void)
{
	Object* o = popo();
	int v;

	CheckObjType(o, OBJ_STRING);
	if (o->size == 0)
		v = 0;
	else
	{
		v = *(char*)o->ptr;
		v = isdigit(v) || ((v>='a') && (v<='f')) || ((v>='A') && (v<='F'));
	}
	pushi(v);
}

void sys_IsDigit(void)
{
	Object* o = popo();
	int v;

	CheckObjType(o, OBJ_STRING);
	if (o->size == 0)
		v = 0;
	else
		v = isdigit(*(char*)o->ptr);
	pushi(v);
}

void sys_IsWhiteSpace(void)
{
	Object* o = popo();
	int v;

	CheckObjType(o, OBJ_STRING);
	if (o->size == 0)
		v = 0;
	v = isspace(*(char*)o->ptr);
	pushi(v);
}

void sys_IsAlphaNumeric(void)
{
	Object* o = popo();
	int v;

	CheckObjType(o, OBJ_STRING);
	if (o->size == 0)
		v = 0;
	v = isalnum(*(char*)o->ptr);
	pushi(v);
}



/* stringop.c
 * Miscellaneous string operations
 */

#include "globals.h"
#include <ctype.h>

/* --- Remove leading & trailing spaces ------------------------------------ */

void sys_StringStrip(void)
{
	Object* o = popo();
	char* b;
	char* ptr;
	int i;

	CheckObjType(o, OBJ_STRING);
	if (o->size == 0)
	{
		pusho(o);
		return;
	}

	b = (char*)mmalloc(o->size);

	i = 0;
	ptr = (char*)o->ptr;
	while(isspace(ptr[i]) && (i < o->size))
		i++;

	memcpy(b, ptr+i, o->size-i);
	i = o->size-i;

	while(isspace(b[i-1]) && (i))
		i--;

	b = (char*)mrealloc(b, i);
	pusho(CreateString(b, i));
}

/* --- Search for one string in another ------------------------------------ */

void sys_StringInstr(void)
{
	int32 start = popi();
	Object* target = popo();
	Object* string = popo();

	CheckObjType(target, OBJ_STRING);
	CheckObjType(string, OBJ_STRING);

	if (start<0)
		fatalError(FATAL_SYSCALL, "Start parameter of StringInstr out of range");

	do {
		if (string->size-start < target->size)
		{
			pushi(-1);
			return;
		}
		if (memcmp((char*)(string->ptr)+start, target->ptr, target->size) == 0)
		{
			pushi(start);
			return;
		}
		start++;
	} while(1);
}

/* --- Extract a substring ------------------------------------------------- */

void sys_StringMid(void)
{
	int32 length = popi();
	int32 from = popi();
	Object* o = popo();
	int size;
	char* b;

	CheckObjType(o, OBJ_STRING);

	size = o->size;
	if (from<0)
		fatalError(FATAL_SYSCALL, "Start parameter of StringMid out of range");
	if (length == -1)
		length = o->size - from;
	if ((length<=0) || (from>=size))
	{
		pusho(CreateString(strdup(""), 0));
		return;
	}
	if (from+length > size)
		length = size - from;

	b = (char*)mmalloc(length);
	memcpy(b, (char*)(o->ptr)+from, length);
	pusho(CreateString(b, length));
}

/* --- Process a string ---------------------------------------------------- */

static Object* process_string(Object* src, int(*func)(int))
{
	int i;
	Object* dest;
	char* newstring;
	int size;

	CheckObjType(src, OBJ_STRING);
	size = src->size;
	newstring = mmalloc(size);
	if (size)
		memcpy(newstring, src->ptr, size);
	else
		newstring = mmalloc(size);

	dest = CreateString(newstring, size);
	for(i=0; i<dest->size; i++)
		newstring[i] = func(newstring[i]);
	
	return dest;
}

/* --- Convert a string to upper case -------------------------------------- */

void sys_StringUpper(void)
{
	pusho(process_string(popo(), &toupper));
}

/* --- Convert a string to lower case -------------------------------------- */

void sys_StringLower(void)
{
	pusho(process_string(popo(), &tolower));
}

/* --- Convert a string to a byte array ------------------------------------ */

void sys_StringToByteArray(void)
{
	Object* string = popo();
	Object* barray = CreateByteArray();

	CheckObjType(string, OBJ_STRING);
	ArrayResize(barray, string->size);
	if (string->size)
		memcpy(barray->ptr, string->ptr, string->size);
	pusho(barray);
}

/* --- Convert a byte array to a string ------------------------------------ */

void sys_ByteArrayToString(void)
{
	Object* barray = popo();
	byte* data;

	CheckObjType(barray, OBJ_BYTEARRAY);

	if (barray->size > 65535)
		fatalError(FATAL_SYSCALL, "Attempt to convert a byte array of more than 64kB to a string");

	data = mmalloc(barray->size);
	memcpy(data, barray->ptr, barray->size);
	pusho(CreateString(data, barray->size));
}


/* stringop.c
 * Miscellaneous string operations
 */

#include "globals.h"
#include <ctype.h>

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


/* streamio.c
 * Stream IO system calls
 */

#include "globals.h"

/* --- Utilities --------------------------------------------------------- */

static void dosputc(int c, FILE* stream)
{
	fputc(c, stream);
	if (c == 13)
		fputc(10, stream);
}

static FILE* get_stream(int i)
{
	FILE* stream;

	if ((i<0) || (i>=NUM_FILES))
		fatalError(FATAL_SYSCALL, "Attempt to access invalid stream");
	stream = filetab[i];
	if (stream == NULL)
		fatalError(FATAL_SYSCALL, "Attempt to access uninitialised stream");
	return stream;
}

/* --- Open/close streams ------------------------------------------------ */

void sys_StreamOpenFile(void)
{
	Object* flags_o = popo();
	Object* filename_o = popo();
	char* filename;
	char* flags;
	int fh;

	CheckObjType(filename_o, OBJ_STRING);
	CheckObjType(flags_o, OBJ_STRING);
	filename = (char*)mmalloc(filename_o->size + 1);
	flags = (char*)mmalloc(flags_o->size + 2);

	memcpy(filename, filename_o->ptr, filename_o->size);
	filename[filename_o->size] = '\0';

	memcpy(flags, flags_o->ptr, flags_o->size);
	flags[flags_o->size] = 'b';
	flags[flags_o->size+1] = '\0';

	fh = 0;
	while (filetab[fh])
	{
		fh++;
		if (fh == NUM_FILES)
			fatalError(FATAL_SYSCALL, "Too many open files");
	}

	filetab[fh] = fopen(filename, flags);
	if (!filetab[fh])
		fh = -1;

	mfree(filename);
	mfree(flags);
	pushi(fh);
}

void sys_StreamClose(void)
{
	int32 fh = popi();
	FILE* stream = get_stream(fh);

	fclose(stream);
	filetab[fh] = NULL;
}

/* --- Stream management ------------------------------------------------- */

void sys_StreamLength(void)
{
	FILE* stream = get_stream(popi());
	long pos;
	long length;

	pos = ftell(stream);
	fseek(stream, 0, SEEK_END);
	length = ftell(stream);
	fseek(stream, pos, SEEK_SET);

	pushi(length);
}

void sys_StreamSeek(void)
{
	int32 pos = popi();
	FILE* stream = get_stream(popi());

	fseek(stream, pos, SEEK_SET);
}

void sys_StreamTell(void)
{
	FILE* stream = get_stream(popi());
	pushi(ftell(stream));
}

void sys_StreamFlush(void)
{
	FILE* stream = get_stream(popi());

	fflush(stream);
}

void sys_StreamEOF(void)
{
	pushi(feof(get_stream(popi())));
}

/* --- Raw stream input -------------------------------------------------- */

void sys_StreamReadBlock(void)
{
	Object* buffer = popo();
	int32 size = popi();
	FILE* stream = get_stream(popi());
	int32 amountread;

	CheckObjType(buffer, OBJ_BYTEARRAY);
	if (buffer->ptr)
		mfree(buffer->ptr);
	buffer->ptr = (void*)mmalloc(size);

	amountread = fread(buffer->ptr, 1, size, stream);
	buffer->ptr = (void*)mrealloc(buffer->ptr, amountread);
	buffer->size = amountread;
}

/* --- Cooked stream input ----------------------------------------------- */

void sys_StreamReadLine(void)
{
	FILE* stream = get_stream(popi());
	int bsize = 80;
	int bptr = 0;
	int c;
	char* buffer = (char*)mmalloc(bsize);

	do {
		c = fgetc(stream);
		if ((c == EOF) || (c == '\n'))
			break;
		if (c == '\r')
		{
			c = fgetc(stream);
			if (c != '\n')
				ungetc(c, stream);
			break;
		}
		buffer[bptr++] = c;
		if (bptr == bsize)
		{
			bsize += 80;
			buffer = (char*)mrealloc(buffer, bsize);
		}
	} while(1);

	buffer = (char*)mrealloc(buffer, bptr);
	pusho(CreateString(buffer, bptr));
}

void sys_StreamReadChar(void)
{
	FILE* stream = get_stream(popi());
	char* buffer = (char*)mmalloc(1);

	buffer[0] = fgetc(stream);
	pusho(CreateString(buffer, 1));
}

/* --- Raw stream output ------------------------------------------------- */

void sys_StreamWriteByte(void)
{
	int32 value = popi();
	FILE* stream = get_stream(popi());

	fputc(value, stream);
}

/* --- Output to a stream ------------------------------------------------ */

void sys_PrintNL(void)
{
	FILE* stream = get_stream(popi());

	dosputc('\n', stream);
}

void sys_PrintInt(void)
{
	int32 value = popi();
	FILE* stream = get_stream(popi());

	fprintf(stream, "%" LONGFORMAT "d", value);
}

void sys_PrintString(void)
{
	Object* o = popo();
	FILE* stream = get_stream(popi());
	int i;

	CheckObjType(o, OBJ_STRING);
	if (o->size)
	{
		for(i=0; i<o->size; i++)
			dosputc(((char*)o->ptr)[i], stream);
	}
//	fwrite(o->ptr, o->size, 1, stream);
}


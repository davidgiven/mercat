/* misc.c
 * Miscellaneous utility functions
 */

#include "globals.h"
#include <stdarg.h>

/* If we can't do inline, then we'll have to put the functions here. */

#ifndef INLINE
#include "inline.h"
#endif

int msgMask = 0;

/* --- Malloc wrappers --------------------------------------------------- */

void* mmalloc(int size)
{
	void* p;

	if (size == 0)
		return NULL;
	p = malloc(size);
	if (!p)
		fatalError(FATAL_MEMORY, "malloc() failed!");
	return p;
}

void* mcalloc(int s1, int s2)
{
	void* p;

	if ((s1 == 0) || (s2 == 0))
		return NULL;
	p = calloc(s1, s2);
	if (!p)
		fatalError(FATAL_MEMORY, "calloc() failed!");
	return p;
}

void* mrealloc(void* p, int size)
{
	if (!p)
		return mmalloc(size);
	if (size == 0)
	{
		free(p);
		return NULL;
	}
	p = realloc(p, size);
	if (!p)
		fatalError(FATAL_MEMORY, "realloc() failed!");
	return p;
}

void mfree(void* p)
{
	if (!p)
		return;
	//fprintf(stderr, "p=%p\n", p);
	free(p);
}

char* mstrdup(char* s1)
{
	int ss = strlen(s1);
	char* s2 = mmalloc(ss);
	strcpy(s2, s1);
	return s2;
}

/* --- Display a message ------------------------------------------------- */

void msg(int type, char *format, ...)
{
	if (type & msgMask)
	{
		va_list ap;

		va_start(ap, format);
		vfprintf(stderr, format, ap);
		fprintf(stderr, "\n");
		fflush(stderr);
		va_end(ap);
	}
}

/* --- Fatal error ------------------------------------------------------- */

void fatalError(int exitcode, char *message)
{
	msg(MSG_FATAL, message);
#ifdef DEBUG
	msg(MSG_FATAL, "Exiting with error code %d", exitcode);
	fflush(stderr);
	abort();
	/* Forces a crash (on systems with memory protection) */
//	((function)(0))();
#else
	exit(exitcode);
#endif
}

/* --- Hex display ------------------------------------------------------- */

void hexDisplay(byte *ptr)
{
	msg(MSG_DEBUG, "+0: %02X %02X %02X %02X %02X %02X %02X %02X",
		ptr[0], ptr[1], ptr[2], ptr[3],
		ptr[4], ptr[5], ptr[6], ptr[7]);
	msg(MSG_DEBUG, "+8: %02X %02X %02X %02X %02X %02X %02X %02X",
		ptr[8], ptr[9], ptr[10], ptr[11],
		ptr[12], ptr[13], ptr[14], ptr[15]);
}

/* --- itoa -------------------------------------------------------------- */

/* Some platforms don't have this (including Linux). Bizarre! */

#ifdef NO_ITOA
char* itoa(int value, char* buffer, int base)
{
	static char numbers[] = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	static char tbuf[35];
	char* tbufp = tbuf;

	/* Special cases */
		
	if (value < 0)
	{
		*buffer++ = '-';
		value = -value;
	}
	if (value == 0)
	{
		*buffer++ = '0';
		goto itoa_exit;
	}
	
	/* Render number */
	
	while (value)
	{
		*tbufp++ = numbers[value % base];
		value /= base;
	}
	
	/* Copy into destination buffer */
	
	while (tbufp != tbuf)
		*buffer++ = *--tbufp;
	
	/* Exit */

itoa_exit:
	*buffer = 0;
	return buffer;
}
#endif

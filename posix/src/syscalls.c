/* syscalls.c
 * System call interface
 */

#include "globals.h"

#include "syscall/streamio.h"
#include "syscall/debug.h"
#include "syscall/app.h"
#include "syscall/convert.h"
#include "syscall/stringop.h"
#include "syscall/number.h"
#include "syscall/scr.h"
#include "syscall/time.h"
#include "syscall/internet.h"

static struct {
	char* name;
	function ptr;
} systable[] = {
	STREAMIO
	DEBUGROUTINES
	APP
	CONVERT
	STRINGOP
	NUMBER
	SCR
	TIME
	INTERNET
	{NULL, NULL}
};

/* --- System call lookup ------------------------------------------------ */

function lookupSyscall(char *name)
{
	int i = 0;

	while(systable[i].name)
	{
		if (strcmp(systable[i].name, name) == 0)
			return systable[i].ptr;
		i++;
	}

	msg(MSG_FATAL, "Unknown system call `%s'", name);
	fatalError(FATAL_SYSCALL, "Unimplemented system call");
	return NULL;
}


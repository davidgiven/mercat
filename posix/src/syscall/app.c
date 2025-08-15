/* app.c
 * Application-level control
 */

#include "globals.h"

void sys_AppExit(void)
{
	int32 v = popi();

	exit(v);
}

void sys_AppGetErrorString(void)
{
	pusho(CreateString(strdup(""), 0));
}

void sys_AppGetArguments(void)
{
	pusho(argvarray);
}


/* internet.c
 * Simple internet access functions
 */

#include "globals.h"

/* --- Standard module functions ------------------------------------------- */

void sys_HasInternet(void)
{
#ifdef HAS_INTERNET
	pushi(1);
#else
	pushi(0);
#endif
}

/* --- Include system-specific bit ----------------------------------------- */

#ifdef HAS_INTERNET
#include "syscall/internet/unix.h"
#endif


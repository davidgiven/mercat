/* scr.c
 * Bitmap text control
 */

#include "globals.h"

/* --- Standard module functions ------------------------------------------- */

void sys_HasScr(void)
{
#ifdef HAS_SCR
	pushi(1);
#else
	pushi(0);
#endif
}

/* --- Include system-specific bit ----------------------------------------- */

#ifdef HAS_SCR
#ifdef MSDOS
#include "syscall/scr/msdos.h"
#else
#include "syscall/scr/unix.h"
#endif
#endif


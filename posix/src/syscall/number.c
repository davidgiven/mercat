/* number.c
 * Miscellaneous integer functions
 */

#include "globals.h"
#include <time.h>

void sys_RandomNumber(void)
{
	pushi(rand() % popi());
}

void sys_RandomSetSeed(void)
{
	srand(time(NULL));
}


/* number.c
 * Miscellaneous integer functions
 */

#include "globals.h"
#include <time.h>

void sys_RandomNumber(void)
{
	pushi(rand() % popi());
}

void sys_RandomSeedRandom(void)
{
	srand(time(NULL));
}


/* number.h
 * Miscellaneous integer functions
 */

extern void sys_RandomNumber(void);
extern void sys_RandomSetSeed(void);

#define NUMBER \
	{"RandomNumber",	sys_RandomNumber},	\
	{"RandomSetSeed",	sys_RandomSetSeed},


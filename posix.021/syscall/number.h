/* number.h
 * Miscellaneous integer functions
 */

extern void sys_RandomNumber(void);
extern void sys_RandomSeedRandom(void);

#define NUMBER \
	{"RandomNumber",	sys_RandomNumber},	\
	{"RandomSeedRandom",	sys_RandomSeedRandom},


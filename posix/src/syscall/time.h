/* time.h
 * Timing functions
 */

extern void sys_TimeNow(void);
extern void sys_TimeSleep(void);
extern void sys_TimeSleepUntil(void);

#define TIME \
	{"TimeNow",		sys_TimeNow},		\
	{"TimeSleep",		sys_TimeSleep},		\
	{"TimeSleepUntil",	sys_TimeSleepUntil},

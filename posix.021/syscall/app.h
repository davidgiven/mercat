/* app.h
 * Application-level control
 */

extern void sys_AppExit(void);
extern void sys_AppGetErrorString(void);
extern void sys_AppGetArguments(void);

#define APP \
	{"AppExit",		sys_AppExit},		\
	{"AppGetErrorString",	sys_AppGetErrorString},	\
	{"AppGetArguments",	sys_AppGetArguments},

/* internet.h
 * Simple network access
 */

extern void sys_HasInternet(void);

#ifdef HAS_INTERNET
extern void sys_InternetSendMailRaw(void);
#else
#define sys_InternetSendMailRaw	NULL
#endif

#define INTERNET \
	{"HasInternet",		sys_HasInternet},	\
	{"InternetSendMailRaw",	sys_InternetSendMailRaw},


/* scr.h
 * Bitmap text screen control
 */

extern void sys_HasScr(void);

#ifdef HAS_SCR
extern void sys_ScrInit(void);
extern void sys_ScrShutdown(void);
extern void sys_ScrClear(void);
extern void sys_ScrClearArea(void);
extern void sys_ScrGotoXY(void);
extern void sys_ScrGetX(void);
extern void sys_ScrGetY(void);
extern void sys_ScrWidth(void);
extern void sys_ScrHeight(void);
extern void sys_ScrGetCh(void);
extern void sys_ScrKeyHit(void);
extern void sys_ScrPutStr(void);
extern void sys_ScrSetFG(void);
extern void sys_ScrSetBG(void);
extern void sys_ScrSetFGBG(void);
extern void sys_ScrFG(void);
extern void sys_ScrBG(void);
#else
#define sys_ScrInit		NULL
#define sys_ScrShutdown		NULL
#define sys_ScrClear		NULL
#define sys_ScrClearArea	NULL
#define sys_ScrGotoXY		NULL
#define sys_ScrGetX		NULL
#define sys_ScrGetY		NULL
#define sys_ScrWidth		NULL
#define sys_ScrHeight		NULL
#define sys_ScrGetCh		NULL
#define sys_ScrKeyHit		NULL
#define sys_ScrPutStr		NULL
#define sys_ScrSetFG		NULL
#define sys_ScrSetBG		NULL
#define sys_ScrSetFGBG		NULL
#define sys_ScrFG		NULL
#define sys_ScrBG		NULL
#endif

#define SCR \
	{"HasScr",		sys_HasScr},		\
	{"ScrInit",		sys_ScrInit},		\
	{"ScrShutdown",		sys_ScrShutdown},	\
	{"ScrClear",		sys_ScrClear},		\
	{"ScrClearArea",	sys_ScrClearArea},	\
	{"ScrGotoXY",		sys_ScrGotoXY},		\
	{"ScrGetX",		sys_ScrGetX},		\
	{"ScrGetY",		sys_ScrGetY},		\
	{"ScrWidth",		sys_ScrWidth},		\
	{"ScrHeight",		sys_ScrHeight},		\
	{"ScrGetCh",		sys_ScrGetCh},		\
	{"ScrKeyHit",		sys_ScrKeyHit},		\
	{"ScrPutStr",		sys_ScrPutStr},		\
	{"ScrSetFG",		sys_ScrSetFG},		\
	{"ScrSetBG",		sys_ScrSetBG},		\
	{"ScrSetFGBG",		sys_ScrSetFGBG},	\
	{"ScrFG",		sys_ScrFG},		\
	{"ScrBG",		sys_ScrBG},


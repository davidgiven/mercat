/* debug.h
 * Various debugging routines
 */

extern void DebugPrintObj(void);

#ifdef DEBUG
#define DEBUGROUTINES \
	{"DebugPrintObj",	DebugPrintObj},
#else
#define DEBUGROUTINES /* */
#endif


/* stringop.h
 * Miscellaneous string operations
 */

extern void sys_StringStrip(void);
extern void sys_StringInstr(void);
extern void sys_StringMid(void);

#define STRINGOP \
	{"StringStrip",		sys_StringStrip},	\
	{"StringInstr",		sys_StringInstr},	\
	{"StringMid",		sys_StringMid},


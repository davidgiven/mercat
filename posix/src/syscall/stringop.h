/* stringop.h
 * Miscellaneous string operations
 */

extern void sys_StringStrip(void);
extern void sys_StringInstr(void);
extern void sys_StringMid(void);
extern void sys_StringUpper(void);
extern void sys_StringLower(void);
extern void sys_StringToByteArray(void);
extern void sys_ByteArrayToString(void);

#define STRINGOP \
	{"StringStrip",		sys_StringStrip},	\
	{"StringInstr",		sys_StringInstr},	\
	{"StringMid",		sys_StringMid},		\
	{"StringUpper",		sys_StringUpper},	\
	{"StringLower",		sys_StringLower},	\
	{"StringToByteArray",	sys_StringToByteArray},	\
	{"ByteArrayToString",	sys_ByteArrayToString},


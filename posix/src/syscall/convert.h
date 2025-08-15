/* convert.h
 * Conversion of one type to another
 */

extern void sys_IntToStringRadix(void);
extern void sys_StringToIntRadix(void);
extern void sys_StringByte(void);
extern void sys_ByteString(void);
extern void sys_DictToArray(void);
extern void sys_IsDigit(void);
extern void sys_IsAlphaNumeric(void);
extern void sys_IsWhiteSpace(void);

#define CONVERT \
	{"IntToStringRadix",	sys_IntToStringRadix},		\
	{"LongToStringRadix",	sys_IntToStringRadix},		\
	{"StringToIntRadix",	sys_StringToIntRadix},		\
	{"StringToLongRadix",	sys_StringToIntRadix},		\
	{"StringByte",		sys_StringByte},		\
	{"ByteString",		sys_ByteString},		\
	{"DictToArray",		sys_DictToArray},		\
	{"IsDigit",		sys_IsDigit},			\
	{"IsAlphaNumeric",	sys_IsAlphaNumeric},		\
	{"IsWhiteSpace",	sys_IsWhiteSpace},


/* streamio.h
 * Stream IO system calls
 */

extern void sys_StreamOpenFile(void);
extern void sys_StreamClose(void);
extern void sys_StreamLength(void);
extern void sys_StreamSeek(void);
extern void sys_StreamEOF(void);
extern void sys_StreamFlush(void);
extern void sys_StreamReadBlock(void);
extern void sys_StreamReadLine(void);
extern void sys_StreamReadChar(void);
extern void sys_StreamWriteByte(void);
extern void sys_PrintString(void);
extern void sys_PrintInt(void);
extern void sys_PrintNL(void);

#define STREAMIO \
	{"StreamOpenFile",	sys_StreamOpenFile},	\
	{"StreamClose",		sys_StreamClose},	\
	{"StreamLength",	sys_StreamLength},	\
	{"StreamSeek",		sys_StreamSeek},	\
	{"StreamFlush",		sys_StreamFlush},	\
	{"StreamEOF",		sys_StreamEOF},		\
	{"StreamReadBlock",	sys_StreamReadBlock},	\
	{"StreamReadLine",	sys_StreamReadLine},	\
	{"StreamReadChar",	sys_StreamReadChar},	\
	{"StreamWriteByte",	sys_StreamWriteByte},	\
	{"PrintLong",		sys_PrintInt},		\
	{"PrintShort",		sys_PrintInt},		\
	{"PrintInt",		sys_PrintInt},		\
	{"PrintString",		sys_PrintString},	\
	{"PrintNL",		sys_PrintNL},


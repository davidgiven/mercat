/* globals.h
 * Global declarations
 */

/* Funky compatibility stuff. */

#ifdef __BORLANDC__
#ifndef MSDOS
#define MSDOS
#endif
#endif

#ifdef __MSDOS__
#ifndef MSDOS
#define MSDOS
#endif
#endif

#include <stdlib.h>
#include <stdio.h>
#ifndef MSDOS
#include <unistd.h>
#endif
#include <string.h>

/* This is where we set the data types. The system assumes a 32-bit machine
 * unless you tell it otherwise. */

#ifdef __BORLANDC__
typedef unsigned char	byte;		/* 8-bit signed */
typedef char		int8;		/* 8-bit signed */
typedef byte		uint8;		/* 8-bit unsigned */
typedef short		int16;		/* 16-bit signed */
typedef unsigned short	uint16;		/* 16-bit unsigned */
typedef long		int32;		/* 32-bit signed */
typedef unsigned long	uint32;		/* 32-bit unsigned */
#else
typedef unsigned char	byte;		/* 8-bit signed */
typedef char		int8;		/* 8-bit signed */
typedef byte		uint8;		/* 8-bit unsigned */
typedef short		int16;		/* 16-bit signed */
typedef unsigned short	uint16;		/* 16-bit unsigned */
typedef int		int32;		/* 32-bit signed */
typedef unsigned int	uint32;		/* 32-bit unsigned */
#endif

/* Autodetects the printf modifier needed to output a long. */

#ifdef __BORLANDC__
#define LONGFORMAT "l"
#else
#define LONGFORMAT ""
#endif

/* Autodetects whether we support the `inline' keyword. */

#ifdef __GNUC__
#define INLINE static inline
#endif

#include "config.h"

/* Tucked away in the depths of the GNU include files are definitions for
 * uchar and uint. This is for systems that don't have them. */

#ifndef linux
typedef byte uchar;
typedef unsigned int uint;
#endif

typedef void(*function)(void);

/* Complex object structure */

typedef struct Object_s {
	int magic;
	int type;
	struct Object_s* next;
	int32 size;
	void* ptr;
	int gctag;
} Object;

/* Stack slot types */

enum {
	SP_EMPTY = 0,
	SP_INT,
	SP_OBJECT
};
typedef char OType;

/* Object Storage Node */

typedef union OSN_s {
	Object* o;
	int32 i;
} OSN;

/* Typed Object Storage Node */

typedef struct TOSN_s {
	OSN d;
	OType t;
} TOSN;

/* Dictionary data node */

typedef struct DictNode_s {
	Object* key;
	OSN data;
} DictNode;

/* Message types */

enum {
	MSG_FATAL	= (1 << 0),
	MSG_WARNING	= (1 << 1),
	MSG_FILESTAT	= (1 << 2),
	MSG_DEBUG	= (1 << 3),
	MSG_GC		= (1 << 4)
};

/* Exit codes */

enum {
	FATAL_SYNTAX	= 1,
	FATAL_ACCESS,
	FATAL_LOADING,
	FATAL_FORMAT,
	FATAL_SYSCALL,
	FATAL_STACK,
	FATAL_OPCODE,
	FATAL_OBJTYPE,
	FATAL_INTERNAL,
	FATAL_MEMORY
};

/* Complex object types */

enum {
	OBJ_STRING	= 1,
	OBJ_INT,
	OBJ_BYTEARRAY,
	OBJ_INTARRAY,
	OBJ_OBJARRAY,
	OBJ_INTDICT,
	OBJ_OBJDICT
};

/* Miscellaneous */

enum {
	NUM_FILES	= 20,		/* Maximum number of open files */
	OBJ_MAGIC	= 0xABCD	/* Signifies a valid object */
};

#include "opcodes.h"
#include "avltree.h"

extern int32 pc;
extern int32 sp;
extern int32 fp;
extern int32 cs;
extern int32 lineno;

extern TOSN savereg;

extern byte* code;
extern OSN* stack;
extern OType* stackType;
extern int32* callStack;
extern function* syscalltable;
extern FILE* *filetab;

extern int msgMask;
extern int halt;

extern Object* argvarray;

#define RUINT16(p)	((uint16)((p)[0] | ((p)[1] << 8)))
#define RUINT32(p)	((uint32)RUINT16(p) | ((uint32)RUINT16(p+2) << 16))
#define RINT16(p)	((int16)RUINT16(p))
#define RINT32(p)	((int32)RUINT32(p))

#define WUINT16(p, v)	do{ (p)[0]=v; (p)[1]=(v)>>8; }while(0)
#define WUINT32(p, v)	do{ (p)[0]=v; (p)[1]=(v)>>8; (p)[2]=(v)>>16; (p)[3]=(v)>>24; }while(0)
#define WINT16(p, v)	WUINT16(p, v)
#define WINT32(p, v)	WUINT32(p, v)

extern void execute(void);

extern void CheckObjType(Object*, int);
extern Object* CreateString(char*, int);
extern Object* CreateByteArray(void);
extern Object* CreateIntArray(void);
extern Object* CreateObjArray(void);
extern Object* CreateIntDict(void);
extern Object* CreateObjDict(void);
extern Object* CreateOInt(int);
extern int ExtractOInt(Object*);

extern Object* StringConcat(Object*, Object*);
extern int StringCompare(Object*, Object*);
extern void ArrayResize(Object*, int32);
extern void ArrayInsert(Object*, int32, int32);
extern void ArrayDelete(Object*, int32, int32);
extern void ArraySetByte(Object*, int32, int32);
extern void ArraySetInt(Object*, int32, int32);
extern void ArraySetObj(Object*, int32, Object*);
extern int32 ArrayGetByte(Object*, int32);
extern int32 ArrayGetInt(Object*, int32);
extern Object* ArrayGetObj(Object*, int32);
extern void DictSetInt(Object*, Object*, int32);
extern void DictSetObj(Object*, Object*, Object*);
extern int32 DictGetInt(Object*, Object*);
extern Object* DictGetObj(Object*, Object*);
extern int DictStat(Object*, Object*);

extern void* mcalloc(int, int);
extern void* mmalloc(int);
extern void* mrealloc(void*, int);
extern void mfree(void*);
extern char* mstrdup(char*);

extern void msg(int, char*, ...);
extern void fatalError(int, char*);
extern void hexDisplay(byte*);

extern function lookupSyscall(char*);

extern char* opcodeName(int);

extern void GCInit(void);
extern Object* GCAllocObj(void);
extern void GCCheck(void);
extern void GCCollect(void);

#ifdef INLINE
#include "inline.h"
#else
extern void checkNull(Object*);
extern void check(int, byte);

extern int32 peeki(int);
extern Object* peeko(int);
extern void pokei(int, int32);
extern void pokeo(int, Object*);
extern int32 popi(void);
extern Object* popo(void);
extern void pushi(int32);
extern void pusho(Object*);
#endif

#ifdef NO_ITOA
extern char* itoa(int, char*, int);
#endif

/* Assorted debugging routines */

extern void debug_printobjdict(AVLNode*);

/* Our private assertion function */

#ifdef DEBUG
#define ASSERT(e, m) \
	do { \
		if (!(e)) \
		{ \
			msg(MSG_DEBUG, "Assertion failure! " \
				m " @ %s:%d; " #e " is not true", \
				__FILE__, __LINE__); \
			fatalError(FATAL_INTERNAL, "Fatal internal error"); \
		} \
	} while(0)
#else
#define ASSERT(e, m) /* */
#endif


/* config.h
 * Per-platform configuration file
 */
 
/* Define this if your platform doesn't have itoa */

#define NO_ITOA

/* Change these to reflect your platform's data sizes */

typedef unsigned char	byte;		/* 8-bit signed */
typedef char		int8;		/* 8-bit signed */
typedef byte		uint8;		/* 8-bit unsigned */
typedef short		int16;		/* 16-bit signed */
typedef unsigned short	uint16;		/* 16-bit unsigned */
typedef long		int32;		/* 32-bit signed */
typedef unsigned long	uint32;		/* 32-bit unsigned */

/* This contains the printf modifier needed to output a long */

#define LONGFORMAT "l"

/* Set this to whatever's necessary to do inline functions. If you can't do
 * inline functions at all, undefine it (things will still work correctly). */

// #define INLINE static inline

/* Every time an object is created, a counter is incremented. When the
 * counter reaches this value, a garbage collection occurs. Vary this
 * according to how much memory you have; for Linux and DOS/32 I use 10000 or
 * 50000. For DOS/16 it appears 1000 is about the maximum to compile the
 * compiler. Blech. */

#define GC_THRESHOLD 1000

/* Set this to include tons of debug code (enable assertions, etc) */

// #define DEBUG

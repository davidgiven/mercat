/* config.h
 * Per-platform configuration file
 */

/* Define this if your platform doesn't have itoa */

#define NO_ITOA

/* Do you want to use the static or dynamic allocator? The static allocator
 * is faster, but since it uses a fixed-size object table uses tons of memory
 * (and so may not be suitable for 16-bit platforms). The dynamic allocator
 * mallocs Object structures at need and so is more memory efficient. To use
 * the static allocator, define this. Undefine it for the dynamic one. */

// #define USE_STATIC_ALLOCATOR

/* If you're using the dynamic allocator, then garbage collections occur
 * every time this number of objects is allocated. If you're using the static
 * allocator, then use a percentage of the object table instead of a absolute
 * number.
 *
 * Vary this according to how much memory you have; for Linux and DOS32 I
 * use 10000 or 50000. For DOS/16 it appears 1000 is about the maximum
 * possible if you want to compile the compiler without running out of memory.
 * Blech. */

// #define GC_THRESHOLD 50000	/* For dynamic allocator */
#define GC_THRESHOLD 90		/* For static allocator */

/* If you're using the static allocator, this is the size of the table. As
 * mentioned above, garbage collections occur when this reaches 90% full.
 * This is subject to similar memory limitations as GC_THRESHOLD. */

#define GC_OBJECT_TABLE 50000

/* Set this to include tons of debug code (enable assertions, etc) */

// #define DEBUG

/* Set if you want to enable the SCR UI module (requires curses) */

#define HAS_SCR

/* Set if you want to enable the Internet module (requires an OS with socket
 * support; currently Unix only) */

#ifndef MSDOS
#define HAS_INTERNET
#endif

/* If your version of the Internet module requires it, put the path to your
 * sendmail daemon here. */

#define INTERNET_SENDMAIL "/usr/sbin/sendmail "



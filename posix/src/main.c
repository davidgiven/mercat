/* main.c
 * Main program
 */

#include "globals.h"

OSN* stack;			/* Main stack */
OType* stackType;		/* Stack type data */
int32* callStack;		/* Program stack */

char *filename;			/* Name of .mo file */
byte *code;			/* Ptr to actual code */
function *syscalltable;		/* Syscall table */
FILE* *filetab;			/* File table */

int32 sp = 1;			/* Stack pointer */
int32 fp = 0;			/* Frame pointer */
int32 pc = 0;			/* Program counter */
int32 cs = 0;			/* Program stack pointer */
int32 lineno = -1;			/* Current line number */

TOSN savereg = {{NULL}, SP_EMPTY};
				/* Saved return value */

int vmajor = -1;		/* Major version number of file */
int vminor = -1;		/* Minor version number of file */

int halt = 0;			/* Halt flag */

Object* argvarray;		/* Argument array */

/* --- Read some data ---------------------------------------------------- */

static void load(FILE *f, byte *buffer, uint size)
{
	if (fread(buffer, size, 1, f) != 1)
		fatalError(FATAL_LOADING, "Error loading .mo file\n");
}

/* --- Read in the syscalltable table ----------------------------------------- */

static void load_syscalltables(int nsyscalltables, FILE *f)
{
	int i;
	int n;
	char buffer[80];
	char *p;

	for(i = 0; i<nsyscalltables; i++)
	{
		load(f, buffer, 2);
		n = RINT16((char*)buffer);

		p = buffer-1;
		do {
			p++;
			load(f, p, 1);
		} while (*p);

		syscalltable[n] = lookupSyscall(buffer);
		msg(MSG_FILESTAT, "\t%d: `%s' (0x%lX)", n, buffer, syscalltable[n]);
	}
}

/* --- Load file into buffer --------------------------------------------- */

static void load_file(void)
{
	FILE *f = fopen(filename, "rb");
	int nsyscalltables;
	int32 codesize;

	if (f == NULL)
		fatalError(FATAL_ACCESS, "Could not open .mo file\n");

	/* Read file header */

	code = (byte*)mmalloc(256);

	/* Magic number */

	load(f, code, 4);
	if (RUINT32(code) != 0x20706D2E)
		fatalError(FATAL_FORMAT, "Bad magic number in .mo file\n");

	/* File version */

	load(f, code, 2);
	vmajor = code[0];
	vminor = code[1];
	msg(MSG_FILESTAT, "File version: %d.%d", vmajor, vminor);

	/* Number of system calls */

	load(f, code, 2);
	nsyscalltables = RINT16(code);
	msg(MSG_FILESTAT, "System calls: %d", nsyscalltables);
	syscalltable = (function*)mcalloc(nsyscalltables, sizeof(function));

	/* Read system calls */

	load_syscalltables(nsyscalltables, f);

	/* Load main code */

	load(f, code, 4);
	codesize = RUINT32(code);
	msg(MSG_FILESTAT, "Loading %d bytes of code", codesize);
	mfree(code);
	code = (byte*)mmalloc(codesize);
	load(f, code, codesize);

	/* Finished with the file */

	fclose(f);
}

/* --- Load arguments ---------------------------------------------------- */

static void load_arguments(int argc, char* argv[])
{
	int i;

	argvarray = CreateObjArray();

	ArrayResize(argvarray, argc);

	ArraySetObj(argvarray, 0, CreateString(mstrdup(argv[0]), strlen(argv[0])));
	for(i=0; i<argc; i++)
		ArraySetObj(argvarray, i, CreateString(mstrdup(argv[i]), strlen(argv[i])));
}

/* --- Print syntax message ---------------------------------------------- */

static void syntax_error(void)
{
	fprintf(stderr,
MERCAT_VERSION "\n"
"Options:\n"
"\t-h\tPrint this message\n"
"\t-m\tEnable a message\n"
"\t-M\tDisable a message\n"
);
	exit(FATAL_SYNTAX);
}

/* --- Message switches -------------------------------------------------- */

static void msg_switch(char* p, int onoff)
{
	int bitmask;

	while(*p)
	{
		switch(*p)
		{
			case 'w':
			case 'W':
				bitmask = MSG_WARNING;
				break;

			case 'f':
			case 'F':
				bitmask = MSG_FILESTAT;
				break;

			case 'd':
			case 'D':
				bitmask = MSG_DEBUG;
				break;

			case 'g':
			case 'G':
				bitmask = MSG_GC;
				break;

			default:
				fatalError(FATAL_SYNTAX, "Invalid message flag");
		}
		p++;
		if (onoff)
			msgMask |= bitmask;
		else
			msgMask &= ~bitmask;
	}
}

/* --- Options processing ------------------------------------------------ */

static int process_options(int argc, char* argv[])
{
	int i;
	char* param;

	for(i=1; i<argc; i++)
	{
		if (!argv[i])
			syntax_error();
		if (argv[i][0] != '-')
			return i;
		if (argv[i][1] == '\0')
			syntax_error();
		param = &argv[i][2];

		switch(argv[i][1])
		{
			/* Print a help message */

			case 'h':
				syntax_error();

			/* Enable a message */

			case 'm':
				msg_switch(param, 1);
				break;

			/* Disable a message */

			case 'M':
				msg_switch(param, 0);
				break;

			/* Unknown switch */

			default:
				syntax_error();
		}
	}
	syntax_error();
        return 0;
}

/* --- Main bootstrap ---------------------------------------------------- */

int main(int argc, char* argv[])
{
	int optbase;

	msgMask = 
#ifdef DEBUG
	MSG_DEBUG + MSG_GC +
#endif
	0;

	optbase =  process_options(argc, argv);
	filename = argv[optbase];
	load_file();

	stack = (OSN*)mcalloc(sizeof(OSN), 0x1000/sizeof(OSN));
	stackType = (OType*)mcalloc(1, 0x1000/sizeof(OType));
	callStack = (int32*)mcalloc(sizeof(uint), 1000);
	if ((stack == NULL) ||
	   (stackType == NULL))
		fatalError(FATAL_LOADING, "Failed to allocate stacks");

	filetab = (FILE**)mcalloc(sizeof(FILE*), NUM_FILES);
	if (filetab == NULL)
		fatalError(FATAL_LOADING, "Failed to allocate file table");
	filetab[0] = stdin;
	filetab[1] = stdout;
	filetab[2] = stderr;

	msg(MSG_DEBUG, "Stack data allocated at %lX", stack);
	msg(MSG_DEBUG, "Stack type allocated at %lX", stackType);
	msg(MSG_DEBUG, "Call stack allocated at %lX", callStack);

	load_arguments(argc-optbase, argv+optbase);

	while (!halt)
	{
		execute();
		GCCheck();
	}

	return 0;
}

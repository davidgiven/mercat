/* syscall/scr/unix.h
 * Bitmap text control (Unix curses version)
 * This is actually an include file included by syscall/scr.c, so we don't need
 * globals.h. Also, we can make certain assumptions (like that the SCR module
 * is being compiled in).
 */

#include <curses.h>
#include <sys/time.h>
#include <sys/types.h>
#include <unistd.h>

static int colour_table[8][8];
static int colour_index;
static int fg;
static int bg;
static int maxx;
static int maxy;

/* =========================================================================
                          SCR UI MODULE SYSTEM CALLS
   ========================================================================= */

/* --- Start up SCR -------------------------------------------------------- */

void sys_ScrInit(void)
{
	int f, b;

	/* Curses initialisation */

	initscr();
	start_color();
	noecho();
	cbreak();
	nonl();
	intrflush(stdscr, FALSE);
	keypad(stdscr, TRUE);
	meta(stdscr, TRUE);

	/* Initialise colour table */

	for(f=0; f<8; f++)
		for(b=0; b<8; b++)
			colour_table[f][b] = -1;
	
	colour_table[7][0] = 0;
	colour_index = 1;

	fg = 7;
	bg = 0;

	/* Cache screen size */

	getmaxyx(stdscr, maxy, maxx);
	maxx--;
	maxy--;

	/* Clear screen (though this shouldn't be necessary) */

	clear();
	refresh();
}

/* --- Shut down SCR ------------------------------------------------------- */

void sys_ScrShutdown(void)
{
	endwin();
}

/* --- Clear the screen ---------------------------------------------------- */

void sys_ScrClear(void)
{
	clear();
	refresh();
}

/* --- Move the cursor ----------------------------------------------------- */

void sys_ScrGotoXY(void)
{
	int y = popi();
	int x = popi();
	if (y < 0)
		y = 0;
	if (y > maxy)
		y = maxy;
	if (x < 0)
		x = 0;
	if (x > maxx)
		x = maxx;
	move(y, x);
	refresh();
}

/* --- Retrieve the cursor position ---------------------------------------- */

void sys_ScrGetX(void)
{
	int x, y;
	getyx(stdscr, y, x);
	pushi(x);
}

void sys_ScrGetY(void)
{
	int x, y;
	getyx(stdscr, y, x);
	pushi(y);
}

/* --- Get the screen size ------------------------------------------------- */

void sys_ScrWidth(void)
{
	pushi(maxx+1);
}

void sys_ScrHeight(void)
{
	pushi(maxy+1);
}

/* --- Reads a character --------------------------------------------------- */

void sys_ScrGetCh(void)
{
	int i = getch();
	if (i == 27)
		i = 512 + getch();
	pushi(i);
}

void sys_ScrKeyHit(void)
{
	fd_set readfds;
	struct timeval tv;

	FD_ZERO(&readfds);
	FD_SET(0, &readfds);
	tv.tv_sec = 0;
	tv.tv_usec = 0;

	pushi(select(1, &readfds, NULL, NULL, &tv) != 0);
}

/* --- Writes a string ----------------------------------------------------- */

void sys_ScrPutStr(void)
{
	Object* o = popo();

	CheckObjType(o, OBJ_STRING);
	if (o->size)
	{
		addnstr(o->ptr, o->size);
		refresh();
	}
}

/* --- Creates a derived window covering an area of screen ----------------- */

static WINDOW* create_derived_window(int x1, int y1, int x2, int y2)
{
	if (x1 < 0)
		x1 = 0;
	if (x1 >= maxx)
		x1 = maxx;
	if (y1 < 0)
		y1 = 0;
	if (y1 > maxy)
		y1 = maxy;
	if (x2 < 0)
		x2 = 0;
	if (x2 > maxx)
		x2 = maxx;
	if (y2 < 0)
		y2 = 0;
	if (y2 > maxy)
		y2 = maxy;

	return derwin(stdscr, y2-y1+1, x2-x1+1, y1, x1);
}
	
/* --- Clears an area ------------------------------------------------------ */

void sys_ScrClearArea(void)
{
	int y2 = popi();
	int x2 = popi();
	int y1 = popi();
	int x1 = popi();
	WINDOW* w = create_derived_window(x1, y1, x2, y2);

	if (w)
	{
		wclear(w);
		delwin(w);
	}
}

/* --- Colour operations --------------------------------------------------- */

static void setcolour(int f, int b)
{
	int i;

	f &= 7;
	b &= 7;
	i = colour_table[f][b];
	if (i == -1)
	{
		colour_table[f][b] = colour_index;
		init_pair(colour_index, f, b);
		i = colour_index;
		colour_index++;
	}
	attrset(COLOR_PAIR(i) | (f==2 ? A_BOLD : 0));
	bkgdset(COLOR_PAIR(i));
}

void sys_ScrSetFG(void)
{
	fg = popi();
	setcolour(fg, bg);
}

void sys_ScrSetBG(void)
{
	bg = popi();
	setcolour(fg, bg);
}

void sys_ScrSetFGBG(void)
{
	bg = popi();
	fg = popi();
	setcolour(fg, bg);
}

void sys_ScrFG(void)
{
	pushi(fg);
}

void sys_ScrBG(void)
{
	pushi(bg);
}



/* syscall/scr/msdos.h
 * Bitmap text control (MSDOS curses version)
 * This is actually an include file included by syscall/scr.c, so we don't need
 * globals.h. Also, we can make certain assumptions (like that the SCR module
 * is being compiled in).
 */

#include <conio.h>

static int keymap[256];
static int coltab[] = {BLACK, RED, GREEN, YELLOW, BLUE, MAGENTA, CYAN, WHITE};
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
	struct text_info ti;

	textmode(C80);
	_wscroll = 0;
	fg = 7;
	bg = 0;
	gettextinfo(&ti);
	maxx = ti.screenwidth-1;
	maxy = ti.screenheight-1;
}

/* --- Shut down SCR ------------------------------------------------------- */

void sys_ScrShutdown(void)
{
	textmode(C80);
}

/* --- Clear the screen ---------------------------------------------------- */

void sys_ScrClear(void)
{
	clrscr();
}

/* --- Move the cursor ----------------------------------------------------- */

void sys_ScrGotoXY(void)
{
	int y = popi();
	int x = popi();
	if (x<0)
		x = 0;
	if (x>maxx)
		x = maxx;
	if (y<0)
		y = 0;
	if (y>maxy)
		y = maxy;
	gotoxy(x+1, y+1);
}

/* --- Retrieve the cursor position ---------------------------------------- */

void sys_ScrGetX(void)
{
	pushi(wherex()-1);
}

void sys_ScrGetY(void)
{
	pushi(wherey()-1);
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
	int c = getch();
	if (c == 0)
		c = keymap[getch()];
	if (c == 8)
		c = 0407;
	pushi(c);
}

/* --- Tests if a character is pending ------------------------------------- */

void sys_ScrKeyHit(void)
{
	pushi(kbhit());
}

/* --- Writes a string ----------------------------------------------------- */

void sys_ScrPutStr(void)
{
	Object* o = popo();

	CheckObjType(o, OBJ_STRING);
	if (o->size)
	{
		char* p = o->ptr;
		int i = o->size;
		while(i--)
			putch(*p++);
	}
}

/* --- Clears an area ------------------------------------------------------ */

void sys_ScrClearArea(void)
{
	int y2 = popi();
	int x2 = popi();
	int y1 = popi();
	int x1 = popi();
	
	if (x1 < 0)
		x1 = 0;
	if (x1 > maxx)
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

	window(x1+1, y1+1, x2+1, y2+1);
	clrscr();
	window(1, 1, maxx+1, maxy+1);
}

/* --- Colour operations --------------------------------------------------- */

void sys_ScrSetFG(void)
{
	fg = popi() & 7;
	textcolor(coltab[fg]);
}

void sys_ScrSetBG(void)
{
	bg = popi() & 7;
	textbackground(coltab[bg]);
}

void sys_ScrSetFGBG(void)
{
	bg = popi() & 7;
	fg = popi() & 7;
	textcolor(coltab[fg]);
	textbackground(coltab[bg]);
}

void sys_ScrFG(void)
{
	pushi(fg);
}

void sys_ScrBG(void)
{
	pushi(bg);
}

/* =========================================================================
                              KEYBOARD MAPPING
   ========================================================================= */

/* These map extended keycodes to Mercat keycodes (er, curses keycodes). */

static int keymap[256] = {
	0,
	512+27,		/* 001	ALT+ESC */
	0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0,
	512+0407,	/* 014	ALT+<- */
	0,
	512+'q',	/* 016	ALT+q */
	512+'w',	/* 017	ALT+w */
	512+'e',	/* 018	ALT+e */
	512+'r',	/* 019	ALT+r */
	512+'t',	/* 020	ALT+t */
	512+'y',	/* 021	ALT+y */
	512+'u',	/* 022	ALT+u */
	512+'i',	/* 023	ALT+i */
	512+'o',	/* 024	ALT+o */
	512+'p',	/* 025	ALT+p */
	512+'[',	/* 026	ALT+[ */
	512+']',	/* 027	ALT+] */
	512+13,		/* 028	ALT+RETURN */
	0,
	512+'a',	/* 030	ALT+a */
	512+'s',	/* 031	ALT+s */
	512+'d',	/* 032	ALT+d */
	512+'f',	/* 033	ALT+f */
	512+'g',	/* 034	ALT+g */
	512+'h',	/* 035	ALT+h */
	512+'j',	/* 036	ALT+j */
	512+'k',	/* 037	ALT+k */
	512+'l',	/* 038	ALT+l */
	512+';',	/* 039	ALT+; */
	512+'\'',	/* 040	ALT+' */
	512+'`',	/* 041	ALT+` */
	0,
	512+'\\',	/* 043	ALT+\ */
	512+'z',	/* 044	ALT+z */
	512+'x',	/* 045	ALT+x */
	512+'c',	/* 046	ALT+c */
	512+'v',	/* 047	ALT+v */
	512+'b',	/* 048	ALT+b */
	512+'n',	/* 049	ALT+n */
	512+'m',	/* 050	ALT+m */
	512+',',	/* 051	ALT+, */
	512+'.',	/* 052	ALT+. */
	512+'/',	/* 053	ALT+/ */
	0, 0, 0, 0, 0,
	0411,		/* 059	F1 */
	0412,		/* 060	F2 */
	0413,		/* 061	F3 */
	0414,		/* 062	F4 */
	0415,		/* 063	F5 */
	0416,		/* 064	F6 */
	0417,		/* 065	F7 */
	0420,		/* 066	F8 */
	0421,		/* 067	F9 */
	0422,		/* 068	F10 */
	0, 0,
	0406,		/* 071	HOME */
	0403,		/* 072	UP */
	0523,		/* 073	PGUP */
	0,
	0404,		/* 075	LEFT */
	0,
	0405,		/* 077	RIGHT */
	0,
	0550,		/* 079	END */
	0402,		/* 080	DOWN */
	0522,		/* 081	PGDN */
	0513,		/* 082	INS */
	0512,		/* 083	DEL */
	0, 0, 0, 0, 0, 0, 0, /* ..90 */
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, /* ..100 */
	0, 0, 0,
	512+0411,	/* 104	ALT+F1 */
	512+0412,	/* 105	ALT+F2 */
	512+0413,	/* 106	ALT+F3 */
	512+0414,	/* 107	ALT+F4 */
	512+0415,	/* 108	ALT+F5 */
	512+0416,	/* 109	ALT+F6 */
	512+0417,	/* 110	ALT+F7 */
	512+0420,	/* 111	ALT+F8 */
	512+0421,	/* 112	ALT+F9 */
	512+0422,	/* 113	ALT+F10 */
	0, 0, 0, 0, 0, 0,
	512+'1',	/* 120	ALT+1 */
	512+'2',	/* 121	ALT+2 */
	512+'3',	/* 122	ALT+3 */
	512+'4',	/* 123	ALT+4 */
	512+'5',	/* 124	ALT+5 */
	512+'6',	/* 125	ALT+6 */
	512+'7',	/* 126	ALT+7 */
	512+'8',	/* 127	ALT+8 */
	512+'9',	/* 128	ALT+9 */
	512+'0',	/* 129	ALT+0 */
	512+'-',	/* 130	ALT+- */
	512+'=',	/* 131	ALT+= */
	0,
	0423,		/* 133	F11 */
	0424,		/* 134	F12 */
	0, 0, 0, 0,
	512+0423,	/* 139	ALT+F11 */
	512+0424,	/* 140	ALT+F12 */
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	512+0406,	/* 151	ALT+HOME */
	512+0403,	/* 152	ALT+UP  */
	512+0523,	/* 153	ALT+PGUP */
	0,
	512+0403,	/* 155	ALT+LEFT */
	0,
	512+0405,	/* 157	ALT+RIGHT */
	0,
	512+0550,	/* 159	ALT+END */
	512+0402,	/* 160	ALT+DOWN */
	512+0522,	/* 161	ALT+PGDN */
	512+0513,	/* 162	ALT+INS */
	512+0512,	/* 163	ALT+DEL */
	0,
	512+9,		/* 165	ALT+TAB */
};

/* =========================================================================
                                CHARACTER MAP
   ========================================================================= */

static uchar charmap[256] = {
/*0   1   2   3   4   5   6   7   8   9   A   B   C   D   E   F */
 ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ', /* 0 */
 ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ', /* 1 */
 ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ', /* 2 */
 ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ', /* 3 */
 '@','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O', /* 4 */
 'P','Q','R','S','T','U','V','W','X','Y','Z',' ',' ',' ',' ',' ', /* 5 */
 ' ','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o', /* 6 */
 'p','q','r','s','t','u','v','w','x','y','z',' ',' ',' ',' ','~', /* 7 */
 ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ', /* 8 */
 ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ', /* A */
 ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ', /* B */
 ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ', /* C */
 ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ', /* D */
 ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ', /* E */
 ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '  /* F */
};


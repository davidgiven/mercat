// Definitions for the SCR UI module
// (C) 1998 David Given

// --- Keyboard events -------------------------------------------------------

// --- UI standard functions -------------------------------------------------

inline int HasScr
{"sys HasScr"}

// -- SCR module functions ---------------------------------------------------

inline void ScrInit
{"sys ScrInit"}

inline void ScrShutdown
{"sys ScrShutdown"}

inline void ScrClear
{"sys ScrClear"}

inline void ScrGotoXY
	int x;
	int y;
{"sys ScrGotoXY"}

inline int ScrGetX
{"sys ScrGetX"}

inline int ScrGetY
{"sys ScrGetY"}

inline int ScrWidth
{"sys ScrWidth"}

inline int ScrHeight
{"sys ScrHeight"}

inline int ScrGetCh
{"sys ScrGetCh"}

inline int ScrKeyHit
{"sys ScrKeyHit"}

inline void ScrWaitCh
{"sys ScrGetCh\npopi"}

inline void ScrPutStr
	string s;
{"sys ScrPutStr"}

inline void ScrClearArea
	int x1;
	int y1;
	int x2;
	int y2;
{"sys ScrClearArea"}

inline void ScrSetFG
	int fg;
{"sys ScrSetFG"}

inline void ScrSetBG
	int bg;
{"sys ScrSetBG"}

inline void ScrSetFGBG
	int fg;
	int bg;
{"sys ScrSetFGBG"}

inline int ScrFG
{"sys ScrFG"}

inline int ScrBG
{"sys ScrBG"}

// --- Keycodes ---------------------------------------------------------------

global int KEY_ENTER		:= 13;
global int KEY_TAB		:= 9;
global int KEY_ESCAPE		:= 27;
global int KEY_BACKSPACE	:= 263;

global int KEY_LEFT		:= 260;
global int KEY_RIGHT		:= 261;
global int KEY_DOWN		:= 258;
global int KEY_UP		:= 259;

global int KEY_HOME		:= 262;
global int KEY_END		:= 360;
global int KEY_DELETE		:= 330;
global int KEY_PGDN		:= 338;
global int KEY_PGUP		:= 339;

end;

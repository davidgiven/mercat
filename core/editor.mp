	line 1
# // ME
	line 2
# // The Mercat Editor
	line 3
# // (C) 1998 David Given
	line 4
# // This is primarily a demo program, though with a bit of work it could be a
	line 5
# // fully functional full-screen editor. The menu bar library which is currently
	line 6
# // integrated into this program will eventually be exported as a stand-alone
	line 7
# // library, though without function pointers it can't be properly abstracted.
	line 8
# 
	line 9
# library standard;
	line 2
# // Mercat standard library
	line 3
# // (More of an include file, really)
	line 4
# // (C) 1998 David Given
	line 5
# 
	line 6
# // --- Application control ---------------------------------------------------
	line 7
# 
	line 8
# inline array string AppGetArguments
	line 9
# {"sys AppGetArguments"}
	line 10
# 
	line 11
# inline string AppGetErrorString
	line 12
# {"sys AppGetErrorString"}
	line 13
# 
	line 14
# inline void AppExit
	line 15
# 	int exitcode;
	line 16
# {"sys AppExit"}
	line 17
# 
	line 18
# // --- Number stuff ----------------------------------------------------------
	line 19
# 
	line 20
# inline int RandomNumber
	line 21
# 	int range;
	line 22
# {"sys RandomNumber"}
	line 23
# 
	line 24
# inline void RandomSetSeed
	line 25
# 	int seed;
	line 26
# {"sys RandomSetSeed"}
	line 27
# 
	line 28
# // --- Basic I/O -------------------------------------------------------------
	line 29
# 
	line 30
# inline void PrintString
	line 31
# 	int stream;
	line 32
# 	string message;
	line 33
# {"sys PrintString"}
	line 34
# 
	line 35
# inline void PrintInt
	line 36
# 	int stream;
	line 37
# 	int value;
	line 38
# {"sys PrintInt"}
	line 39
# 
	line 40
# inline void PrintNL
	line 41
# 	int stream;
	line 42
# {"sys PrintNL"}
	line 43
# 
	line 44
# // --- Stream I/O ------------------------------------------------------------
	line 45
# 
	line 46
# inline int StreamOpenFile
	line 47
# 	string filename;
	line 48
# 	string flags;
	line 49
# {"sys StreamOpenFile"}
	line 50
# 
	line 51
# inline void StreamClose
	line 52
# 	int stream;
	line 53
# {"sys StreamClose"}
	line 54
# 
	line 55
# inline void StreamFlush
	line 56
# 	int stream;
	line 57
# {"sys StreamFlush"}
	line 58
# 
	line 59
# inline string StreamReadChar
	line 60
# 	int stream;
	line 61
# {"sys StreamReadChar"}
	line 62
# 
	line 63
# inline void StreamWriteByte
	line 64
# 	int stream;
	line 65
# 	int value;
	line 66
# {"sys StreamWriteByte"}
	line 67
# 
	line 68
# inline string StreamReadLine
	line 69
# 	int stream;
	line 70
# {"sys StreamReadLine"}
	line 71
# 
	line 72
# inline void StreamSeek
	line 73
# 	int stream;
	line 74
# 	int pos;
	line 75
# {"sys StreamSeek"}
	line 76
# 
	line 77
# inline int StreamTell
	line 78
# 	int stream;
	line 79
# {"sys StreamTell"}
	line 80
# 
	line 81
# inline int StreamLength
	line 82
# 	int stream;
	line 83
# {"sys StreamLength"}
	line 84
# 
	line 85
# inline int StreamEOF
	line 86
# 	int stream;
	line 87
# {"sys StreamEOF"}
	line 88
# 
	line 89
# global int stdin := 0;
# global stdin of type int at 1
	pushi 0
	line 90
# global int stdout := 1;
# global stdout of type int at 2
	pushi 1
	line 91
# global int stderr := 2;
# global stderr of type int at 3
	pushi 2
	line 92
# 
	line 93
# // --- String identification ------------------------------------------------
	line 94
# 
	line 95
# inline int IsWhiteSpace
	line 96
# 	string s;
	line 97
# {"sys IsWhiteSpace"}
	line 98
# 
	line 99
# inline int IsDigit
	line 100
# 	string s;
	line 101
# {"sys IsDigit"}
	line 102
# 
	line 103
# inline int IsHexDigit
	line 104
# 	string s;
	line 105
# {"sys IsHexDigit"}
	line 106
# 
	line 107
# inline int IsAlpha
	line 108
# 	string s;
	line 109
# {"sys IsAlpha"}
	line 110
# 
	line 111
# inline int IsAlphaNumeric
	line 112
# 	string s;
	line 113
# {"sys IsAlphaNumeric"}
	line 114
# 
	line 115
# // --- String manipulation ---------------------------------------------------
	line 116
# 
	line 117
# inline int StringToInt
	line 118
# 	string s;
	line 119
# {"pushi 10\n
	line 120
# sys StringToIntRadix"}
	line 121
# 
	line 122
# inline int StringToIntRadix
	line 123
# 	string s;
	line 124
# 	int radix;
	line 125
# {"sys StringToIntRadix"}
	line 126
# 
	line 127
# inline string IntToString
	line 128
# 	int l;
	line 129
# {"pushi 10\n
	line 130
# sys IntToStringRadix"}
	line 131
# 
	line 132
# inline string IntToStringRadix
	line 133
# 	int l;
	line 134
# 	int radix;
	line 135
# {"sys IntToStringRadix"}
	line 136
# 
	line 137
# inline string StringMid
	line 138
# 	string s;
	line 139
# 	int from;
	line 140
# 	int to;
	line 141
# {"sys StringMid"}
	line 142
# 
	line 143
# inline int StringInstr
	line 144
# 	string s;
	line 145
# 	string target;
	line 146
# 	int start;
	line 147
# {"sys StringInstr"}
	line 148
# 
	line 149
# inline int StringByte
	line 150
# 	string s;
	line 151
# {"sys StringByte"}
	line 152
# 
	line 153
# inline string ByteString
	line 154
# 	int c;
	line 155
# {"sys ByteString"}
	line 156
# 
	line 157
# inline string StringStrip
	line 158
# 	string s;
	line 159
# {"sys StringStrip"}
	line 160
# 
	line 161
# function string StringDup
	line 162
# 	int n;
# argument n of type int at 0
	line 163
# 	string s;
# argument s of type string at 1
	line 164
# {
	jump _0
: StringDup
	line 165
# 	string r := "";
# local r of type string at 2
	pusho ""
	line 166
# 	while(n>0)
: _1
	line 167
# 	{
	peeki 0
	pushi 0
	sub
	bgt _3
	pushi 1
	jump _4
: _3
	pushi 0
: _4
	bne _2
	line 168
# 		r := r + s;
	peeko -2
	peeko -1
	concat
	pokeo -2

	line 169
# 		n := n - 1;
	peeki 0
	pushi 1
	sub
	pokei 0

	line 170
# 	}
	jump _1
: _2
	line 171
# 	return r;
	peeko -2
	saveo
	jump _return_StringDup

	line 172
# }
	pushi 0
	savei
: _return_StringDup
# retract over local var r
	popo
# retract over local var s
	popo
# retract over local var n
	popi
	return
: _0
	line 173
# 
	line 174
# inline string StringUpper
	line 175
# 	string s;
	line 176
# {"sys StringUpper"}
	line 177
# 
	line 178
# inline string StringLower
	line 179
# 	string s;
	line 180
# {"sys StringLower"}
	line 181
# 
	line 182
# inline array byte StringToByteArray
	line 183
# 	string s;
	line 184
# {"sys StringToByteArray"}
	line 185
# 
	line 186
# inline string ByteArrayToString
	line 187
# 	array byte a;
	line 188
# {"sys ByteArrayToString"}
	line 189
# 
	line 190
# // --- Time stuff -----------------------------------------------------------
	line 191
# 
	line 192
# inline int TimeNow
	line 193
# {"sys TimeNow"}
	line 194
# 
	line 195
# inline void TimeSleep
	line 196
# 	int delay;
	line 197
# {"sys TimeSleep"}
	line 198
# 
	line 199
# inline void TimeSleepUntil
	line 200
# 	int time;
	line 201
# {"sys TimeSleepUntil"}
	line 202
# 
	line 203
# // --- Debugging stuff ------------------------------------------------------
	line 204
# 
	line 205
# inline void DebugPrintDictArrayLong
	line 206
# 	dict array int d;
	line 207
# {"sys DebugPrintObj"}
	line 208
# 
	line 209
# inline void DebugPrintDictLong
	line 210
# 	dict int d;
	line 211
# {"sys DebugPrintObj"}
	line 212
# 
	line 213
# end;
	line 10
# library scr;
	line 2
# // Definitions for the SCR UI module
	line 3
# // (C) 1998 David Given
	line 4
# 
	line 5
# // --- Keyboard events -------------------------------------------------------
	line 6
# 
	line 7
# // --- UI standard functions -------------------------------------------------
	line 8
# 
	line 9
# inline int HasScr
	line 10
# {"sys HasScr"}
	line 11
# 
	line 12
# // -- SCR module functions ---------------------------------------------------
	line 13
# 
	line 14
# inline void ScrInit
	line 15
# {"sys ScrInit"}
	line 16
# 
	line 17
# inline void ScrShutdown
	line 18
# {"sys ScrShutdown"}
	line 19
# 
	line 20
# inline void ScrClear
	line 21
# {"sys ScrClear"}
	line 22
# 
	line 23
# inline void ScrGotoXY
	line 24
# 	int x;
	line 25
# 	int y;
	line 26
# {"sys ScrGotoXY"}
	line 27
# 
	line 28
# inline int ScrGetX
	line 29
# {"sys ScrGetX"}
	line 30
# 
	line 31
# inline int ScrGetY
	line 32
# {"sys ScrGetY"}
	line 33
# 
	line 34
# inline int ScrWidth
	line 35
# {"sys ScrWidth"}
	line 36
# 
	line 37
# inline int ScrHeight
	line 38
# {"sys ScrHeight"}
	line 39
# 
	line 40
# inline int ScrGetCh
	line 41
# {"sys ScrGetCh"}
	line 42
# 
	line 43
# inline int ScrKeyHit
	line 44
# {"sys ScrKeyHit"}
	line 45
# 
	line 46
# inline void ScrWaitCh
	line 47
# {"sys ScrGetCh\npopi"}
	line 48
# 
	line 49
# inline void ScrPutStr
	line 50
# 	string s;
	line 51
# {"sys ScrPutStr"}
	line 52
# 
	line 53
# inline void ScrClearArea
	line 54
# 	int x1;
	line 55
# 	int y1;
	line 56
# 	int x2;
	line 57
# 	int y2;
	line 58
# {"sys ScrClearArea"}
	line 59
# 
	line 60
# inline void ScrSetFG
	line 61
# 	int fg;
	line 62
# {"sys ScrSetFG"}
	line 63
# 
	line 64
# inline void ScrSetBG
	line 65
# 	int bg;
	line 66
# {"sys ScrSetBG"}
	line 67
# 
	line 68
# inline void ScrSetFGBG
	line 69
# 	int fg;
	line 70
# 	int bg;
	line 71
# {"sys ScrSetFGBG"}
	line 72
# 
	line 73
# inline int ScrFG
	line 74
# {"sys ScrFG"}
	line 75
# 
	line 76
# inline int ScrBG
	line 77
# {"sys ScrBG"}
	line 78
# 
	line 79
# // --- Keycodes ---------------------------------------------------------------
	line 80
# 
	line 81
# global int KEY_ENTER		:= 13;
# global KEY_ENTER of type int at 4
	pushi 13
	line 82
# global int KEY_TAB		:= 9;
# global KEY_TAB of type int at 5
	pushi 9
	line 83
# global int KEY_ESCAPE		:= 27;
# global KEY_ESCAPE of type int at 6
	pushi 27
	line 84
# global int KEY_BACKSPACE	:= 263;
# global KEY_BACKSPACE of type int at 7
	pushi 263
	line 85
# 
	line 86
# global int KEY_LEFT		:= 260;
# global KEY_LEFT of type int at 8
	pushi 260
	line 87
# global int KEY_RIGHT		:= 261;
# global KEY_RIGHT of type int at 9
	pushi 261
	line 88
# global int KEY_DOWN		:= 258;
# global KEY_DOWN of type int at 10
	pushi 258
	line 89
# global int KEY_UP		:= 259;
# global KEY_UP of type int at 11
	pushi 259
	line 90
# 
	line 91
# global int KEY_HOME		:= 262;
# global KEY_HOME of type int at 12
	pushi 262
	line 92
# global int KEY_END		:= 360;
# global KEY_END of type int at 13
	pushi 360
	line 93
# global int KEY_DELETE		:= 330;
# global KEY_DELETE of type int at 14
	pushi 330
	line 94
# global int KEY_PGDN		:= 338;
# global KEY_PGDN of type int at 15
	pushi 338
	line 95
# global int KEY_PGUP		:= 339;
# global KEY_PGUP of type int at 16
	pushi 339
	line 96
# 
	line 97
# end;
	line 11
# library scrx;
	line 2
# // Extensions to the SCR UI module
	line 3
# // (C) 1998 David Given
	line 4
# 
	line 5
# // --- Reads in a string ------------------------------------------------------
	line 6
# 
	line 7
# function string ScrXReadString
	line 8
# 	int x;
# argument x of type int at 0
	line 9
# 	int y;
# argument y of type int at 1
	line 10
# 	int length;
# argument length of type int at 2
	line 11
# 	string s;
# argument s of type string at 3
	line 12
# {
	jump _5
: ScrXReadString
	line 13
# 	int offset := 0;
# local offset of type int at 4
	pushi 0
	line 14
# 	int cursor := sizeof(s);
# local cursor of type int at 5
	peeko -3
	size
	line 15
# 	int c;
# local c of type int at 6
	pushi 0
	line 16
# 
	line 17
# 	if (cursor > length)
	line 18
# 		offset := cursor - length - 1;
	peeki -5
	peeki -2
	sub
	bgt _8
	pushi 1
	jump _9
: _8
	pushi 0
: _9
	bne _6
	peeki -5
	peeki -2
	pushi 1
	sub
	sub
	pokei -4

	line 19
# 
	line 20
# 	do {
: _6
: _7
: _10
	line 21
# 		ScrGotoXY(x, y);
	peeki 0
	peeki -1
	sys ScrGotoXY

	line 22
# 		ScrPutStr(StringMid(s, offset, length));
	peeko -3
	peeki -4
	peeki -2
	sys StringMid
	sys ScrPutStr

	line 23
# 		if (sizeof(s) - offset < length)
	line 24
# 			ScrPutStr(StringDup(length - sizeof(s) - offset, " "));
	peeko -3
	size
	peeki -4
	sub
	peeki -2
	sub
	blt _14
	pushi 1
	jump _15
: _14
	pushi 0
: _15
	bne _12
	pushfp
	peeki -2
	peeko -3
	size
	peeki -4
	sub
	sub
	pusho " "
	call StringDup
	loado
	sys ScrPutStr

	line 25
# 		ScrGotoXY(x + cursor - offset, y);
: _12
: _13
	peeki 0
	peeki -5
	peeki -4
	sub
	add
	peeki -1
	sys ScrGotoXY

	line 26
# 
	line 27
# 		c := ScrGetCh();
	sys ScrGetCh
	pokei -6

	line 28
# 		if (((c == KEY_LEFT) or (c == 2)) and (cursor > 0))
	line 29
# 			cursor := cursor - 1;
	peeki -6
	peeki 8
	sub
	itb
	not
	peeki -6
	pushi 2
	sub
	itb
	not
	or
	peeki -5
	pushi 0
	sub
	bgt _18
	pushi 1
	jump _19
: _18
	pushi 0
: _19
	and
	bne _16
	peeki -5
	pushi 1
	sub
	pokei -5

	line 30
# 		else if (((c == KEY_RIGHT) or (c == 6)) and (cursor < sizeof(s)))
	jump _17
: _16
	line 31
# 			cursor := cursor + 1;
	peeki -6
	peeki 9
	sub
	itb
	not
	peeki -6
	pushi 6
	sub
	itb
	not
	or
	peeki -5
	peeko -3
	size
	sub
	blt _22
	pushi 1
	jump _23
: _22
	pushi 0
: _23
	and
	bne _20
	peeki -5
	pushi 1
	add
	pokei -5

	line 32
# 		else if ((c == KEY_HOME) or (c == 1))
	jump _21
: _20
	line 33
# 			cursor := 0;
	peeki -6
	peeki 12
	sub
	itb
	not
	peeki -6
	pushi 1
	sub
	itb
	not
	or
	bne _24
	pushi 0
	pokei -5

	line 34
# 		else if ((c == KEY_END) or (c == 5))
	jump _25
: _24
	line 35
# 			cursor := sizeof(s);
	peeki -6
	peeki 13
	sub
	itb
	not
	peeki -6
	pushi 5
	sub
	itb
	not
	or
	bne _26
	peeko -3
	size
	pokei -5

	line 36
# 		else if ((c == KEY_DELETE) or (c == 4))
	jump _27
: _26
	line 37
# 		{
	peeki -6
	peeki 14
	sub
	itb
	not
	peeki -6
	pushi 4
	sub
	itb
	not
	or
	bne _28
	line 38
# 			if (cursor == 0)
	line 39
# 				s := StringMid(s, 1, -1);
	peeki -5
	pushi 0
	sub
	itb
	not
	bne _30
	peeko -3
	pushi 1
	pushi -1
	sys StringMid
	pokeo -3

	line 40
# 			else if (cursor == sizeof(s))
	jump _31
: _30
	line 41
# 			{
	peeki -5
	peeko -3
	size
	sub
	itb
	not
	bne _32
	line 42
# 			}
	line 43
# 			else
	line 44
# 			{
	jump _33
: _32
	line 45
# 				s := StringMid(s, 0, cursor) +
	peeko -3
	pushi 0
	peeki -5
	sys StringMid
	line 46
# 					StringMid(s, cursor+1, -1);
	peeko -3
	peeki -5
	pushi 1
	add
	pushi -1
	sys StringMid
	concat
	pokeo -3

	line 47
# 			}
: _33
: _31
	line 48
# 		}
	line 49
# 		else if (c == KEY_BACKSPACE)
	jump _29
: _28
	line 50
# 		{
	peeki -6
	peeki 7
	sub
	itb
	not
	bne _34
	line 51
# 			if (cursor == 0)
	line 52
# 			{
	peeki -5
	pushi 0
	sub
	itb
	not
	bne _36
	line 53
# 			}
	line 54
# 			else if (cursor == sizeof(s))
	jump _37
: _36
	line 55
# 			{
	peeki -5
	peeko -3
	size
	sub
	itb
	not
	bne _38
	line 56
# 				s := StringMid(s, 0, sizeof(s)-1);
	peeko -3
	pushi 0
	peeko -3
	size
	pushi 1
	sub
	sys StringMid
	pokeo -3

	line 57
# 				cursor := cursor - 1;
	peeki -5
	pushi 1
	sub
	pokei -5

	line 58
# 			}
	line 59
# 			else
	line 60
# 			{
	jump _39
: _38
	line 61
# 				s := StringMid(s, 0, cursor-1) +
	peeko -3
	pushi 0
	peeki -5
	pushi 1
	sub
	sys StringMid
	line 62
# 					StringMid(s, cursor, -1);
	peeko -3
	peeki -5
	pushi -1
	sys StringMid
	concat
	pokeo -3

	line 63
# 				cursor := cursor - 1;
	peeki -5
	pushi 1
	sub
	pokei -5

	line 64
# 			}
: _39
: _37
	line 65
# 		}
	line 66
# 		else if ((c >= 32) and (c <= 126))
	jump _35
: _34
	line 67
# 		{
	peeki -6
	pushi 32
	sub
	bge _42
	pushi 1
	jump _43
: _42
	pushi 0
: _43
	peeki -6
	pushi 126
	sub
	ble _44
	pushi 1
	jump _45
: _44
	pushi 0
: _45
	and
	bne _40
	line 68
# 			if (cursor == 0)
	line 69
# 				s := ByteString(c) + s;
	peeki -5
	pushi 0
	sub
	itb
	not
	bne _46
	peeki -6
	sys ByteString
	peeko -3
	concat
	pokeo -3

	line 70
# 			else if (cursor == sizeof(s))
	jump _47
: _46
	line 71
# 				s := s + ByteString(c);
	peeki -5
	peeko -3
	size
	sub
	itb
	not
	bne _48
	peeko -3
	peeki -6
	sys ByteString
	concat
	pokeo -3

	line 72
# 			else
	line 73
# 				s := StringMid(s, 0, cursor) + ByteString(c) +
	jump _49
: _48
	peeko -3
	pushi 0
	peeki -5
	sys StringMid
	peeki -6
	sys ByteString
	line 74
# 					StringMid(s, cursor, -1);
	peeko -3
	peeki -5
	pushi -1
	sys StringMid
	concat
	concat
	pokeo -3

: _49
: _47
	line 75
# 			cursor := cursor + 1;
	peeki -5
	pushi 1
	add
	pokei -5

	line 76
# 		}
	line 77
# 				
	line 78
# 		if (cursor < offset)
: _40
: _41
: _35
: _29
: _27
: _25
: _21
: _17
	line 79
# 			offset := cursor;
	peeki -5
	peeki -4
	sub
	blt _52
	pushi 1
	jump _53
: _52
	pushi 0
: _53
	bne _50
	peeki -5
	pokei -4

	line 80
# 		if (cursor > (offset+length-1))
: _50
: _51
	line 81
# 			offset := cursor - length - 1;
	peeki -5
	peeki -4
	peeki -2
	pushi 1
	sub
	add
	sub
	bgt _56
	pushi 1
	jump _57
: _56
	pushi 0
: _57
	bne _54
	peeki -5
	peeki -2
	pushi 1
	sub
	sub
	pokei -4

	line 82
# 	} while(c != KEY_ENTER);
: _54
: _55
	peeki -6
	peeki 4
	sub
	itb
	beq _10
: _11
	line 83
# 
	line 84
# 	return s;
	peeko -3
	saveo
	jump _return_ScrXReadString

	line 85
# }
	pushi 0
	savei
: _return_ScrXReadString
# retract over local var c
	popi
# retract over local var cursor
	popi
# retract over local var offset
	popi
# retract over local var s
	popo
# retract over local var length
	popi
# retract over local var y
	popi
# retract over local var x
	popi
	return
: _5
	line 86
# 
	line 87
# end;
	line 12
# 
	line 13
# // ===========================================================================
	line 14
# //                            MENU BAR LIBRARY
	line 15
# // ===========================================================================
	line 16
# 
	line 17
# // Describes an entry in a menu.
	line 18
# 
	line 19
# structure MenuItem := {
	line 20
# 	string label;		// Thing that is displayed in the menu
	line 21
# 	int mnemonic;		// Quick-access character
	line 22
# 	int event;		// Event code
	line 23
# };
	line 24
# 
	line 25
# // Describes a complete menu.
	line 26
# 
	line 27
# structure Menu := {
	line 28
# 	string label;		// Menu title
	line 29
# 	int mnemonic;		// Quick-access character
	line 30
# 	array MenuItem item;	// Entries in menu
	line 31
# 	int x;			// X ordinate of menu
	line 32
# 	int width;		// Width of menu
	line 33
# };
	line 34
# 
	line 35
# // --- Initialise a menubar --------------------------------------------------
	line 36
# 
	line 37
# function void MenuInitialise
	line 38
# 	array Menu menubar;
# argument menubar of type array Menu at 0
	line 39
# {
	jump _58
: MenuInitialise
	line 40
# 	int i;
# local i of type int at 1
	pushi 0
	line 41
# 	int j;
# local j of type int at 2
	pushi 0
	line 42
# 	int x := 1;
# local x of type int at 3
	pushi 1
	line 43
# 	int w;
# local w of type int at 4
	pushi 0
	line 44
# 	string label;
# local label of type string at 5
	pusho ""
	line 45
# 
	line 46
# 	for(i:=0; i<sizeof(menubar); i:=i+1)
	pushi 0
	pokei -1
: _59
	peeki -1
	peeko 0
	size
	sub
	blt _61
	pushi 1
	jump _62
: _61
	pushi 0
: _62
	bne _60
	line 47
# 	{
	line 48
# 		menubar[i].x := x;
	peeki -3
	i2o
	peeko 0
	peeki -1
	geta
	pushi 3
	seta

	line 49
# 		w := sizeof(menubar[i].label);
	peeko 0
	peeki -1
	geta
	pushi 0
	geta
	size
	pokei -4

	line 50
# 		x := x + 2 + w;
	peeki -3
	pushi 2
	peeki -4
	add
	add
	pokei -3

	line 51
# 		for(j:=0; j<sizeof(menubar[i].item); j:=j+1)
	pushi 0
	pokei -2
: _63
	peeki -2
	peeko 0
	peeki -1
	geta
	pushi 2
	geta
	size
	sub
	blt _65
	pushi 1
	jump _66
: _65
	pushi 0
: _66
	bne _64
	line 52
# 		{
	line 53
# 			label := menubar[i].item[j].label;
	peeko 0
	peeki -1
	geta
	pushi 2
	geta
	peeki -2
	geta
	pushi 0
	geta
	pokeo -5

	line 54
# 			if (sizeof(label) > w)
	line 55
# 				w := sizeof(label);
	peeko -5
	size
	peeki -4
	sub
	bgt _69
	pushi 1
	jump _70
: _69
	pushi 0
: _70
	bne _67
	peeko -5
	size
	pokei -4

	line 56
# 		}
: _67
: _68
	peeki -2
	pushi 1
	add
	pokei -2

	jump _63
: _64
	line 57
# 		menubar[i].width := w;
	peeki -4
	i2o
	peeko 0
	peeki -1
	geta
	pushi 4
	seta

	line 58
# 	}
	peeki -1
	pushi 1
	add
	pokei -1

	jump _59
: _60
	line 59
# }
: _return_MenuInitialise
# retract over local var label
	popo
# retract over local var w
	popi
# retract over local var x
	popi
# retract over local var j
	popi
# retract over local var i
	popi
# retract over local var menubar
	popo
	return
: _58
	line 60
# 
	line 61
# // --- Output a string with highlight ----------------------------------------
	line 62
# 
	line 63
# function void MenuWriteHighlighted
	line 64
# 	string msg;
# argument msg of type string at 0
	line 65
# 	string high;
# argument high of type string at 1
	line 66
# 	int fg;
# argument fg of type int at 2
	line 67
# 	int bg;
# argument bg of type int at 3
	line 68
# 	int hfg;
# argument hfg of type int at 4
	line 69
# {
	jump _71
: MenuWriteHighlighted
	line 70
# 	string c;
# local c of type string at 5
	pusho ""
	line 71
# 	int size := sizeof(msg);
# local size of type int at 6
	peeko 0
	size
	line 72
# 	int i;
# local i of type int at 7
	pushi 0
	line 73
# 
	line 74
# 	high := StringUpper(high);
	peeko -1
	sys StringUpper
	pokeo -1

	line 75
# 	ScrSetBG(bg);
	peeki -3
	sys ScrSetBG

	line 76
# 	for(i:=0; i<size; i:=i+1)
	pushi 0
	pokei -7
: _72
	peeki -7
	peeki -6
	sub
	blt _74
	pushi 1
	jump _75
: _74
	pushi 0
: _75
	bne _73
	line 77
# 	{
	line 78
# 		c := msg[i];
	peeko 0
	peeki -7
	pushi 1
	sys StringMid
	pokeo -5

	line 79
# 		if (high == StringUpper(c))
	line 80
# 		{
	peeko -1
	peeko -5
	sys StringUpper
	strcmp
	itb
	not
	bne _76
	line 81
# 			ScrSetFG(hfg);
	peeki -4
	sys ScrSetFG

	line 82
# 			high := "";
	pusho ""
	pokeo -1

	line 83
# 		}
	line 84
# 		else
	line 85
# 			ScrSetFG(fg);
	jump _77
: _76
	peeki -2
	sys ScrSetFG

: _77
	line 86
# 		ScrPutStr(c);
	peeko -5
	sys ScrPutStr

	line 87
# 	}
	peeki -7
	pushi 1
	add
	pokei -7

	jump _72
: _73
	line 88
# }
: _return_MenuWriteHighlighted
# retract over local var i
	popi
# retract over local var size
	popi
# retract over local var c
	popo
# retract over local var hfg
	popi
# retract over local var bg
	popi
# retract over local var fg
	popi
# retract over local var high
	popo
# retract over local var msg
	popo
	return
: _71
	line 89
# 
	line 90
# // --- Draws the status bar --------------------------------------------------
	line 91
# 
	line 92
# function void MenuSetStatus
	line 93
# 	string s;
# argument s of type string at 0
	line 94
# {
	jump _78
: MenuSetStatus
	line 95
# 	ScrSetFGBG(0, 6);
	pushi 0
	pushi 6
	sys ScrSetFGBG

	line 96
# 	ScrGotoXY(0, ScrHeight()-1);
	pushi 0
	sys ScrHeight
	pushi 1
	sub
	sys ScrGotoXY

	line 97
# 	ScrPutStr(StringDup(ScrWidth(), " "));
	pushfp
	sys ScrWidth
	pusho " "
	call StringDup
	loado
	sys ScrPutStr

	line 98
# 	ScrGotoXY(1, ScrHeight()-1);
	pushi 1
	sys ScrHeight
	pushi 1
	sub
	sys ScrGotoXY

	line 99
# 	ScrPutStr(s);
	peeko 0
	sys ScrPutStr

	line 100
# }
: _return_MenuSetStatus
# retract over local var s
	popo
	return
: _78
	line 101
# 	
	line 102
# // --- Draws a menubar -------------------------------------------------------
	line 103
# 
	line 104
# function void MenuBarDraw
	line 105
# 	array Menu menubar;
# argument menubar of type array Menu at 0
	line 106
# {
	jump _79
: MenuBarDraw
	line 107
# 	int i;
# local i of type int at 1
	pushi 0
	line 108
# 	
	line 109
# 	ScrSetFGBG(0, 6);
	pushi 0
	pushi 6
	sys ScrSetFGBG

	line 110
# 	ScrGotoXY(0, 0);
	pushi 0
	pushi 0
	sys ScrGotoXY

	line 111
# 	ScrPutStr(StringDup(ScrWidth(), " "));
	pushfp
	sys ScrWidth
	pusho " "
	call StringDup
	loado
	sys ScrPutStr

	line 112
# 	for(i:=0; i<sizeof(menubar); i:=i+1)
	pushi 0
	pokei -1
: _80
	peeki -1
	peeko 0
	size
	sub
	blt _82
	pushi 1
	jump _83
: _82
	pushi 0
: _83
	bne _81
	line 113
# 	{
	line 114
# 		ScrGotoXY(menubar[i].x, 0);
	peeko 0
	peeki -1
	geta
	pushi 3
	geta
	o2i
	pushi 0
	sys ScrGotoXY

	line 115
# 		ScrPutStr(" ");
	pusho " "
	sys ScrPutStr

	line 116
# 		MenuWriteHighlighted(menubar[i].label, ByteString(menubar[i].mnemonic), 0, 6, 7);
	pushfp
	peeko 0
	peeki -1
	geta
	pushi 0
	geta
	peeko 0
	peeki -1
	geta
	pushi 1
	geta
	o2i
	sys ByteString
	pushi 0
	pushi 6
	pushi 7
	call MenuWriteHighlighted

	line 117
# 		ScrPutStr("  ");
	pusho "  "
	sys ScrPutStr

	line 118
# 	}
	peeki -1
	pushi 1
	add
	pokei -1

	jump _80
: _81
	line 119
# }
: _return_MenuBarDraw
# retract over local var i
	popi
# retract over local var menubar
	popo
	return
: _79
	line 120
# 
	line 121
# // --- Get a character and process events ------------------------------------
	line 122
# 
	line 123
# function int MenuGetCh
	line 124
# 	array Menu menubar;
# argument menubar of type array Menu at 0
	line 125
# {
	jump _84
: MenuGetCh
	line 126
# 	int key := ScrGetCh();
# local key of type int at 1
	sys ScrGetCh
	line 127
# 	int pkey;
# local pkey of type int at 2
	pushi 0
	line 128
# 	int i;
# local i of type int at 3
	pushi 0
	line 129
# 
	line 130
# 	if (key >= 512)
	line 131
# 	{
	peeki -1
	pushi 512
	sub
	bge _87
	pushi 1
	jump _88
: _87
	pushi 0
: _88
	bne _85
	line 132
# 		// Possibly a menu event
	line 133
# 		pkey := key - 512;
	peeki -1
	pushi 512
	sub
	pokei -2

	line 134
# 		if ((pkey >= 97) and (pkey <= 122))
	line 135
# 			pkey := pkey - 32;
	peeki -2
	pushi 97
	sub
	bge _91
	pushi 1
	jump _92
: _91
	pushi 0
: _92
	peeki -2
	pushi 122
	sub
	ble _93
	pushi 1
	jump _94
: _93
	pushi 0
: _94
	and
	bne _89
	peeki -2
	pushi 32
	sub
	pokei -2

	line 136
# 		if ((pkey >= 65) and (pkey <= 90))
: _89
: _90
	line 137
# 		{
	peeki -2
	pushi 65
	sub
	bge _97
	pushi 1
	jump _98
: _97
	pushi 0
: _98
	peeki -2
	pushi 90
	sub
	ble _99
	pushi 1
	jump _100
: _99
	pushi 0
: _100
	and
	bne _95
	line 138
# 			for (i:=0; i<sizeof(menubar); i:=i+1)
	pushi 0
	pokei -3
: _101
	peeki -3
	peeko 0
	size
	sub
	blt _103
	pushi 1
	jump _104
: _103
	pushi 0
: _104
	bne _102
	line 139
# 				if (menubar[i].mnemonic == pkey)
	line 140
# 					return MenuProcess(menubar, i);
	peeko 0
	peeki -3
	geta
	pushi 1
	geta
	o2i
	peeki -2
	sub
	itb
	not
	bne _105
	pushfp
	peeko 0
	peeki -3
	call MenuProcess
	loadi
	savei
	jump _return_MenuGetCh

	line 141
# 		}
: _105
: _106
	peeki -3
	pushi 1
	add
	pokei -3

	jump _101
: _102
	line 142
# 	}
: _95
: _96
	line 143
# 	return key;
: _85
: _86
	peeki -1
	savei
	jump _return_MenuGetCh

	line 144
# }
	pushi 0
	savei
: _return_MenuGetCh
# retract over local var i
	popi
# retract over local var pkey
	popi
# retract over local var key
	popi
# retract over local var menubar
	popo
	return
: _84
	line 145
# 
	line 146
# // --- Looks up a shortcut in a menu -----------------------------------------
	line 147
# 
	line 148
# function int MenuFindEntryFromShortcut
	line 149
# 	array MenuItem menu;
# argument menu of type array MenuItem at 0
	line 150
# 	int shortcut;
# argument shortcut of type int at 1
	line 151
# {
	jump _107
: MenuFindEntryFromShortcut
	line 152
# 	int size := sizeof(menu);
# local size of type int at 2
	peeko 0
	size
	line 153
# 	int i;
# local i of type int at 3
	pushi 0
	line 154
# 
	line 155
# 	for (i:=0; i<size; i:=i+1)
	pushi 0
	pokei -3
: _108
	peeki -3
	peeki -2
	sub
	blt _110
	pushi 1
	jump _111
: _110
	pushi 0
: _111
	bne _109
	line 156
# 		if (menu[i].mnemonic == shortcut)
	line 157
# 			return i;
	peeko 0
	peeki -3
	geta
	pushi 1
	geta
	o2i
	peeki -1
	sub
	itb
	not
	bne _112
	peeki -3
	savei
	jump _return_MenuFindEntryFromShortcut

	line 158
# 	return -1;
: _112
: _113
	peeki -3
	pushi 1
	add
	pokei -3

	jump _108
: _109
	pushi -1
	savei
	jump _return_MenuFindEntryFromShortcut

	line 159
# }
	pushi 0
	savei
: _return_MenuFindEntryFromShortcut
# retract over local var i
	popi
# retract over local var size
	popi
# retract over local var shortcut
	popi
# retract over local var menu
	popo
	return
: _107
	line 160
# 
	line 161
# // --- Opens and processes a menu --------------------------------------------
	line 162
# 
	line 163
# function int MenuProcess
	line 164
# 	array Menu menubar;
# argument menubar of type array Menu at 0
	line 165
# 	int menuid;
# argument menuid of type int at 1
	line 166
# {
	jump _114
: MenuProcess
	line 167
# 	int key;
# local key of type int at 2
	pushi 0
	line 168
# 	array MenuItem menu := menubar[menuid].item;
# local menu of type array MenuItem at 3
	peeko 0
	peeki -1
	geta
	pushi 2
	geta
	line 169
# 	array string element;
# local element of type array string at 4
	pusho array object
	line 170
# 	int x := menubar[menuid].x;
# local x of type int at 5
	peeko 0
	peeki -1
	geta
	pushi 3
	geta
	o2i
	line 171
# 	int y;
# local y of type int at 6
	pushi 0
	line 172
# 	int i;
# local i of type int at 7
	pushi 0
	line 173
# 	int index;
# local index of type int at 8
	pushi 0
	line 174
# 	int width := menubar[menuid].width;
# local width of type int at 9
	peeko 0
	peeki -1
	geta
	pushi 4
	geta
	o2i
	line 175
# 
	line 176
# 	// Highlight entry in menu bar
	line 177
# 
	line 178
# 	ScrSetFGBG(7, 0);
	pushi 7
	pushi 0
	sys ScrSetFGBG

	line 179
# 	ScrGotoXY(x, 0);
	peeki -5
	pushi 0
	sys ScrGotoXY

	line 180
# 	ScrPutStr(" ");
	pusho " "
	sys ScrPutStr

	line 181
# 	ScrPutStr(menubar[menuid].label);
	peeko 0
	peeki -1
	geta
	pushi 0
	geta
	sys ScrPutStr

	line 182
# 	ScrPutStr(" ");
	pusho " "
	sys ScrPutStr

	line 183
# 	ScrSetFGBG(0, 6);
	pushi 0
	pushi 6
	sys ScrSetFGBG

	line 184
# 	ScrPutStr(" ");
	pusho " "
	sys ScrPutStr

	line 185
# 
	line 186
# 	// Build quick-reference array
	line 187
# 
	line 188
# 	sizeof(element) := sizeof(menu);
	peeko -4
	peeko -3
	size
	resize

	line 189
# 	for(i:=0; i<sizeof(menu); i:=i+1)
	pushi 0
	pokei -7
: _115
	peeki -7
	peeko -3
	size
	sub
	blt _117
	pushi 1
	jump _118
: _117
	pushi 0
: _118
	bne _116
	line 190
# 	{
	line 191
# 		if (menu[i].label == "")
	line 192
# 			element[i] := StringDup(width+2, "-");
	peeko -3
	peeki -7
	geta
	pushi 0
	geta
	pusho ""
	strcmp
	itb
	not
	bne _119
	pushfp
	peeki -9
	pushi 2
	add
	pusho "-"
	call StringDup
	loado
	peeko -4
	peeki -7
	seta

	line 193
# 		else
	line 194
# 		{
	jump _120
: _119
	line 195
# 			element[i] := " " + menu[i].label;
	pusho " "
	peeko -3
	peeki -7
	geta
	pushi 0
	geta
	concat
	peeko -4
	peeki -7
	seta

	line 196
# 			element[i] := element[i] +
	peeko -4
	peeki -7
	geta
	line 197
# 				StringDup(1 + width - sizeof(menu[i].label), " ");
	pushfp
	pushi 1
	peeki -9
	peeko -3
	peeki -7
	geta
	pushi 0
	geta
	size
	sub
	add
	pusho " "
	call StringDup
	loado
	concat
	peeko -4
	peeki -7
	seta

	line 198
# 		}
: _120
	line 199
# 	}
	peeki -7
	pushi 1
	add
	pokei -7

	jump _115
: _116
	line 200
# 
	line 201
# 	// Draw menu
	line 202
# 
	line 203
# 	ScrSetFGBG(0, 6);
	pushi 0
	pushi 6
	sys ScrSetFGBG

	line 204
# 	ScrGotoXY(x-1, 1);
	peeki -5
	pushi 1
	sub
	pushi 1
	sys ScrGotoXY

	line 205
# 	ScrPutStr(StringDup(width+4, " "));
	pushfp
	peeki -9
	pushi 4
	add
	pusho " "
	call StringDup
	loado
	sys ScrPutStr

	line 206
# 	for (i:=0; i<sizeof(menu); i:=i+1)
	pushi 0
	pokei -7
: _121
	peeki -7
	peeko -3
	size
	sub
	blt _123
	pushi 1
	jump _124
: _123
	pushi 0
: _124
	bne _122
	line 207
# 	{
	line 208
# 		ScrGotoXY(x-1, i+2);
	peeki -5
	pushi 1
	sub
	peeki -7
	pushi 2
	add
	sys ScrGotoXY

	line 209
# 		ScrPutStr(" ");
	pusho " "
	sys ScrPutStr

	line 210
# 		MenuWriteHighlighted(element[i], ByteString(menu[i].mnemonic), 0, 6, 7);
	pushfp
	peeko -4
	peeki -7
	geta
	peeko -3
	peeki -7
	geta
	pushi 1
	geta
	o2i
	sys ByteString
	pushi 0
	pushi 6
	pushi 7
	call MenuWriteHighlighted

	line 211
# 		ScrPutStr(" ");
	pusho " "
	sys ScrPutStr

	line 212
# 	}
	peeki -7
	pushi 1
	add
	pokei -7

	jump _121
: _122
	line 213
# 	ScrGotoXY(x-1, 2+sizeof(menu));
	peeki -5
	pushi 1
	sub
	pushi 2
	peeko -3
	size
	add
	sys ScrGotoXY

	line 214
# 	ScrPutStr(StringDup(width+4, " "));
	pushfp
	peeki -9
	pushi 4
	add
	pusho " "
	call StringDup
	loado
	sys ScrPutStr

	line 215
# 
	line 216
# 	index := 0;
	pushi 0
	pokei -8

	line 217
# 	do {
: _125
	line 218
# 		// Highlight entry
	line 219
# 
	line 220
# 		ScrGotoXY(x, index+2);
	peeki -5
	peeki -8
	pushi 2
	add
	sys ScrGotoXY

	line 221
# 		MenuWriteHighlighted(element[index], ByteString(menu[index].mnemonic), 7, 0, 6);
	pushfp
	peeko -4
	peeki -8
	geta
	peeko -3
	peeki -8
	geta
	pushi 1
	geta
	o2i
	sys ByteString
	pushi 7
	pushi 0
	pushi 6
	call MenuWriteHighlighted

	line 222
# 		ScrGotoXY(x+1, index+2);
	peeki -5
	pushi 1
	add
	peeki -8
	pushi 2
	add
	sys ScrGotoXY

	line 223
# 
	line 224
# 		key := ScrGetCh();
	sys ScrGetCh
	pokei -2

	line 225
# 
	line 226
# 		// Restore entry to normal
	line 227
# 
	line 228
# 		ScrGotoXY(x, index+2);
	peeki -5
	peeki -8
	pushi 2
	add
	sys ScrGotoXY

	line 229
# 		MenuWriteHighlighted(element[index], ByteString(menu[index].mnemonic), 0, 6, 7);
	pushfp
	peeko -4
	peeki -8
	geta
	peeko -3
	peeki -8
	geta
	pushi 1
	geta
	o2i
	sys ByteString
	pushi 0
	pushi 6
	pushi 7
	call MenuWriteHighlighted

	line 230
# 
	line 231
# 		// Process keypress
	line 232
# 
	line 233
# 		if ((key == KEY_UP) and (index > 0))
	line 234
# 			index := index - 1;
	peeki -2
	peeki 11
	sub
	itb
	not
	peeki -8
	pushi 0
	sub
	bgt _129
	pushi 1
	jump _130
: _129
	pushi 0
: _130
	and
	bne _127
	peeki -8
	pushi 1
	sub
	pokei -8

	line 235
# 		else if ((key == KEY_DOWN) and (index < (sizeof(menu)-1)))
	jump _128
: _127
	line 236
# 			index := index + 1;
	peeki -2
	peeki 10
	sub
	itb
	not
	peeki -8
	peeko -3
	size
	pushi 1
	sub
	sub
	blt _133
	pushi 1
	jump _134
: _133
	pushi 0
: _134
	and
	bne _131
	peeki -8
	pushi 1
	add
	pokei -8

	line 237
# 		else if (key == KEY_LEFT)
	jump _132
: _131
	line 238
# 		{
	peeki -2
	peeki 8
	sub
	itb
	not
	bne _135
	line 239
# 			MenuBarDraw(menubar);
	pushfp
	peeko 0
	call MenuBarDraw

	line 240
# 			MenuUserRedraw(1, sizeof(menu)+2);
	pushfp
	pushi 1
	peeko -3
	size
	pushi 2
	add
	call MenuUserRedraw

	line 241
# 			menuid := menuid - 1;
	peeki -1
	pushi 1
	sub
	pokei -1

	line 242
# 			if (menuid < 0)
	line 243
# 				menuid := sizeof(menubar)-1;
	peeki -1
	pushi 0
	sub
	blt _139
	pushi 1
	jump _140
: _139
	pushi 0
: _140
	bne _137
	peeko 0
	size
	pushi 1
	sub
	pokei -1

	line 244
# 			return MenuProcess(menubar, menuid);
: _137
: _138
	pushfp
	peeko 0
	peeki -1
	call MenuProcess
	loadi
	savei
	jump _return_MenuProcess

	line 245
# 		}
	line 246
# 		else if (key == KEY_RIGHT)
	jump _136
: _135
	line 247
# 		{
	peeki -2
	peeki 9
	sub
	itb
	not
	bne _141
	line 248
# 			MenuBarDraw(menubar);
	pushfp
	peeko 0
	call MenuBarDraw

	line 249
# 			MenuUserRedraw(1, sizeof(menu)+2);
	pushfp
	pushi 1
	peeko -3
	size
	pushi 2
	add
	call MenuUserRedraw

	line 250
# 			menuid := menuid + 1;
	peeki -1
	pushi 1
	add
	pokei -1

	line 251
# 			if (menuid >= sizeof(menubar))
	line 252
# 				menuid := 0;
	peeki -1
	peeko 0
	size
	sub
	bge _145
	pushi 1
	jump _146
: _145
	pushi 0
: _146
	bne _143
	pushi 0
	pokei -1

	line 253
# 			return MenuProcess(menubar, menuid);
: _143
: _144
	pushfp
	peeko 0
	peeki -1
	call MenuProcess
	loadi
	savei
	jump _return_MenuProcess

	line 254
# 		}
	line 255
# 		else if ((key == 13) or (key == 10))
	jump _142
: _141
	line 256
# 		{
	peeki -2
	pushi 13
	sub
	itb
	not
	peeki -2
	pushi 10
	sub
	itb
	not
	or
	bne _147
	line 257
# 			MenuBarDraw(menubar);
	pushfp
	peeko 0
	call MenuBarDraw

	line 258
# 			MenuUserRedraw(1, sizeof(menu)+2);
	pushfp
	pushi 1
	peeko -3
	size
	pushi 2
	add
	call MenuUserRedraw

	line 259
# 			return menu[index].event;
	peeko -3
	peeki -8
	geta
	pushi 2
	geta
	o2i
	savei
	jump _return_MenuProcess

	line 260
# 		}
	line 261
# 		else if ((key == 539) or (key == 27))
	jump _148
: _147
	line 262
# 		{
	peeki -2
	pushi 539
	sub
	itb
	not
	peeki -2
	pushi 27
	sub
	itb
	not
	or
	bne _149
	line 263
# 			MenuBarDraw(menubar);
	pushfp
	peeko 0
	call MenuBarDraw

	line 264
# 			MenuUserRedraw(1, sizeof(menu)+2);
	pushfp
	pushi 1
	peeko -3
	size
	pushi 2
	add
	call MenuUserRedraw

	line 265
# 			return 0;
	pushi 0
	savei
	jump _return_MenuProcess

	line 266
# 		}
	line 267
# 		else
	line 268
# 		{
	jump _150
: _149
	line 269
# 			key := MenuFindEntryFromShortcut(menu,
	pushfp
	peeko -3
	line 270
# 				StringByte(StringUpper(ByteString(key))));
	peeki -2
	sys ByteString
	sys StringUpper
	sys StringByte
	call MenuFindEntryFromShortcut
	loadi
	pokei -2

	line 271
# 			if (key != -1)
	line 272
# 			{
	peeki -2
	pushi -1
	sub
	itb
	bne _151
	line 273
# 				MenuBarDraw(menubar);
	pushfp
	peeko 0
	call MenuBarDraw

	line 274
# 				MenuUserRedraw(1, sizeof(menu)+2);
	pushfp
	pushi 1
	peeko -3
	size
	pushi 2
	add
	call MenuUserRedraw

	line 275
# 				return menu[key].event;
	peeko -3
	peeki -2
	geta
	pushi 2
	geta
	o2i
	savei
	jump _return_MenuProcess

	line 276
# 			}
	line 277
# 		}
: _151
: _152
: _150
: _148
: _142
: _136
: _132
: _128
	line 278
# 	} while(1);
	pushi 1
	beq _125
: _126
	line 279
# 
	line 280
# 	MenuBarDraw(menubar);
	pushfp
	peeko 0
	call MenuBarDraw

	line 281
# 	MenuUserRedraw(1, sizeof(menu)+2);
	pushfp
	pushi 1
	peeko -3
	size
	pushi 2
	add
	call MenuUserRedraw

	line 282
# 	return key;
	peeki -2
	savei
	jump _return_MenuProcess

	line 283
# }
	pushi 0
	savei
: _return_MenuProcess
# retract over local var width
	popi
# retract over local var index
	popi
# retract over local var i
	popi
# retract over local var y
	popi
# retract over local var x
	popi
# retract over local var element
	popo
# retract over local var menu
	popo
# retract over local var key
	popi
# retract over local var menuid
	popi
# retract over local var menubar
	popo
	return
: _114
	line 284
# 
	line 285
# // --- Add a menu -------------------------------------------------------------
	line 286
# 
	line 287
# function array MenuItem MenuAddMenu
	line 288
# 	array Menu menubar;
# argument menubar of type array Menu at 0
	line 289
# 	string name;
# argument name of type string at 1
	line 290
# 	string mnemonic;
# argument mnemonic of type string at 2
	line 291
# {
	jump _153
: MenuAddMenu
	line 292
# 	int i := sizeof(menubar);
# local i of type int at 3
	peeko 0
	size
	line 293
# 	Menu menu;
# local menu of type Menu at 4
	pusho array object
dupo
pushi 5
resize
	line 294
# 
	line 295
# 	sizeof(menubar) := i+1;
	peeko 0
	peeki -3
	pushi 1
	add
	resize

	line 296
# 	menubar[i] := menu;
	peeko -4
	peeko 0
	peeki -3
	seta

	line 297
# 	menu.label := name;
	peeko -1
	peeko -4
	pushi 0
	seta

	line 298
# 	menu.mnemonic := StringByte(mnemonic);
	peeko -2
	sys StringByte
	i2o
	peeko -4
	pushi 1
	seta

	line 299
# 	menu.item := create(array MenuItem);
	pusho array object
	peeko -4
	pushi 2
	seta

	line 300
# 
	line 301
# 	return menu.item;
	peeko -4
	pushi 2
	geta
	saveo
	jump _return_MenuAddMenu

	line 302
# }
	pusho array object
	saveo
: _return_MenuAddMenu
# retract over local var menu
	popo
# retract over local var i
	popi
# retract over local var mnemonic
	popo
# retract over local var name
	popo
# retract over local var menubar
	popo
	return
: _153
	line 303
# 
	line 304
# // --- Add an item to an existing menu ----------------------------------------
	line 305
# 
	line 306
# function void MenuAddMenuItem
	line 307
# 	array MenuItem menu;
# argument menu of type array MenuItem at 0
	line 308
# 	string name;
# argument name of type string at 1
	line 309
# 	string mnemonic;
# argument mnemonic of type string at 2
	line 310
# 	int event;
# argument event of type int at 3
	line 311
# {
	jump _154
: MenuAddMenuItem
	line 312
# 	int i := sizeof(menu);
# local i of type int at 4
	peeko 0
	size
	line 313
# 	MenuItem menuitem;
# local menuitem of type MenuItem at 5
	pusho array object
dupo
pushi 3
resize
	line 314
# 
	line 315
# 	sizeof(menu) := i+1;
	peeko 0
	peeki -4
	pushi 1
	add
	resize

	line 316
# 	menu[i] := menuitem;
	peeko -5
	peeko 0
	peeki -4
	seta

	line 317
# 	menuitem.label := name;
	peeko -1
	peeko -5
	pushi 0
	seta

	line 318
# 	menuitem.mnemonic := StringByte(mnemonic);
	peeko -2
	sys StringByte
	i2o
	peeko -5
	pushi 1
	seta

	line 319
# 	menuitem.event := event;
	peeki -3
	i2o
	peeko -5
	pushi 2
	seta

	line 320
# }
: _return_MenuAddMenuItem
# retract over local var menuitem
	popo
# retract over local var i
	popi
# retract over local var event
	popi
# retract over local var mnemonic
	popo
# retract over local var name
	popo
# retract over local var menu
	popo
	return
: _154
	line 321
# 
	line 322
# // ===========================================================================
	line 323
# //                        EDITOR GLOBAL VARIABLES
	line 324
# // ===========================================================================
	line 325
# 
	line 326
# // --- Buffer structure ------------------------------------------------------
	line 327
# 
	line 328
# structure Buffer := {
	line 329
# 	string name;		// Name of buffer
	line 330
# 	int sx;			// Cursor x ordinate
	line 331
# 	int sy;			// Cursor y ordinate
	line 332
# 	int bx;			// Buffer x ordinate of first visible column
	line 333
# 	int by;			// Buffer y ordinate of first visible line
	line 334
# 	array string line;	// The data itself
	line 335
# };
	line 336
# 
	line 337
# global Buffer buffer;		// Current buffer
# global buffer of type Buffer at 17
	pusho array object
dupo
pushi 6
resize
	line 338
# 
	line 339
# // --- Events ----------------------------------------------------------------
	line 340
# 
	line 341
# global int EVENT_EXIT			:= $1000;
# global EVENT_EXIT of type int at 18
	pushi 4096
	line 342
# global int EVENT_LOAD			:= $1001;
# global EVENT_LOAD of type int at 19
	pushi 4097
	line 343
# global int EVENT_SAVE			:= $1002;
# global EVENT_SAVE of type int at 20
	pushi 4098
	line 344
# 
	line 345
# // --- Create the global menubar ---------------------------------------------
	line 346
# 
	line 347
# global array Menu menubar := init_menubar();
# global menubar of type array Menu at 21
	pushfp
	call init_menubar
	loado
	line 348
# function array Menu init_menubar
	line 349
# {
	jump _155
: init_menubar
	line 350
# 	array Menu menubar;
# local menubar of type array Menu at 0
	pusho array object
	line 351
# 	array MenuItem menu;
# local menu of type array MenuItem at 1
	pusho array object
	line 352
# 
	line 353
# 	// File menu
	line 354
# 
	line 355
# 	menu := MenuAddMenu(menubar, "File", "F");
	pushfp
	peeko 0
	pusho "File"
	pusho "F"
	call MenuAddMenu
	loado
	pokeo -1

	line 356
# 	MenuAddMenuItem(menu,	"Load",		"L", EVENT_LOAD);
	pushfp
	peeko -1
	pusho "Load"
	pusho "L"
	peeki 19
	call MenuAddMenuItem

	line 357
# 	MenuAddMenuItem(menu,	"Save",		"S", EVENT_SAVE);
	pushfp
	peeko -1
	pusho "Save"
	pusho "S"
	peeki 20
	call MenuAddMenuItem

	line 358
# 	MenuAddMenuItem(menu,	"",		"", 0);
	pushfp
	peeko -1
	pusho ""
	pusho ""
	pushi 0
	call MenuAddMenuItem

	line 359
# 	MenuAddMenuItem(menu,	"Exit",		"X", EVENT_EXIT);
	pushfp
	peeko -1
	pusho "Exit"
	pusho "X"
	peeki 18
	call MenuAddMenuItem

	line 360
# 
	line 361
# 	return menubar;
	peeko 0
	saveo
	jump _return_init_menubar

	line 362
# }
	pusho array object
	saveo
: _return_init_menubar
# retract over local var menu
	popo
# retract over local var menubar
	popo
	return
: _155
	line 363
# 
	line 364
# // ===========================================================================
	line 365
# //                           REDRAW MAIN WINDOW
	line 366
# // ===========================================================================
	line 367
# 
	line 368
# // --- Redraw a single line --------------------------------------------------
	line 369
# 
	line 370
# function void redraw_line
	line 371
# 	int y;
# argument y of type int at 0
	line 372
# 	int i;
# argument i of type int at 1
	line 373
# 	array string line;
# argument line of type array string at 2
	line 374
# {
	jump _156
: redraw_line
	line 375
# 	if (i < sizeof(line))
	line 376
# 		ScrSetFGBG(7, 4);
	peeki -1
	peeko -2
	size
	sub
	blt _159
	pushi 1
	jump _160
: _159
	pushi 0
: _160
	bne _157
	pushi 7
	pushi 4
	sys ScrSetFGBG

	line 377
# 	else
	line 378
# 		ScrSetFGBG(7, 0);
	jump _158
: _157
	pushi 7
	pushi 0
	sys ScrSetFGBG

: _158
	line 379
# 	ScrClearArea(0, y, ScrWidth()-1, y);
	pushi 0
	peeki 0
	sys ScrWidth
	pushi 1
	sub
	peeki 0
	sys ScrClearArea

	line 380
# 	ScrGotoXY(0, y);
	pushi 0
	peeki 0
	sys ScrGotoXY

	line 381
# 	if (i < sizeof(line))
	line 382
# 		ScrPutStr(StringMid(line[i], buffer.bx, ScrWidth()));
	peeki -1
	peeko -2
	size
	sub
	blt _163
	pushi 1
	jump _164
: _163
	pushi 0
: _164
	bne _161
	peeko -2
	peeki -1
	geta
	peeko 17
	pushi 3
	geta
	o2i
	sys ScrWidth
	sys StringMid
	sys ScrPutStr

	line 383
# }
: _161
: _162
: _return_redraw_line
# retract over local var line
	popo
# retract over local var i
	popi
# retract over local var y
	popi
	return
: _156
	line 384
# 
	line 385
# function void MenuUserRedraw
	line 386
# 	int y1;
# argument y1 of type int at 0
	line 387
# 	int y2;
# argument y2 of type int at 1
	line 388
# {
	jump _165
: MenuUserRedraw
	line 389
# 	int by := buffer.by;
# local by of type int at 2
	peeko 17
	pushi 4
	geta
	o2i
	line 390
# 	int bx := buffer.bx;
# local bx of type int at 3
	peeko 17
	pushi 3
	geta
	o2i
	line 391
# 	int sy := buffer.sy;
# local sy of type int at 4
	peeko 17
	pushi 2
	geta
	o2i
	line 392
# 	array string line := buffer.line;
# local line of type array string at 5
	peeko 17
	pushi 5
	geta
	line 393
# 	int y;
# local y of type int at 6
	pushi 0
	line 394
# 	int my;
# local my of type int at 7
	pushi 0
	line 395
# 	
	line 396
# 	if (y2 == -1)
	line 397
# 		y2 := y1;
	peeki -1
	pushi -1
	sub
	itb
	not
	bne _166
	peeki 0
	pokei -1

	line 398
# 	my := y2 - y1;
: _166
: _167
	peeki -1
	peeki 0
	sub
	pokei -7

	line 399
# 
	line 400
# //	ScrGotoXY(0, 0);
	line 401
# //	ScrPutStr(IntToString(by));
	line 402
# //	ScrPutStr(", ");
	line 403
# //	ScrPutStr(IntToString(sy));
	line 404
# //	ScrPutStr(", ");
	line 405
# //	ScrPutStr(IntToString(y1));
	line 406
# //	ScrPutStr(", ");
	line 407
# //	ScrPutStr(IntToString(y2));
	line 408
# //	ScrPutStr(" ");
	line 409
# 	
	line 410
# //	if ((by+my+y1-1) >= sizeof(line))
	line 411
# //	{
	line 412
# //		ScrSetFGBG(7, 0);
	line 413
# //		ScrClearArea(0, sizeof(line)-by+y1+1, ScrWidth()-1, y2);
	line 414
# //		my := sizeof(line)-by;
	line 415
# //	}
	line 416
# 	
	line 417
# //	ScrSetFGBG(7, 4);
	line 418
# //	ScrClearArea(0, y1, ScrWidth()-1, y1+my);
	line 419
# 
	line 420
# 	for(y:=0; y<=my; y:=y+1)
	pushi 0
	pokei -6
: _168
	peeki -6
	peeki -7
	sub
	ble _170
	pushi 1
	jump _171
: _170
	pushi 0
: _171
	bne _169
	line 421
# 		redraw_line(y1+y, by+y1+y-1, line);
	pushfp
	peeki 0
	peeki -6
	add
	peeki -2
	peeki 0
	peeki -6
	pushi 1
	sub
	add
	add
	peeko -5
	call redraw_line

	peeki -6
	pushi 1
	add
	pokei -6

	jump _168
: _169
	line 422
# }
: _return_MenuUserRedraw
# retract over local var my
	popi
# retract over local var y
	popi
# retract over local var line
	popo
# retract over local var sy
	popi
# retract over local var bx
	popi
# retract over local var by
	popi
# retract over local var y2
	popi
# retract over local var y1
	popi
	return
: _165
	line 423
# 
	line 424
# // ===========================================================================
	line 425
# //                          BUFFER MANIPULATION
	line 426
# // ===========================================================================
	line 427
# 
	line 428
# // --- Insert some text ------------------------------------------------------
	line 429
# 
	line 430
# function void insert_character
	line 431
# 	string c;
# argument c of type string at 0
	line 432
# {
	jump _172
: insert_character
	line 433
# 	int sy := buffer.sy;
# local sy of type int at 1
	peeko 17
	pushi 2
	geta
	o2i
	line 434
# 	int sx := buffer.sx;
# local sx of type int at 2
	peeko 17
	pushi 1
	geta
	o2i
	line 435
# 	string s;
# local s of type string at 3
	pusho ""
	line 436
# 
	line 437
# 	if (sy >= sizeof(buffer.line))
	line 438
# 	{
	peeki -1
	peeko 17
	pushi 5
	geta
	size
	sub
	bge _175
	pushi 1
	jump _176
: _175
	pushi 0
: _176
	bne _173
	line 439
# 		sizeof(buffer.line) := sy+1;
	peeko 17
	pushi 5
	geta
	peeki -1
	pushi 1
	add
	resize

	line 440
# 		buffer.line[sy] := c;
	peeko 0
	peeko 17
	pushi 5
	geta
	peeki -1
	seta

	line 441
# 		sx := sx + sizeof(c);
	peeki -2
	peeko 0
	size
	add
	pokei -2

	line 442
# 	}
	line 443
# 	else
	line 444
# 	{
	jump _174
: _173
	line 445
# 		s := buffer.line[sy];
	peeko 17
	pushi 5
	geta
	peeki -1
	geta
	pokeo -3

	line 446
# 		if (sx == 0)
	line 447
# 			s := c + s;
	peeki -2
	pushi 0
	sub
	itb
	not
	bne _177
	peeko 0
	peeko -3
	concat
	pokeo -3

	line 448
# 		else if (sx >= sizeof(s))
	jump _178
: _177
	line 449
# 			s := s + c;
	peeki -2
	peeko -3
	size
	sub
	bge _181
	pushi 1
	jump _182
: _181
	pushi 0
: _182
	bne _179
	peeko -3
	peeko 0
	concat
	pokeo -3

	line 450
# 		else
	line 451
# 			s := StringMid(s, 0, sx) + c + StringMid(s, sx, -1);
	jump _180
: _179
	peeko -3
	pushi 0
	peeki -2
	sys StringMid
	peeko 0
	peeko -3
	peeki -2
	pushi -1
	sys StringMid
	concat
	concat
	pokeo -3

: _180
: _178
	line 452
# 		sx := sx + sizeof(c);
	peeki -2
	peeko 0
	size
	add
	pokei -2

	line 453
# 		buffer.line[sy] := s;
	peeko -3
	peeko 17
	pushi 5
	geta
	peeki -1
	seta

	line 454
# 	}
: _174
	line 455
# 
	line 456
# 	buffer.sx := sx;
	peeki -2
	i2o
	peeko 17
	pushi 1
	seta

	line 457
# 	if (!rationalise_cursor())
	line 458
# 	{
	pushfp
	call rationalise_cursor
	loadi
	not
	bne _183
	line 459
# //		ScrGotoXY(0, 0);
	line 460
# //		ScrPutStr(IntToString(1+buffer.sy-buffer.by));
	line 461
# 		MenuUserRedraw(1+buffer.sy-buffer.by, -1);
	pushfp
	pushi 1
	peeko 17
	pushi 2
	geta
	o2i
	peeko 17
	pushi 4
	geta
	o2i
	sub
	add
	pushi -1
	call MenuUserRedraw

	line 462
# 	}
	line 463
# }
: _183
: _184
: _return_insert_character
# retract over local var s
	popo
# retract over local var sx
	popi
# retract over local var sy
	popi
# retract over local var c
	popo
	return
: _172
	line 464
# 
	line 465
# // --- Delete to left of cursor -----------------------------------------------
	line 466
# 
	line 467
# function void delete_left
	line 468
# {
	jump _185
: delete_left
	line 469
# 	int sy := buffer.sy;
# local sy of type int at 0
	peeko 17
	pushi 2
	geta
	o2i
	line 470
# 	int sx := buffer.sx;
# local sx of type int at 1
	peeko 17
	pushi 1
	geta
	o2i
	line 471
# 	array string line := buffer.line;
# local line of type array string at 2
	peeko 17
	pushi 5
	geta
	line 472
# 	int size := sizeof(line[sy]);
# local size of type int at 3
	peeko -2
	peeki 0
	geta
	size
	line 473
# 
	line 474
# 	if (sx == 0)
	line 475
# 	{
	peeki -1
	pushi 0
	sub
	itb
	not
	bne _186
	line 476
# 		if (sy > 0)
	line 477
# 		{
	peeki 0
	pushi 0
	sub
	bgt _190
	pushi 1
	jump _191
: _190
	pushi 0
: _191
	bne _188
	line 478
# 			sy := sy - 1;
	peeki 0
	pushi 1
	sub
	pokei 0

	line 479
# 			buffer.sx := sizeof(line[sy]);
	peeko -2
	peeki 0
	geta
	size
	i2o
	peeko 17
	pushi 1
	seta

	line 480
# 			line[sy] := line[sy] + line[sy+1];
	peeko -2
	peeki 0
	geta
	peeko -2
	peeki 0
	pushi 1
	add
	geta
	concat
	peeko -2
	peeki 0
	seta

	line 481
# 			delete(line, sy+1, 1);
	peeko -2
	peeki 0
	pushi 1
	add
	pushi 1
	delete_array
	line 482
# 			buffer.sy := sy;
	peeki 0
	i2o
	peeko 17
	pushi 2
	seta

	line 483
# 		}
	line 484
# 	}
: _188
: _189
	line 485
# 	else if (sx == size)
	jump _187
: _186
	line 486
# 	{
	peeki -1
	peeki -3
	sub
	itb
	not
	bne _192
	line 487
# 		line[sy] := StringMid(line[sy], 0, size-1);
	peeko -2
	peeki 0
	geta
	pushi 0
	peeki -3
	pushi 1
	sub
	sys StringMid
	peeko -2
	peeki 0
	seta

	line 488
# 		buffer.sx := sx - 1;
	peeki -1
	pushi 1
	sub
	i2o
	peeko 17
	pushi 1
	seta

	line 489
# 	}
	line 490
# 	else
	line 491
# 	{
	jump _193
: _192
	line 492
# 		line[sy] := StringMid(line[sy], 0, sx-1) +
	peeko -2
	peeki 0
	geta
	pushi 0
	peeki -1
	pushi 1
	sub
	sys StringMid
	line 493
# 			StringMid(line[sy], sx, -1);
	peeko -2
	peeki 0
	geta
	peeki -1
	pushi -1
	sys StringMid
	concat
	peeko -2
	peeki 0
	seta

	line 494
# 		buffer.sx := sx - 1;
	peeki -1
	pushi 1
	sub
	i2o
	peeko 17
	pushi 1
	seta

	line 495
# 	}
: _193
: _187
	line 496
# 	if (!rationalise_cursor())
	line 497
# 		MenuUserRedraw(1+buffer.sy-buffer.by, ScrHeight()-2);
	pushfp
	call rationalise_cursor
	loadi
	not
	bne _194
	pushfp
	pushi 1
	peeko 17
	pushi 2
	geta
	o2i
	peeko 17
	pushi 4
	geta
	o2i
	sub
	add
	sys ScrHeight
	pushi 2
	sub
	call MenuUserRedraw

	line 498
# }
: _194
: _195
: _return_delete_left
# retract over local var size
	popi
# retract over local var line
	popo
# retract over local var sx
	popi
# retract over local var sy
	popi
	return
: _185
	line 499
# 
	line 500
# // --- Move cursor up ---------------------------------------------------------
	line 501
# 
	line 502
# function void move_up
	line 503
# 	int n;
# argument n of type int at 0
	line 504
# {
	jump _196
: move_up
	line 505
# 	int e;
# local e of type int at 1
	pushi 0
	line 506
# 	buffer.sy := buffer.sy - n;
	peeko 17
	pushi 2
	geta
	o2i
	peeki 0
	sub
	i2o
	peeko 17
	pushi 2
	seta

	line 507
# 	if (buffer.sy < 0)
	line 508
# 		buffer.sy := 0;
	peeko 17
	pushi 2
	geta
	o2i
	pushi 0
	sub
	blt _199
	pushi 1
	jump _200
: _199
	pushi 0
: _200
	bne _197
	pushi 0
	i2o
	peeko 17
	pushi 2
	seta

	line 509
# 	e := rationalise_cursor();
: _197
: _198
	pushfp
	call rationalise_cursor
	loadi
	pokei -1

	line 510
# }
: _return_move_up
# retract over local var e
	popi
# retract over local var n
	popi
	return
: _196
	line 511
# 
	line 512
# // --- Move cursor down -------------------------------------------------------
	line 513
# 
	line 514
# function void move_down
	line 515
# 	int n;
# argument n of type int at 0
	line 516
# {
	jump _201
: move_down
	line 517
# 	int e := sizeof(buffer.line);
# local e of type int at 1
	peeko 17
	pushi 5
	geta
	size
	line 518
# 	buffer.sy := buffer.sy + n;
	peeko 17
	pushi 2
	geta
	o2i
	peeki 0
	add
	i2o
	peeko 17
	pushi 2
	seta

	line 519
# 	if (buffer.sy >= e)
	line 520
# 		buffer.sy := e-1;
	peeko 17
	pushi 2
	geta
	o2i
	peeki -1
	sub
	bge _204
	pushi 1
	jump _205
: _204
	pushi 0
: _205
	bne _202
	peeki -1
	pushi 1
	sub
	i2o
	peeko 17
	pushi 2
	seta

	line 521
# 	e := rationalise_cursor();
: _202
: _203
	pushfp
	call rationalise_cursor
	loadi
	pokei -1

	line 522
# }
: _return_move_down
# retract over local var e
	popi
# retract over local var n
	popi
	return
: _201
	line 523
# 
	line 524
# // --- Move cursor left -------------------------------------------------------
	line 525
# 
	line 526
# function void move_left
	line 527
# 	int n;
# argument n of type int at 0
	line 528
# {
	jump _206
: move_left
	line 529
# 	int e;
# local e of type int at 1
	pushi 0
	line 530
# 	buffer.sx := buffer.sx - n;
	peeko 17
	pushi 1
	geta
	o2i
	peeki 0
	sub
	i2o
	peeko 17
	pushi 1
	seta

	line 531
# 	if (buffer.sx < 0)
	line 532
# 		buffer.sx := 0;
	peeko 17
	pushi 1
	geta
	o2i
	pushi 0
	sub
	blt _209
	pushi 1
	jump _210
: _209
	pushi 0
: _210
	bne _207
	pushi 0
	i2o
	peeko 17
	pushi 1
	seta

	line 533
# 	e := rationalise_cursor();
: _207
: _208
	pushfp
	call rationalise_cursor
	loadi
	pokei -1

	line 534
# }
: _return_move_left
# retract over local var e
	popi
# retract over local var n
	popi
	return
: _206
	line 535
# 	
	line 536
# // --- Move cursor right ------------------------------------------------------
	line 537
# 
	line 538
# function void move_right
	line 539
# 	int n;
# argument n of type int at 0
	line 540
# {
	jump _211
: move_right
	line 541
# 	int e := sizeof(buffer.line);
# local e of type int at 1
	peeko 17
	pushi 5
	geta
	size
	line 542
# 	buffer.sx := buffer.sx + n;
	peeko 17
	pushi 1
	geta
	o2i
	peeki 0
	add
	i2o
	peeko 17
	pushi 1
	seta

	line 543
# 	if (buffer.sy > e)
	line 544
# 		buffer.sy := e;
	peeko 17
	pushi 2
	geta
	o2i
	peeki -1
	sub
	bgt _214
	pushi 1
	jump _215
: _214
	pushi 0
: _215
	bne _212
	peeki -1
	i2o
	peeko 17
	pushi 2
	seta

	line 545
# 	e := rationalise_cursor();
: _212
: _213
	pushfp
	call rationalise_cursor
	loadi
	pokei -1

	line 546
# }
: _return_move_right
# retract over local var e
	popi
# retract over local var n
	popi
	return
: _211
	line 547
# 
	line 548
# // --- Move to beginning of line ----------------------------------------------
	line 549
# 
	line 550
# function void move_home
	line 551
# {
	jump _216
: move_home
	line 552
# 	int e;
# local e of type int at 0
	pushi 0
	line 553
# 	buffer.sx := 0;
	pushi 0
	i2o
	peeko 17
	pushi 1
	seta

	line 554
# 	e := rationalise_cursor();
	pushfp
	call rationalise_cursor
	loadi
	pokei 0

	line 555
# }
: _return_move_home
# retract over local var e
	popi
	return
: _216
	line 556
# 
	line 557
# // --- Move to end of line ----------------------------------------------------
	line 558
# 
	line 559
# function void move_end
	line 560
# {
	jump _217
: move_end
	line 561
# 	int e;
# local e of type int at 0
	pushi 0
	line 562
# 	buffer.sx := sizeof(buffer.line[buffer.sy]);
	peeko 17
	pushi 5
	geta
	peeko 17
	pushi 2
	geta
	o2i
	geta
	size
	i2o
	peeko 17
	pushi 1
	seta

	line 563
# 	e := rationalise_cursor();
	pushfp
	call rationalise_cursor
	loadi
	pokei 0

	line 564
# }
: _return_move_end
# retract over local var e
	popi
	return
: _217
	line 565
# 
	line 566
# // --- Insert a CR ------------------------------------------------------------
	line 567
# 
	line 568
# function void insert_cr
	line 569
# {
	jump _218
: insert_cr
	line 570
# 	int e := sizeof(buffer.line);
# local e of type int at 0
	peeko 17
	pushi 5
	geta
	size
	line 571
# 	string left := buffer.line[buffer.sy];
# local left of type string at 1
	peeko 17
	pushi 5
	geta
	peeko 17
	pushi 2
	geta
	o2i
	geta
	line 572
# 	string right;
# local right of type string at 2
	pusho ""
	line 573
# 
	line 574
# 	if (buffer.sy < (e-1))
	line 575
# 		insert(buffer.line, buffer.sy+1, 1);
	peeko 17
	pushi 2
	geta
	o2i
	peeki 0
	pushi 1
	sub
	sub
	blt _221
	pushi 1
	jump _222
: _221
	pushi 0
: _222
	bne _219
	peeko 17
	pushi 5
	geta
	peeko 17
	pushi 2
	geta
	o2i
	pushi 1
	add
	pushi 1
	insert_array
	line 576
# 	else
	line 577
# 		sizeof(buffer.line) := e+1;
	jump _220
: _219
	peeko 17
	pushi 5
	geta
	peeki 0
	pushi 1
	add
	resize

: _220
	line 578
# 
	line 579
# 	right := StringMid(left, buffer.sx, -1);
	peeko -1
	peeko 17
	pushi 1
	geta
	o2i
	pushi -1
	sys StringMid
	pokeo -2

	line 580
# 	left := StringMid(left, 0, buffer.sx);
	peeko -1
	pushi 0
	peeko 17
	pushi 1
	geta
	o2i
	sys StringMid
	pokeo -1

	line 581
# 
	line 582
# 	buffer.sx := 0;
	pushi 0
	i2o
	peeko 17
	pushi 1
	seta

	line 583
# 	buffer.line[buffer.sy] := left;
	peeko -1
	peeko 17
	pushi 5
	geta
	peeko 17
	pushi 2
	geta
	o2i
	seta

	line 584
# 	buffer.sy := buffer.sy + 1;
	peeko 17
	pushi 2
	geta
	o2i
	pushi 1
	add
	i2o
	peeko 17
	pushi 2
	seta

	line 585
# 	buffer.line[buffer.sy] := right;
	peeko -2
	peeko 17
	pushi 5
	geta
	peeko 17
	pushi 2
	geta
	o2i
	seta

	line 586
# 	if (!rationalise_cursor())
	line 587
# 		MenuUserRedraw(1+buffer.sx-buffer.bx, ScrHeight()-2);
	pushfp
	call rationalise_cursor
	loadi
	not
	bne _223
	pushfp
	pushi 1
	peeko 17
	pushi 1
	geta
	o2i
	peeko 17
	pushi 3
	geta
	o2i
	sub
	add
	sys ScrHeight
	pushi 2
	sub
	call MenuUserRedraw

	line 588
# }
: _223
: _224
: _return_insert_cr
# retract over local var right
	popo
# retract over local var left
	popo
# retract over local var e
	popi
	return
: _218
	line 589
# 
	line 590
# // --- Adjust viewpoint and cursor --------------------------------------------
	line 591
# 
	line 592
# function int rationalise_cursor
	line 593
# {
	jump _225
: rationalise_cursor
	line 594
# 	int bx := buffer.bx;
# local bx of type int at 0
	peeko 17
	pushi 3
	geta
	o2i
	line 595
# 	int by := buffer.by;
# local by of type int at 1
	peeko 17
	pushi 4
	geta
	o2i
	line 596
# 	int sx := buffer.sx;
# local sx of type int at 2
	peeko 17
	pushi 1
	geta
	o2i
	line 597
# 	int sy := buffer.sy;
# local sy of type int at 3
	peeko 17
	pushi 2
	geta
	o2i
	line 598
# 	string s := "";
# local s of type string at 4
	pusho ""
	line 599
# 	int redraw := 0;
# local redraw of type int at 5
	pushi 0
	line 600
# 
	line 601
# 	if (buffer.sy < sizeof(buffer.line))
	line 602
# 		s := buffer.line[buffer.sy];
	peeko 17
	pushi 2
	geta
	o2i
	peeko 17
	pushi 5
	geta
	size
	sub
	blt _228
	pushi 1
	jump _229
: _228
	pushi 0
: _229
	bne _226
	peeko 17
	pushi 5
	geta
	peeko 17
	pushi 2
	geta
	o2i
	geta
	pokeo -4

	line 603
# 	if (buffer.sx > sizeof(s))
: _226
: _227
	line 604
# 		buffer.sx := sizeof(s);
	peeko 17
	pushi 1
	geta
	o2i
	peeko -4
	size
	sub
	bgt _232
	pushi 1
	jump _233
: _232
	pushi 0
: _233
	bne _230
	peeko -4
	size
	i2o
	peeko 17
	pushi 1
	seta

	line 605
# 	if ((buffer.sx-buffer.bx) > (ScrWidth()-2))
: _230
: _231
	line 606
# 	{
	peeko 17
	pushi 1
	geta
	o2i
	peeko 17
	pushi 3
	geta
	o2i
	sub
	sys ScrWidth
	pushi 2
	sub
	sub
	bgt _236
	pushi 1
	jump _237
: _236
	pushi 0
: _237
	bne _234
	line 607
# 		buffer.bx := buffer.sx - ScrWidth() - 1;
	peeko 17
	pushi 1
	geta
	o2i
	sys ScrWidth
	pushi 1
	sub
	sub
	i2o
	peeko 17
	pushi 3
	seta

	line 608
# 		redraw := 1;
	pushi 1
	pokei -5

	line 609
# 	}
	line 610
# 	if (buffer.sx < buffer.bx)
: _234
: _235
	line 611
# 	{
	peeko 17
	pushi 1
	geta
	o2i
	peeko 17
	pushi 3
	geta
	o2i
	sub
	blt _240
	pushi 1
	jump _241
: _240
	pushi 0
: _241
	bne _238
	line 612
# 		buffer.bx := buffer.sx;
	peeko 17
	pushi 1
	geta
	o2i
	i2o
	peeko 17
	pushi 3
	seta

	line 613
# 		redraw := 1;
	pushi 1
	pokei -5

	line 614
# 	}
	line 615
# 	if ((buffer.sy-buffer.by) > ScrHeight()-3)
: _238
: _239
	line 616
# 	{
	peeko 17
	pushi 2
	geta
	o2i
	peeko 17
	pushi 4
	geta
	o2i
	sub
	sys ScrHeight
	pushi 3
	sub
	sub
	bgt _244
	pushi 1
	jump _245
: _244
	pushi 0
: _245
	bne _242
	line 617
# 		buffer.by := buffer.sy - ScrHeight() - 3;
	peeko 17
	pushi 2
	geta
	o2i
	sys ScrHeight
	pushi 3
	sub
	sub
	i2o
	peeko 17
	pushi 4
	seta

	line 618
# 		redraw := 1;
	pushi 1
	pokei -5

	line 619
# 	}
	line 620
# 	if (buffer.sy < buffer.by)
: _242
: _243
	line 621
# 	{
	peeko 17
	pushi 2
	geta
	o2i
	peeko 17
	pushi 4
	geta
	o2i
	sub
	blt _248
	pushi 1
	jump _249
: _248
	pushi 0
: _249
	bne _246
	line 622
# 		buffer.by := buffer.sy;
	peeko 17
	pushi 2
	geta
	o2i
	i2o
	peeko 17
	pushi 4
	seta

	line 623
# 		redraw := 1;
	pushi 1
	pokei -5

	line 624
# 	}
	line 625
# 	if (redraw)
: _246
: _247
	line 626
# 		MenuUserRedraw(1, ScrHeight()-2);
	peeki -5
	bne _250
	pushfp
	pushi 1
	sys ScrHeight
	pushi 2
	sub
	call MenuUserRedraw

	line 627
# 	return redraw;
: _250
: _251
	peeki -5
	savei
	jump _return_rationalise_cursor

	line 628
# }
	pushi 0
	savei
: _return_rationalise_cursor
# retract over local var redraw
	popi
# retract over local var s
	popo
# retract over local var sy
	popi
# retract over local var sx
	popi
# retract over local var by
	popi
# retract over local var bx
	popi
	return
: _225
	line 629
# 
	line 630
# // ===========================================================================
	line 631
# //                                UTILITIES
	line 632
# // ===========================================================================
	line 633
# 
	line 634
# // --- Expands tabs in a string ----------------------------------------------
	line 635
# 
	line 636
# function string expand_tabs
	line 637
# 	string in;
# argument in of type string at 0
	line 638
# {
	jump _252
: expand_tabs
	line 639
# 	string out := "";
# local out of type string at 1
	pusho ""
	line 640
# 	int i := 0;
# local i of type int at 2
	pushi 0
	line 641
# 	int c;
# local c of type int at 3
	pushi 0
	line 642
# 
	line 643
# 	while (i < sizeof(in))
: _253
	line 644
# 	{
	peeki -2
	peeko 0
	size
	sub
	blt _255
	pushi 1
	jump _256
: _255
	pushi 0
: _256
	bne _254
	line 645
# 		c := StringByte(in[i]);
	peeko 0
	peeki -2
	pushi 1
	sys StringMid
	sys StringByte
	pokei -3

	line 646
# 		if (c == 9)
	line 647
# 		{
	peeki -3
	pushi 9
	sub
	itb
	not
	bne _257
	line 648
# 			while ((sizeof(out) rem 8) != 7)
: _259
	line 649
# 				out := out + " ";
	peeko -1
	size
	pushi 8
	rem
	pushi 7
	sub
	itb
	bne _260
	peeko -1
	pusho " "
	concat
	pokeo -1

	jump _259
: _260
	line 650
# 			c := 32;
	pushi 32
	pokei -3

	line 651
# 		}
	line 652
# 		out := out + ByteString(c);
: _257
: _258
	peeko -1
	peeki -3
	sys ByteString
	concat
	pokeo -1

	line 653
# 		i := i + 1;
	peeki -2
	pushi 1
	add
	pokei -2

	line 654
# 	}
	jump _253
: _254
	line 655
# 
	line 656
# 	return out;
	peeko -1
	saveo
	jump _return_expand_tabs

	line 657
# }
	pushi 0
	savei
: _return_expand_tabs
# retract over local var c
	popi
# retract over local var i
	popi
# retract over local var out
	popo
# retract over local var in
	popo
	return
: _252
	line 658
# 
	line 659
# // --- Updates the status bar ------------------------------------------------
	line 660
# 
	line 661
# function void update_status
	line 662
# {
	jump _261
: update_status
	line 663
# 	MenuSetStatus("Col: " + IntToString(buffer.sx) + "/"
	pushfp
	pusho "Col: "
	peeko 17
	pushi 1
	geta
	o2i
	pushi 10
sys IntToStringRadix
	line 664
# 		+ IntToString(sizeof(buffer.line[buffer.sy]))
	pusho "/"
	line 665
# 		+ "  Row: " + IntToString(buffer.sy) + "/"
	peeko 17
	pushi 5
	geta
	peeko 17
	pushi 2
	geta
	o2i
	geta
	size
	pushi 10
sys IntToStringRadix
	pusho "  Row: "
	peeko 17
	pushi 2
	geta
	o2i
	pushi 10
sys IntToStringRadix
	line 666
# 		+ IntToString(sizeof(buffer.line)));
	pusho "/"
	peeko 17
	pushi 5
	geta
	size
	pushi 10
sys IntToStringRadix
	concat
	concat
	concat
	concat
	concat
	concat
	concat
	call MenuSetStatus

	line 667
# }
: _return_update_status
	return
: _261
	line 668
# 
	line 669
# // ===========================================================================
	line 670
# //                              MAIN PROGRAM
	line 671
# // ===========================================================================
	line 672
# 
	line 673
# // --- Loads a file ----------------------------------------------------------
	line 674
# 
	line 675
# function void file_load
	line 676
# {
	jump _262
: file_load
	line 677
# 	string newname;
# local newname of type string at 0
	pusho ""
	line 678
# 	int fh;
# local fh of type int at 1
	pushi 0
	line 679
# 	int i;
# local i of type int at 2
	pushi 0
	line 680
# 	
	line 681
# 	MenuSetStatus("Enter filename to load:");
	pushfp
	pusho "Enter filename to load:"
	call MenuSetStatus

	line 682
# 	ScrSetFGBG(7, 1);
	pushi 7
	pushi 1
	sys ScrSetFGBG

	line 683
# 	newname := ScrXReadString(25, ScrHeight()-1, ScrWidth()-25, "");
	pushfp
	pushi 25
	sys ScrHeight
	pushi 1
	sub
	sys ScrWidth
	pushi 25
	sub
	pusho ""
	call ScrXReadString
	loado
	pokeo 0

	line 684
# 	if (newname == "")
	line 685
# 	{
	peeko 0
	pusho ""
	strcmp
	itb
	not
	bne _263
	line 686
# 		MenuSetStatus("Operation cancelled");
	pushfp
	pusho "Operation cancelled"
	call MenuSetStatus

	line 687
# 		return;
	jump _return_file_load

	line 688
# 	}
	line 689
# 	
	line 690
# 	MenuSetStatus("Loading file");
: _263
: _264
	pushfp
	pusho "Loading file"
	call MenuSetStatus

	line 691
# 	fh := StreamOpenFile(newname, "r");
	peeko 0
	pusho "r"
	sys StreamOpenFile
	pokei -1

	line 692
# 	if (fh == 0)
	line 693
# 	{
	peeki -1
	pushi 0
	sub
	itb
	not
	bne _265
	line 694
# 		MenuSetStatus("Operation failed: " + AppGetErrorString());
	pushfp
	pusho "Operation failed: "
	sys AppGetErrorString
	concat
	call MenuSetStatus

	line 695
# 		return;
	jump _return_file_load

	line 696
# 	}
	line 697
# 
	line 698
# 	buffer.name := newname;
: _265
: _266
	peeko 0
	peeko 17
	pushi 0
	seta

	line 699
# 	buffer.sx := 0;
	pushi 0
	i2o
	peeko 17
	pushi 1
	seta

	line 700
# 	buffer.sy := 0;
	pushi 0
	i2o
	peeko 17
	pushi 2
	seta

	line 701
# 	buffer.bx := 0;
	pushi 0
	i2o
	peeko 17
	pushi 3
	seta

	line 702
# 	buffer.by := 0;
	pushi 0
	i2o
	peeko 17
	pushi 4
	seta

	line 703
# 	buffer.line := create(array string);
	pusho array object
	peeko 17
	pushi 5
	seta

	line 704
# 
	line 705
# 	i := 0;
	pushi 0
	pokei -2

	line 706
# 	while (!StreamEOF(fh))
: _267
	line 707
# 	{
	peeki -1
	sys StreamEOF
	not
	bne _268
	line 708
# 		sizeof(buffer.line) := i + 1;
	peeko 17
	pushi 5
	geta
	peeki -2
	pushi 1
	add
	resize

	line 709
# 		buffer.line[i] := expand_tabs(StreamReadLine(fh));
	pushfp
	peeki -1
	sys StreamReadLine
	call expand_tabs
	loado
	peeko 17
	pushi 5
	geta
	peeki -2
	seta

	line 710
# 		if ((i rem 100) == 0)
	line 711
# 			MenuSetStatus("Loading file (" + IntToString((100*StreamTell(fh))/StreamLength(fh)) + "%)");
	peeki -2
	pushi 100
	rem
	pushi 0
	sub
	itb
	not
	bne _269
	pushfp
	pusho "Loading file ("
	pushi 100
	peeki -1
	sys StreamTell
	mul
	peeki -1
	sys StreamLength
	div
	pushi 10
sys IntToStringRadix
	pusho "%)"
	concat
	concat
	call MenuSetStatus

	line 712
# 		i := i + 1;
: _269
: _270
	peeki -2
	pushi 1
	add
	pokei -2

	line 713
# 	}
	jump _267
: _268
	line 714
# 	if (i == 0)
	line 715
# 	{
	peeki -2
	pushi 0
	sub
	itb
	not
	bne _271
	line 716
# 		sizeof(buffer.line) := 1;
	peeko 17
	pushi 5
	geta
	pushi 1
	resize

	line 717
# 		buffer.line[0] := "";
	pusho ""
	peeko 17
	pushi 5
	geta
	pushi 0
	seta

	line 718
# 	}
	line 719
# 
	line 720
# 	StreamClose(fh);
: _271
: _272
	peeki -1
	sys StreamClose

	line 721
# 
	line 722
# 	MenuSetStatus("File successfully loaded");
	pushfp
	pusho "File successfully loaded"
	call MenuSetStatus

	line 723
# 	MenuUserRedraw(1, ScrHeight()-2);
	pushfp
	pushi 1
	sys ScrHeight
	pushi 2
	sub
	call MenuUserRedraw

	line 724
# }
: _return_file_load
# retract over local var i
	popi
# retract over local var fh
	popi
# retract over local var newname
	popo
	return
: _262
	line 725
# 
	line 726
# // --- Saves a file ----------------------------------------------------------
	line 727
# 
	line 728
# function void file_save
	line 729
# {
	jump _273
: file_save
	line 730
# 	string newname;
# local newname of type string at 0
	pusho ""
	line 731
# 	int fh;
# local fh of type int at 1
	pushi 0
	line 732
# 	int i;
# local i of type int at 2
	pushi 0
	line 733
# 	
	line 734
# 	MenuSetStatus("Enter filename to save:");
	pushfp
	pusho "Enter filename to save:"
	call MenuSetStatus

	line 735
# 	ScrSetFGBG(7, 1);
	pushi 7
	pushi 1
	sys ScrSetFGBG

	line 736
# 	newname := ScrXReadString(25, ScrHeight()-1, ScrWidth()-25, buffer.name);
	pushfp
	pushi 25
	sys ScrHeight
	pushi 1
	sub
	sys ScrWidth
	pushi 25
	sub
	peeko 17
	pushi 0
	geta
	call ScrXReadString
	loado
	pokeo 0

	line 737
# 	if (newname == "")
	line 738
# 	{
	peeko 0
	pusho ""
	strcmp
	itb
	not
	bne _274
	line 739
# 		MenuSetStatus("Operation cancelled");
	pushfp
	pusho "Operation cancelled"
	call MenuSetStatus

	line 740
# 		return;
	jump _return_file_save

	line 741
# 	}
	line 742
# 	
	line 743
# 	MenuSetStatus("Saveing file");
: _274
: _275
	pushfp
	pusho "Saveing file"
	call MenuSetStatus

	line 744
# 	fh := StreamOpenFile(newname, "w");
	peeko 0
	pusho "w"
	sys StreamOpenFile
	pokei -1

	line 745
# 	if (fh == 0)
	line 746
# 	{
	peeki -1
	pushi 0
	sub
	itb
	not
	bne _276
	line 747
# 		MenuSetStatus("Operation failed: " + AppGetErrorString());
	pushfp
	pusho "Operation failed: "
	sys AppGetErrorString
	concat
	call MenuSetStatus

	line 748
# 		return;
	jump _return_file_save

	line 749
# 	}
	line 750
# 
	line 751
# 	for(i:=0; i<sizeof(buffer.line); i:=i+1)
: _276
: _277
	pushi 0
	pokei -2
: _278
	peeki -2
	peeko 17
	pushi 5
	geta
	size
	sub
	blt _280
	pushi 1
	jump _281
: _280
	pushi 0
: _281
	bne _279
	line 752
# 	{
	line 753
# 		PrintString(fh, buffer.line[i]);
	peeki -1
	peeko 17
	pushi 5
	geta
	peeki -2
	geta
	sys PrintString

	line 754
# 		PrintNL(fh);
	peeki -1
	sys PrintNL

	line 755
# 		if ((i rem 100) == 0)
	line 756
# 			MenuSetStatus("Saveing file (" + IntToString((100*i)/sizeof(buffer.line)) + "%)");
	peeki -2
	pushi 100
	rem
	pushi 0
	sub
	itb
	not
	bne _282
	pushfp
	pusho "Saveing file ("
	pushi 100
	peeki -2
	mul
	peeko 17
	pushi 5
	geta
	size
	div
	pushi 10
sys IntToStringRadix
	pusho "%)"
	concat
	concat
	call MenuSetStatus

	line 757
# 	}
: _282
: _283
	peeki -2
	pushi 1
	add
	pokei -2

	jump _278
: _279
	line 758
# 
	line 759
# 	StreamClose(fh);
	peeki -1
	sys StreamClose

	line 760
# 
	line 761
# 	MenuSetStatus("File successfully saved");
	pushfp
	pusho "File successfully saved"
	call MenuSetStatus

	line 762
# 	MenuUserRedraw(1, ScrHeight()-2);
	pushfp
	pushi 1
	sys ScrHeight
	pushi 2
	sub
	call MenuUserRedraw

	line 763
# }
: _return_file_save
# retract over local var i
	popi
# retract over local var fh
	popi
# retract over local var newname
	popo
	return
: _273
	line 764
# 
	line 765
# // --- Main program itself --------------------------------------------------
	line 766
# 
	line 767
# function void main
	line 768
# {
	jump _284
: main
	line 769
# 	int e;
# local e of type int at 0
	pushi 0
	line 770
# 
	line 771
# 	if (!HasScr())
	line 772
# 	{
	sys HasScr
	not
	bne _285
	line 773
# 		PrintString(stderr, "This program requires the SCR UI module.\n");
	peeki 3
	pusho "This program requires the SCR UI module.\n"
	sys PrintString

	line 774
# 		AppExit(-1);
	pushi -1
	sys AppExit

	line 775
# 	}
	line 776
# 
	line 777
# 	buffer := create(Buffer);
: _285
: _286
	pusho array object
dupo
pushi 6
resize
	pokeo 17

	line 778
# 	buffer.name := "";
	pusho ""
	peeko 17
	pushi 0
	seta

	line 779
# 	buffer.sx := 0;
	pushi 0
	i2o
	peeko 17
	pushi 1
	seta

	line 780
# 	buffer.sy := 0;
	pushi 0
	i2o
	peeko 17
	pushi 2
	seta

	line 781
# 	buffer.bx := 0;
	pushi 0
	i2o
	peeko 17
	pushi 3
	seta

	line 782
# 	buffer.by := 0;
	pushi 0
	i2o
	peeko 17
	pushi 4
	seta

	line 783
# 	buffer.line := create(array string);
	pusho array object
	peeko 17
	pushi 5
	seta

	line 784
# 	sizeof(buffer.line) := 1;
	peeko 17
	pushi 5
	geta
	pushi 1
	resize

	line 785
# 	buffer.line[0] := "";
	pusho ""
	peeko 17
	pushi 5
	geta
	pushi 0
	seta

	line 786
# 
	line 787
# 	ScrInit();
	sys ScrInit

	line 788
# 	MenuInitialise(menubar);
	pushfp
	peeko 21
	call MenuInitialise

	line 789
# 	MenuBarDraw(menubar);
	pushfp
	peeko 21
	call MenuBarDraw

	line 790
# 	MenuUserRedraw(1, ScrHeight()-2);
	pushfp
	pushi 1
	sys ScrHeight
	pushi 2
	sub
	call MenuUserRedraw

	line 791
# 	MenuSetStatus("ME V0.1 (C) 1998 David Given");
	pushfp
	pusho "ME V0.1 (C) 1998 David Given"
	call MenuSetStatus

	line 792
# 	do {
: _287
	line 793
# 		ScrGotoXY(buffer.sx-buffer.bx, 1+buffer.sy-buffer.by);
	peeko 17
	pushi 1
	geta
	o2i
	peeko 17
	pushi 3
	geta
	o2i
	sub
	pushi 1
	peeko 17
	pushi 2
	geta
	o2i
	peeko 17
	pushi 4
	geta
	o2i
	sub
	add
	sys ScrGotoXY

	line 794
# 		e := MenuGetCh(menubar);
	pushfp
	peeko 21
	call MenuGetCh
	loadi
	pokei 0

	line 795
# 		if ((e>=32) and (e<=126))
	line 796
# 		{
	peeki 0
	pushi 32
	sub
	bge _291
	pushi 1
	jump _292
: _291
	pushi 0
: _292
	peeki 0
	pushi 126
	sub
	ble _293
	pushi 1
	jump _294
: _293
	pushi 0
: _294
	and
	bne _289
	line 797
# 			insert_character(ByteString(e));
	pushfp
	peeki 0
	sys ByteString
	call insert_character

	line 798
# 			update_status();
	pushfp
	call update_status

	line 799
# 		}
	line 800
# 		else if (e == KEY_BACKSPACE)
	jump _290
: _289
	line 801
# 		{
	peeki 0
	peeki 7
	sub
	itb
	not
	bne _295
	line 802
# 			delete_left();
	pushfp
	call delete_left

	line 803
# 			update_status();
	pushfp
	call update_status

	line 804
# 		}
	line 805
# 		else if (e == KEY_UP)
	jump _296
: _295
	line 806
# 		{
	peeki 0
	peeki 11
	sub
	itb
	not
	bne _297
	line 807
# 			move_up(1);
	pushfp
	pushi 1
	call move_up

	line 808
# 			update_status();
	pushfp
	call update_status

	line 809
# 		}
	line 810
# 		else if (e == KEY_DOWN)
	jump _298
: _297
	line 811
# 		{
	peeki 0
	peeki 10
	sub
	itb
	not
	bne _299
	line 812
# 			move_down(1);
	pushfp
	pushi 1
	call move_down

	line 813
# 			update_status();
	pushfp
	call update_status

	line 814
# 		}
	line 815
# 		else if (e == KEY_PGUP)
	jump _300
: _299
	line 816
# 		{
	peeki 0
	peeki 16
	sub
	itb
	not
	bne _301
	line 817
# 			move_up(ScrHeight() - 2);
	pushfp
	sys ScrHeight
	pushi 2
	sub
	call move_up

	line 818
# 			update_status();
	pushfp
	call update_status

	line 819
# 		}
	line 820
# 		else if (e == KEY_PGDN)
	jump _302
: _301
	line 821
# 		{
	peeki 0
	peeki 15
	sub
	itb
	not
	bne _303
	line 822
# 			move_down(ScrHeight() - 2);
	pushfp
	sys ScrHeight
	pushi 2
	sub
	call move_down

	line 823
# 			update_status();
	pushfp
	call update_status

	line 824
# 		}
	line 825
# 		else if (e == KEY_LEFT)
	jump _304
: _303
	line 826
# 		{
	peeki 0
	peeki 8
	sub
	itb
	not
	bne _305
	line 827
# 			move_left(1);
	pushfp
	pushi 1
	call move_left

	line 828
# 			update_status();
	pushfp
	call update_status

	line 829
# 		}
	line 830
# 		else if (e == KEY_RIGHT)
	jump _306
: _305
	line 831
# 		{
	peeki 0
	peeki 9
	sub
	itb
	not
	bne _307
	line 832
# 			move_right(1);
	pushfp
	pushi 1
	call move_right

	line 833
# 			update_status();
	pushfp
	call update_status

	line 834
# 		}
	line 835
# 		else if (e == KEY_ENTER)
	jump _308
: _307
	line 836
# 		{
	peeki 0
	peeki 4
	sub
	itb
	not
	bne _309
	line 837
# 			insert_cr();
	pushfp
	call insert_cr

	line 838
# 			update_status();
	pushfp
	call update_status

	line 839
# 		}
	line 840
# 		else if (e == KEY_HOME)
	jump _310
: _309
	line 841
# 		{
	peeki 0
	peeki 12
	sub
	itb
	not
	bne _311
	line 842
# 			move_home();
	pushfp
	call move_home

	line 843
# 			update_status();
	pushfp
	call update_status

	line 844
# 		}
	line 845
# 		else if (e == KEY_END)
	jump _312
: _311
	line 846
# 		{
	peeki 0
	peeki 13
	sub
	itb
	not
	bne _313
	line 847
# 			move_end();
	pushfp
	call move_end

	line 848
# 			update_status();
	pushfp
	call update_status

	line 849
# 		}
	line 850
# 		else if (e == EVENT_LOAD)
	jump _314
: _313
	line 851
# 			file_load();
	peeki 0
	peeki 19
	sub
	itb
	not
	bne _315
	pushfp
	call file_load

	line 852
# 		else if (e == EVENT_SAVE)
	jump _316
: _315
	line 853
# 			file_save();
	peeki 0
	peeki 20
	sub
	itb
	not
	bne _317
	pushfp
	call file_save

	line 854
# 		else if (e == EVENT_EXIT)
	jump _318
: _317
	line 855
# 			break;
	peeki 0
	peeki 18
	sub
	itb
	not
	bne _319
	jump _288
	line 856
# 	} while (1);
: _319
: _320
: _318
: _316
: _314
: _312
: _310
: _308
: _306
: _304
: _302
: _300
: _298
: _296
: _290
	pushi 1
	beq _287
: _288
	line 857
# 
	line 858
# 	ScrSetFGBG(7, 0);
	pushi 7
	pushi 0
	sys ScrSetFGBG

	line 859
# 	ScrClear();
	sys ScrClear

	line 860
# 	ScrShutdown();
	sys ScrShutdown

	line 861
# }
: _return_main
# retract over local var e
	popi
	return
: _284
	line 862
# 
	line 863
# end;
	pushfp
	call main
	halt
	end

	line 1
# // snake.mi
	line 2
# // A simple game demonstrating the SCR module
	line 3
# 
	line 4
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
	line 5
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
	line 6
# 
	line 7
# global int gridwidth;
# global gridwidth of type int at 17
	pushi 0
	line 8
# global int gridheight;
# global gridheight of type int at 18
	pushi 0
	line 9
# global int score;
# global score of type int at 19
	pushi 0
	line 10
# global array int grid;
# global grid of type array int at 20
	pusho array int
	line 11
# global int growth;
# global growth of type int at 21
	pushi 0
	line 12
# global int head;
# global head of type int at 22
	pushi 0
	line 13
# global int tail;
# global tail of type int at 23
	pushi 0
	line 14
# global int vector;
# global vector of type int at 24
	pushi 0
	line 15
# global int delay;
# global delay of type int at 25
	pushi 0
	line 16
# global int goal;
# global goal of type int at 26
	pushi 0
	line 17
# global int goaltime;
# global goaltime of type int at 27
	pushi 0
	line 18
# 
	line 19
# // --- Draws the title `picture' ----------------------------------------------
	line 20
# 
	line 21
# global array byte title_sea_bitmap := StringToByteArray(
# global title_sea_bitmap of type array byte at 28
	line 22
# 	"02220033333000200" +
	pusho "02220033333000200"
	line 23
# 	"20002030000002020" +
	pusho "20002030000002020"
	line 24
# 	"20000030000020002" +
	pusho "20000030000020002"
	line 25
# 	"02220033330020002" +
	pusho "02220033330020002"
	line 26
# 	"00002030000022222" +
	pusho "00002030000022222"
	line 27
# 	"20002030000020002" +
	pusho "20002030000020002"
	line 28
# 	"02220033333020002");
	pusho "02220033333020002"
	concat
	concat
	concat
	concat
	concat
	concat
	sys StringToByteArray
	line 29
# 
	line 30
# global array byte title_snake_bitmap := StringToByteArray(
# global title_snake_bitmap of type array byte at 29
	line 31
# 	"06660040004000600040004066666" +
	pusho "06660040004000600040004066666"
	line 32
# 	"60006044004006060040040060000" +
	pusho "60006044004006060040040060000"
	line 33
# 	"60000040404060006040400060000" +
	pusho "60000040404060006040400060000"
	line 34
# 	"06660040404060006044000066660" +
	pusho "06660040404060006044000066660"
	line 35
# 	"00006040044066666040400060000" +
	pusho "00006040044066666040400060000"
	line 36
# 	"60006040004060006040040060000" +
	pusho "60006040004060006040040060000"
	line 37
# 	"06660040004060006040004066666");
	pusho "06660040004060006040004066666"
	concat
	concat
	concat
	concat
	concat
	concat
	sys StringToByteArray
	line 38
# 
	line 39
# function void draw_bitmap
	line 40
# 	int x;
# argument x of type int at 0
	line 41
# 	int y;
# argument y of type int at 1
	line 42
# 	array byte bitmap;
# argument bitmap of type array byte at 2
	line 43
# {
	jump _5
: draw_bitmap
	line 44
# 	int i;
# local i of type int at 3
	pushi 0
	line 45
# 	int width := sizeof(bitmap) / 7;
# local width of type int at 4
	peeko -2
	size
	pushi 7
	div
	line 46
# 
	line 47
# 	ScrGotoXY(x, y);
	peeki 0
	peeki -1
	sys ScrGotoXY

	line 48
# 	for(i:=0; i<sizeof(bitmap); i:=i+1)
	pushi 0
	pokei -3
: _6
	peeki -3
	peeko -2
	size
	sub
	blt _8
	pushi 1
	jump _9
: _8
	pushi 0
: _9
	bne _7
	line 49
# 	{
	line 50
# 		ScrSetBG(bitmap[i]-48);
	peeko -2
	peeki -3
	geta
	pushi 48
	sub
	sys ScrSetBG

	line 51
# 		ScrPutStr(" ");
	pusho " "
	sys ScrPutStr

	line 52
# 		if ((i rem width) == (width - 1))
	line 53
# 		{
	peeki -3
	peeki -4
	rem
	peeki -4
	pushi 1
	sub
	sub
	itb
	not
	bne _10
	line 54
# 			y := y + 1;
	peeki -1
	pushi 1
	add
	pokei -1

	line 55
# 			ScrGotoXY(x, y);
	peeki 0
	peeki -1
	sys ScrGotoXY

	line 56
# 		}
	line 57
# 	}
: _10
: _11
	peeki -3
	pushi 1
	add
	pokei -3

	jump _6
: _7
	line 58
# }
: _return_draw_bitmap
# retract over local var width
	popi
# retract over local var i
	popi
# retract over local var bitmap
	popo
# retract over local var y
	popi
# retract over local var x
	popi
	return
: _5
	line 59
# 
	line 60
# function void draw_box
	line 61
# 	int x1;
# argument x1 of type int at 0
	line 62
# 	int y1;
# argument y1 of type int at 1
	line 63
# 	int x2;
# argument x2 of type int at 2
	line 64
# 	int y2;
# argument y2 of type int at 3
	line 65
# {
	jump _12
: draw_box
	line 66
# 	int i;
# local i of type int at 4
	pushi 0
	line 67
# 
	line 68
# 	ScrGotoXY(x1+1, y1);
	peeki 0
	pushi 1
	add
	peeki -1
	sys ScrGotoXY

	line 69
# 	ScrPutStr(StringDup((x2-x1)-1, "-"));
	pushfp
	peeki -2
	peeki 0
	sub
	pushi 1
	sub
	pusho "-"
	call StringDup
	loado
	sys ScrPutStr

	line 70
# 	ScrGotoXY(x1+1, y2);
	peeki 0
	pushi 1
	add
	peeki -3
	sys ScrGotoXY

	line 71
# 	ScrPutStr(StringDup((x2-x1)-1, "-"));
	pushfp
	peeki -2
	peeki 0
	sub
	pushi 1
	sub
	pusho "-"
	call StringDup
	loado
	sys ScrPutStr

	line 72
# 
	line 73
# 	for(i:=(y1+1); i<y2; i:=i+1)
	peeki -1
	pushi 1
	add
	pokei -4
: _13
	peeki -4
	peeki -3
	sub
	blt _15
	pushi 1
	jump _16
: _15
	pushi 0
: _16
	bne _14
	line 74
# 	{
	line 75
# 		ScrGotoXY(x1, i);
	peeki 0
	peeki -4
	sys ScrGotoXY

	line 76
# 		ScrPutStr("|");
	pusho "|"
	sys ScrPutStr

	line 77
# 		ScrGotoXY(x2, i);
	peeki -2
	peeki -4
	sys ScrGotoXY

	line 78
# 		ScrPutStr("|");
	pusho "|"
	sys ScrPutStr

	line 79
# 	}
	peeki -4
	pushi 1
	add
	pokei -4

	jump _13
: _14
	line 80
# }
: _return_draw_box
# retract over local var i
	popi
# retract over local var y2
	popi
# retract over local var x2
	popi
# retract over local var y1
	popi
# retract over local var x1
	popi
	return
: _12
	line 81
# 
	line 82
# function void draw_title
	line 83
# {
	jump _17
: draw_title
	line 84
# 	int i;
# local i of type int at 0
	pushi 0
	line 85
# 
	line 86
# 	ScrSetFGBG(7, 0);
	pushi 7
	pushi 0
	sys ScrSetFGBG

	line 87
# 	ScrClear();
	sys ScrClear

	line 88
# 	for(i:=0; i<10; i:=i+1)
	pushi 0
	pokei 0
: _18
	peeki 0
	pushi 10
	sub
	blt _20
	pushi 1
	jump _21
: _20
	pushi 0
: _21
	bne _19
	line 89
# 	{
	line 90
# 		ScrGotoXY(RandomNumber(ScrWidth()-1), RandomNumber(ScrHeight()-1));
	sys ScrWidth
	pushi 1
	sub
	sys RandomNumber
	sys ScrHeight
	pushi 1
	sub
	sys RandomNumber
	sys ScrGotoXY

	line 91
# 		ScrSetFGBG(4, 0);
	pushi 4
	pushi 0
	sys ScrSetFGBG

	line 92
# 		ScrPutStr("*");
	pusho "*"
	sys ScrPutStr

	line 93
# 		ScrGotoXY(RandomNumber(ScrWidth()-1), RandomNumber(ScrHeight()-1));
	sys ScrWidth
	pushi 1
	sub
	sys RandomNumber
	sys ScrHeight
	pushi 1
	sub
	sys RandomNumber
	sys ScrGotoXY

	line 94
# 		ScrSetFGBG(6, 0);
	pushi 6
	pushi 0
	sys ScrSetFGBG

	line 95
# 		ScrPutStr("*");
	pusho "*"
	sys ScrPutStr

	line 96
# 	}
	peeki 0
	pushi 1
	add
	pokei 0

	jump _18
: _19
	line 97
# 		
	line 98
# 	draw_bitmap((ScrWidth()/2)-8, 4, title_sea_bitmap);
	pushfp
	sys ScrWidth
	pushi 2
	div
	pushi 8
	sub
	pushi 4
	peeko 28
	call draw_bitmap

	line 99
# 	draw_bitmap((ScrWidth()/2)-14, 12, title_snake_bitmap);
	pushfp
	sys ScrWidth
	pushi 2
	div
	pushi 14
	sub
	pushi 12
	peeko 29
	call draw_bitmap

	line 100
# 	ScrSetFGBG(2, 0);
	pushi 2
	pushi 0
	sys ScrSetFGBG

	line 101
# 	draw_box(10, 2, 70, 20);
	pushfp
	pushi 10
	pushi 2
	pushi 70
	pushi 20
	call draw_box

	line 102
# 
	line 103
# 	ScrSetFG(5);
	pushi 5
	sys ScrSetFG

	line 104
# 	ScrGotoXY((ScrWidth()/2)-16, ScrHeight()-3);
	sys ScrWidth
	pushi 2
	div
	pushi 16
	sub
	sys ScrHeight
	pushi 3
	sub
	sys ScrGotoXY

	line 105
# 	ScrPutStr("An interactive game by David Given");
	pusho "An interactive game by David Given"
	sys ScrPutStr

	line 106
# 	ScrSetFG(1);
	pushi 1
	sys ScrSetFG

	line 107
# 	ScrGotoXY((ScrWidth()/2)-12, ScrHeight()-2);
	sys ScrWidth
	pushi 2
	div
	pushi 12
	sub
	sys ScrHeight
	pushi 2
	sub
	sys ScrGotoXY

	line 108
# 	ScrPutStr("Press the space bar to play");
	pusho "Press the space bar to play"
	sys ScrPutStr

	line 109
# 
	line 110
# 	// This is a neat trick to initialise the random number generator
	line 111
# 
	line 112
# 	i := TimeNow();
	sys TimeNow
	pokei 0

	line 113
# 	while (ScrGetCh() != 32)
: _22
	line 114
# 	{}
	sys ScrGetCh
	pushi 32
	sub
	itb
	bne _23
	jump _22
: _23
	line 115
# 	RandomSetSeed(TimeNow());
	sys TimeNow
	sys RandomSetSeed

	line 116
# }
: _return_draw_title
# retract over local var i
	popi
	return
: _17
	line 117
# 
	line 118
# // --- Draw game over message -------------------------------------------------
	line 119
# 
	line 120
# function void draw_gameover
	line 121
# {
	jump _24
: draw_gameover
	line 122
# 	int x1 := (ScrWidth()/2) - 20;
# local x1 of type int at 0
	sys ScrWidth
	pushi 2
	div
	pushi 20
	sub
	line 123
# 	int y1 := (ScrHeight()/4);
# local y1 of type int at 1
	sys ScrHeight
	pushi 4
	div
	line 124
# 	int x2 := (ScrWidth()/2) + 20;
# local x2 of type int at 2
	sys ScrWidth
	pushi 2
	div
	pushi 20
	add
	line 125
# 	int y2 := (3*ScrHeight()/4) - 2;
# local y2 of type int at 3
	pushi 3
	sys ScrHeight
	pushi 4
	div
	mul
	pushi 2
	sub
	line 126
# 	string rank;
# local rank of type string at 4
	pusho ""
	line 127
# 
	line 128
# 	ScrSetFGBG(7, 4);
	pushi 7
	pushi 4
	sys ScrSetFGBG

	line 129
# 	ScrClearArea(x1, y1, x2, y2);
	peeki 0
	peeki -1
	peeki -2
	peeki -3
	sys ScrClearArea

	line 130
# 	ScrGotoXY((ScrWidth()/2) - 5, y1+1);
	sys ScrWidth
	pushi 2
	div
	pushi 5
	sub
	peeki -1
	pushi 1
	add
	sys ScrGotoXY

	line 131
# 	ScrPutStr("GAME OVER");
	pusho "GAME OVER"
	sys ScrPutStr

	line 132
# 
	line 133
# 	ScrSetFG(2);
	pushi 2
	sys ScrSetFG

	line 134
# 	ScrGotoXY((ScrWidth()/2) - 11, y1+4);
	sys ScrWidth
	pushi 2
	div
	pushi 11
	sub
	peeki -1
	pushi 4
	add
	sys ScrGotoXY

	line 135
# 	ScrPutStr("You reached a score of:");
	pusho "You reached a score of:"
	sys ScrPutStr

	line 136
# 	
	line 137
# 	ScrSetFG(3);
	pushi 3
	sys ScrSetFG

	line 138
# 	ScrGotoXY((ScrWidth()/2) - 1, y1+6);
	sys ScrWidth
	pushi 2
	div
	pushi 1
	sub
	peeki -1
	pushi 6
	add
	sys ScrGotoXY

	line 139
# 	ScrPutStr(IntToString(score));
	peeki 19
	pushi 10
sys IntToStringRadix
	sys ScrPutStr

	line 140
# 
	line 141
# 	if (score == 5)
	line 142
# 		rank := "someone who doesn't know the keys";
	peeki 19
	pushi 5
	sub
	itb
	not
	bne _25
	pusho "someone who doesn't know the keys"
	pokeo -4

	line 143
# 	else if (score < 10)
	jump _26
: _25
	line 144
# 		rank := "an animate left thumb";
	peeki 19
	pushi 10
	sub
	blt _29
	pushi 1
	jump _30
: _29
	pushi 0
: _30
	bne _27
	pusho "an animate left thumb"
	pokeo -4

	line 145
# 	else if (score < 20)
	jump _28
: _27
	line 146
# 		rank := "someone who can't be bothered playing";
	peeki 19
	pushi 20
	sub
	blt _33
	pushi 1
	jump _34
: _33
	pushi 0
: _34
	bne _31
	pusho "someone who can't be bothered playing"
	pokeo -4

	line 147
# 	else if (score < 40)
	jump _32
: _31
	line 148
# 		rank := "someone who is beginning to perserve";
	peeki 19
	pushi 40
	sub
	blt _37
	pushi 1
	jump _38
: _37
	pushi 0
: _38
	bne _35
	pusho "someone who is beginning to perserve"
	pokeo -4

	line 149
# 	else if (score < 60)
	jump _36
: _35
	line 150
# 		rank := "someone needing to practice";
	peeki 19
	pushi 60
	sub
	blt _41
	pushi 1
	jump _42
: _41
	pushi 0
: _42
	bne _39
	pusho "someone needing to practice"
	pokeo -4

	line 151
# 	else if (score < 100)
	jump _40
: _39
	line 152
# 		rank := "someone with potential";
	peeki 19
	pushi 100
	sub
	blt _45
	pushi 1
	jump _46
: _45
	pushi 0
: _46
	bne _43
	pusho "someone with potential"
	pokeo -4

	line 153
# 	else if (score < 150)
	jump _44
: _43
	line 154
# 		rank := "quite good";
	peeki 19
	pushi 150
	sub
	blt _49
	pushi 1
	jump _50
: _49
	pushi 0
: _50
	bne _47
	pusho "quite good"
	pokeo -4

	line 155
# 	else if (score < 200)
	jump _48
: _47
	line 156
# 		rank := "better than I am";
	peeki 19
	pushi 200
	sub
	blt _53
	pushi 1
	jump _54
: _53
	pushi 0
: _54
	bne _51
	pusho "better than I am"
	pokeo -4

	line 157
# 	else if (score < 250)
	jump _52
: _51
	line 158
# 		rank := "wasting your life on this game";
	peeki 19
	pushi 250
	sub
	blt _57
	pushi 1
	jump _58
: _57
	pushi 0
: _58
	bne _55
	pusho "wasting your life on this game"
	pokeo -4

	line 159
# 	else if (score < 300)
	jump _56
: _55
	line 160
# 		rank := "a cheater";
	peeki 19
	pushi 300
	sub
	blt _61
	pushi 1
	jump _62
: _61
	pushi 0
: _62
	bne _59
	pusho "a cheater"
	pokeo -4

	line 161
# 
	line 162
# 	ScrGotoXY((ScrWidth()/2) - (sizeof(rank)/2), y2-1);
: _59
: _60
: _56
: _52
: _48
: _44
: _40
: _36
: _32
: _28
: _26
	sys ScrWidth
	pushi 2
	div
	peeko -4
	size
	pushi 2
	div
	sub
	peeki -3
	pushi 1
	sub
	sys ScrGotoXY

	line 163
# 	ScrPutStr(rank);
	peeko -4
	sys ScrPutStr

	line 164
# 
	line 165
# 	ScrSetFG(2);
	pushi 2
	sys ScrSetFG

	line 166
# 	ScrGotoXY((ScrWidth()/2) - 8, y2-2);
	sys ScrWidth
	pushi 2
	div
	pushi 8
	sub
	peeki -3
	pushi 2
	sub
	sys ScrGotoXY

	line 167
# 	ScrPutStr("which makes you");
	pusho "which makes you"
	sys ScrPutStr

	line 168
# 
	line 169
# 	ScrSetFGBG(3, 2);
	pushi 3
	pushi 2
	sys ScrSetFGBG

	line 170
# 	ScrClearArea(x1, y2+2, x2, y2+2);
	peeki 0
	peeki -3
	pushi 2
	add
	peeki -2
	peeki -3
	pushi 2
	add
	sys ScrClearArea

	line 171
# 	ScrGotoXY((ScrWidth()/2) - 11, y2+2);
	sys ScrWidth
	pushi 2
	div
	pushi 11
	sub
	peeki -3
	pushi 2
	add
	sys ScrGotoXY

	line 172
# 	ScrPutStr("Press space to continue");
	pusho "Press space to continue"
	sys ScrPutStr

	line 173
# 
	line 174
# 	while (ScrGetCh() != 32)
: _63
	line 175
# 	{}
	sys ScrGetCh
	pushi 32
	sub
	itb
	bne _64
	jump _63
: _64
	line 176
# }
: _return_draw_gameover
# retract over local var rank
	popo
# retract over local var y2
	popi
# retract over local var x2
	popi
# retract over local var y1
	popi
# retract over local var x1
	popi
	return
: _24
	line 177
# 
	line 178
# // --- Clears the grid --------------------------------------------------------
	line 179
# 
	line 180
# function void clear_grid
	line 181
# {
	jump _65
: clear_grid
	line 182
# 	int i := 0;
# local i of type int at 0
	pushi 0
	line 183
# 	while (i < sizeof(grid))
: _66
	line 184
# 	{
	peeki 0
	peeko 20
	size
	sub
	blt _68
	pushi 1
	jump _69
: _68
	pushi 0
: _69
	bne _67
	line 185
# 		grid[i] := (i rem gridwidth) == 0;
	peeki 0
	peeki 17
	rem
	pushi 0
	sub
	itb
	not
	peeko 20
	peeki 0
	seta

	line 186
# 		i := i + 1;
	peeki 0
	pushi 1
	add
	pokei 0

	line 187
# 	}
	jump _66
: _67
	line 188
# }
: _return_clear_grid
# retract over local var i
	popi
	return
: _65
	line 189
# 
	line 190
# // --- Draw the box -----------------------------------------------------------
	line 191
# 
	line 192
# function void draw_game_area
	line 193
# {
	jump _70
: draw_game_area
	line 194
# 	ScrSetFGBG(7, 1);
	pushi 7
	pushi 1
	sys ScrSetFGBG

	line 195
# 	ScrClearArea(0, 1, ScrWidth()-1, ScrHeight()-1);
	pushi 0
	pushi 1
	sys ScrWidth
	pushi 1
	sub
	sys ScrHeight
	pushi 1
	sub
	sys ScrClearArea

	line 196
# 	ScrSetFGBG(7, 0);
	pushi 7
	pushi 0
	sys ScrSetFGBG

	line 197
# 	ScrClearArea(2, 2, ScrWidth()-3, ScrHeight()-2);
	pushi 2
	pushi 2
	sys ScrWidth
	pushi 3
	sub
	sys ScrHeight
	pushi 2
	sub
	sys ScrClearArea

	line 198
# }
: _return_draw_game_area
	return
: _70
	line 199
# 
	line 200
# // --- Draw a `pixel' ---------------------------------------------------------
	line 201
# 
	line 202
# function void draw_pixel
	line 203
# 	int pos;
# argument pos of type int at 0
	line 204
# 	int value;
# argument value of type int at 1
	line 205
# {
	jump _71
: draw_pixel
	line 206
# 	int x := pos rem gridwidth;
# local x of type int at 2
	peeki 0
	peeki 17
	rem
	line 207
# 	int y := pos / gridwidth;
# local y of type int at 3
	peeki 0
	peeki 17
	div
	line 208
# 	
	line 209
# 	ScrGotoXY(x*2, 2+y);
	peeki -2
	pushi 2
	mul
	pushi 2
	peeki -3
	add
	sys ScrGotoXY

	line 210
# 	if (value > 0)
	line 211
# 	{
	peeki -1
	pushi 0
	sub
	bgt _74
	pushi 1
	jump _75
: _74
	pushi 0
: _75
	bne _72
	line 212
# 		if (value < 10)
	line 213
# 			ScrPutStr(" ");
	peeki -1
	pushi 10
	sub
	blt _78
	pushi 1
	jump _79
: _78
	pushi 0
: _79
	bne _76
	pusho " "
	sys ScrPutStr

	line 214
# 		ScrPutStr(IntToString(value));
: _76
: _77
	peeki -1
	pushi 10
sys IntToStringRadix
	sys ScrPutStr

	line 215
# 	}
	line 216
# 	else
	line 217
# 		ScrPutStr("  ");
	jump _73
: _72
	pusho "  "
	sys ScrPutStr

: _73
	line 218
# }
: _return_draw_pixel
# retract over local var y
	popi
# retract over local var x
	popi
# retract over local var value
	popi
# retract over local var pos
	popi
	return
: _71
	line 219
# 
	line 220
# // --- Creates a goal ---------------------------------------------------------
	line 221
# 
	line 222
# function void new_goal
	line 223
# {
	jump _80
: new_goal
	line 224
# 	do {
: _81
	line 225
# 		goal := RandomNumber(sizeof(grid));
	peeko 20
	size
	sys RandomNumber
	pokei 26

	line 226
# 	} while (grid[goal] != 0);
	peeko 20
	peeki 26
	geta
	pushi 0
	sub
	itb
	beq _81
: _82
	line 227
# 	goaltime := TimeNow() + 10000;
	sys TimeNow
	pushi 10000
	add
	pokei 27

	line 228
# 	grid[goal] := 2;
	pushi 2
	peeko 20
	peeki 26
	seta

	line 229
# }
: _return_new_goal
	return
: _80
	line 230
# 
	line 231
# // --- Processes the goal -----------------------------------------------------
	line 232
# 
	line 233
# function void process_goal
	line 234
# {
	jump _83
: process_goal
	line 235
# 	int t := (goaltime - TimeNow()) / 1000;
# local t of type int at 0
	peeki 27
	sys TimeNow
	sub
	pushi 1000
	div
	line 236
# 
	line 237
# 	if (t <= 0)
	line 238
# 	{
	peeki 0
	pushi 0
	sub
	ble _86
	pushi 1
	jump _87
: _86
	pushi 0
: _87
	bne _84
	line 239
# 		ScrSetFGBG(0, 0);
	pushi 0
	pushi 0
	sys ScrSetFGBG

	line 240
# 		draw_pixel(goal, 0);
	pushfp
	peeki 26
	pushi 0
	call draw_pixel

	line 241
# 		grid[goal] := 0;
	pushi 0
	peeko 20
	peeki 26
	seta

	line 242
# 		new_goal();
	pushfp
	call new_goal

	line 243
# 		t := 9;
	pushi 9
	pokei 0

	line 244
# 	}
	line 245
# 	
	line 246
# 	ScrSetFGBG(6, 4);
: _84
: _85
	pushi 6
	pushi 4
	sys ScrSetFGBG

	line 247
# 	draw_pixel(goal, t);
	pushfp
	peeki 26
	peeki 0
	call draw_pixel

	line 248
# }
: _return_process_goal
# retract over local var t
	popi
	return
: _83
	line 249
# 
	line 250
# // --- Update status bar ------------------------------------------------------
	line 251
# 
	line 252
# function void update_status_bar
	line 253
# {
	jump _88
: update_status_bar
	line 254
# 	string s := IntToString(score);
# local s of type string at 0
	peeki 19
	pushi 10
sys IntToStringRadix
	line 255
# 	
	line 256
# 	ScrGotoXY((ScrWidth()-2)-sizeof(s), 0);
	sys ScrWidth
	pushi 2
	sub
	peeko 0
	size
	sub
	pushi 0
	sys ScrGotoXY

	line 257
# 	ScrSetFGBG(3, 0);
	pushi 3
	pushi 0
	sys ScrSetFGBG

	line 258
# 	ScrPutStr(s);
	peeko 0
	sys ScrPutStr

	line 259
# }
: _return_update_status_bar
# retract over local var s
	popo
	return
: _88
	line 260
# 	
	line 261
# // --- Update static part of bar ----------------------------------------------
	line 262
# 
	line 263
# function void draw_static_bar
	line 264
# {
	jump _89
: draw_static_bar
	line 265
# 	string s := "S*E*A   S*N*A*K*E";
# local s of type string at 0
	pusho "S*E*A   S*N*A*K*E"
	line 266
# 	int x := (ScrWidth()/2) - sizeof(s);
# local x of type int at 1
	sys ScrWidth
	pushi 2
	div
	peeko 0
	size
	sub
	line 267
# 	int c := 0;
# local c of type int at 2
	pushi 0
	line 268
# 	int i := 0;
# local i of type int at 3
	pushi 0
	line 269
# 
	line 270
# 	while (i<sizeof(s))
: _90
	line 271
# 	{
	peeki -3
	peeko 0
	size
	sub
	blt _92
	pushi 1
	jump _93
: _92
	pushi 0
: _93
	bne _91
	line 272
# 		ScrGotoXY(x + (i*2), 0);
	peeki -1
	peeki -3
	pushi 2
	mul
	add
	pushi 0
	sys ScrGotoXY

	line 273
# 		ScrSetFGBG(3 + (c*2), 0);
	pushi 3
	peeki -2
	pushi 2
	mul
	add
	pushi 0
	sys ScrSetFGBG

	line 274
# 		ScrPutStr(s[i]);
	peeko 0
	peeki -3
	pushi 1
	sys StringMid
	sys ScrPutStr

	line 275
# 		i := i + 1;
	peeki -3
	pushi 1
	add
	pokei -3

	line 276
# 		c := 1 - c;
	pushi 1
	peeki -2
	sub
	pokei -2

	line 277
# 	}
	jump _90
: _91
	line 278
# }
: _return_draw_static_bar
# retract over local var i
	popi
# retract over local var c
	popi
# retract over local var x
	popi
# retract over local var s
	popo
	return
: _89
	line 279
# 	
	line 280
# // --- Main game loop ---------------------------------------------------------
	line 281
# 
	line 282
# function void main_loop
	line 283
# {
	jump _94
: main_loop
	line 284
# 	int c;
# local c of type int at 0
	pushi 0
	line 285
# 	int time := TimeNow();
# local time of type int at 1
	sys TimeNow
	line 286
# 
	line 287
# 	while (1)
: _95
	line 288
# 	{
	pushi 1
	bne _96
	line 289
# 		update_status_bar();
	pushfp
	call update_status_bar

	line 290
# 		process_goal();
	pushfp
	call process_goal

	line 291
# 
	line 292
# 		// Wait
	line 293
# 		
	line 294
# 		ScrGotoXY(0, 0);
	pushi 0
	pushi 0
	sys ScrGotoXY

	line 295
# 		TimeSleepUntil(time+delay);
	peeki -1
	peeki 25
	add
	sys TimeSleepUntil

	line 296
# 		time := TimeNow();
	sys TimeNow
	pokei -1

	line 297
# 		
	line 298
# 		// Flush buffer and get keypress, if there is one
	line 299
# 
	line 300
# 		c := 0;
	pushi 0
	pokei 0

	line 301
# 		while (ScrKeyHit())
: _97
	line 302
# 			c := ScrGetCh();
	sys ScrKeyHit
	bne _98
	sys ScrGetCh
	pokei 0

	jump _97
: _98
	line 303
# 		
	line 304
# 		head := head + vector;
	peeki 22
	peeki 24
	add
	pokei 22

	line 305
# 		if ((head < 0) or (head >= sizeof(grid)))
	line 306
# 			return;
	peeki 22
	pushi 0
	sub
	blt _101
	pushi 1
	jump _102
: _101
	pushi 0
: _102
	peeki 22
	peeko 20
	size
	sub
	bge _103
	pushi 1
	jump _104
: _103
	pushi 0
: _104
	or
	bne _99
	jump _return_main_loop

	line 307
# 		if (grid[head] == 2)
: _99
: _100
	line 308
# 		{
	peeko 20
	peeki 22
	geta
	pushi 2
	sub
	itb
	not
	bne _105
	line 309
# 			growth := growth + 5;
	peeki 21
	pushi 5
	add
	pokei 21

	line 310
# 			new_goal();
	pushfp
	call new_goal

	line 311
# 		}
	line 312
# 		else if (grid[head] != 0)
	jump _106
: _105
	line 313
# 			return;
	peeko 20
	peeki 22
	geta
	pushi 0
	sub
	itb
	bne _107
	jump _return_main_loop

	line 314
# 			
	line 315
# 		if (c == KEY_ESCAPE)
: _107
: _108
: _106
	line 316
# 			return;
	peeki 0
	peeki 6
	sub
	itb
	not
	bne _109
	jump _return_main_loop

	line 317
# 		else if (c == KEY_LEFT)
	jump _110
: _109
	line 318
# 			vector := -1;
	peeki 0
	peeki 8
	sub
	itb
	not
	bne _111
	pushi -1
	pokei 24

	line 319
# 		else if (c == KEY_RIGHT)
	jump _112
: _111
	line 320
# 			vector := 1;
	peeki 0
	peeki 9
	sub
	itb
	not
	bne _113
	pushi 1
	pokei 24

	line 321
# 		else if (c == KEY_UP)
	jump _114
: _113
	line 322
# 			vector := 0-gridwidth;
	peeki 0
	peeki 11
	sub
	itb
	not
	bne _115
	pushi 0
	peeki 17
	sub
	pokei 24

	line 323
# 		else if (c == KEY_DOWN)
	jump _116
: _115
	line 324
# 			vector := gridwidth;
	peeki 0
	peeki 10
	sub
	itb
	not
	bne _117
	peeki 17
	pokei 24

	line 325
# 			
	line 326
# 		grid[head] := vector;
: _117
: _118
: _116
: _114
: _112
: _110
	peeki 24
	peeko 20
	peeki 22
	seta

	line 327
# 		
	line 328
# 		ScrSetFGBG(0, 7);
	pushi 0
	pushi 7
	sys ScrSetFGBG

	line 329
# 		draw_pixel(head, 0);
	pushfp
	peeki 22
	pushi 0
	call draw_pixel

	line 330
# 		
	line 331
# 		if (growth > 0)
	line 332
# 		{
	peeki 21
	pushi 0
	sub
	bgt _121
	pushi 1
	jump _122
: _121
	pushi 0
: _122
	bne _119
	line 333
# 			score := score + 1;
	peeki 19
	pushi 1
	add
	pokei 19

	line 334
# 			growth := growth - 1;
	peeki 21
	pushi 1
	sub
	pokei 21

	line 335
# 		}
	line 336
# 		else
	line 337
# 		{
	jump _120
: _119
	line 338
# 			ScrSetFGBG(7, 0);
	pushi 7
	pushi 0
	sys ScrSetFGBG

	line 339
# 			draw_pixel(tail, 0);
	pushfp
	peeki 23
	pushi 0
	call draw_pixel

	line 340
# 			c := grid[tail];
	peeko 20
	peeki 23
	geta
	pokei 0

	line 341
# 			grid[tail] := 0;
	pushi 0
	peeko 20
	peeki 23
	seta

	line 342
# 			tail := tail + c;
	peeki 23
	peeki 0
	add
	pokei 23

	line 343
# 		}
: _120
	line 344
# 		
	line 345
# 	}
	jump _95
: _96
	line 346
# }
: _return_main_loop
# retract over local var time
	popi
# retract over local var c
	popi
	return
: _94
	line 347
# 
	line 348
# // --- Main program -----------------------------------------------------------
	line 349
# 
	line 350
# function void main
	line 351
# {
	jump _123
: main
	line 352
# 	if (!HasScr())
	line 353
# 	{
	sys HasScr
	not
	bne _124
	line 354
# 		PrintString(stderr, "This program requires the SCR UI module.\n");
	peeki 3
	pusho "This program requires the SCR UI module.\n"
	sys PrintString

	line 355
# 		AppExit(-1);
	pushi -1
	sys AppExit

	line 356
# 	}
	line 357
# 	
	line 358
# 	ScrInit();
: _124
: _125
	sys ScrInit

	line 359
# 	gridwidth := (ScrWidth()/2) - 1;
	sys ScrWidth
	pushi 2
	div
	pushi 1
	sub
	pokei 17

	line 360
# 	gridheight := ScrHeight() - 3;
	sys ScrHeight
	pushi 3
	sub
	pokei 18

	line 361
# 	sizeof(grid) := gridwidth * gridheight;
	peeko 20
	peeki 17
	peeki 18
	mul
	resize

	line 362
# 	
	line 363
# 	while(1)
: _126
	line 364
# 	{
	pushi 1
	bne _127
	line 365
# 		draw_title();
	pushfp
	call draw_title

	line 366
# 
	line 367
# 		// Initialise for a game
	line 368
# 	
	line 369
# 		clear_grid();
	pushfp
	call clear_grid

	line 370
# 		draw_game_area();
	pushfp
	call draw_game_area

	line 371
# 		score := 0;
	pushi 0
	pokei 19

	line 372
# 		growth := 5;
	pushi 5
	pokei 21

	line 373
# 		delay := 100;
	pushi 100
	pokei 25

	line 374
# 		head := gridwidth*(gridheight/2) + gridwidth/2;
	peeki 17
	peeki 18
	pushi 2
	div
	mul
	peeki 17
	pushi 2
	div
	add
	pokei 22

	line 375
# 		tail := head;
	peeki 22
	pokei 23

	line 376
# 		vector := 0-gridwidth;
	pushi 0
	peeki 17
	sub
	pokei 24

	line 377
# 		grid[head] := vector;
	peeki 24
	peeko 20
	peeki 22
	seta

	line 378
# 		new_goal();
	pushfp
	call new_goal

	line 379
# 		draw_static_bar();
	pushfp
	call draw_static_bar

	line 380
# 	
	line 381
# 		// Actually play a game
	line 382
# 
	line 383
# 		main_loop();
	pushfp
	call main_loop

	line 384
# 
	line 385
# 		// Do the Game Over stuff
	line 386
# 
	line 387
# 		draw_gameover();
	pushfp
	call draw_gameover

	line 388
# 	}
	jump _126
: _127
	line 389
# }
: _return_main
	return
: _123
	line 390
# 
	line 391
# end;
	pushfp
	call main
	halt
	end

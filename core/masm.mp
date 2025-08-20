	line 1
# // Micron-P assembler
	line 2
# // This uses the early subset of Micron that gets translated into another
	line 3
# // language for compilation.
	line 4
# // (C) 1998 David Given
	line 5
# 
	line 6
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
	line 7
# 
	line 8
# // --- Global variables ------------------------------------------------------
	line 9
# 
	line 10
# global int infile := 0;
# global infile of type int at 4
	pushi 0
	line 11
# global int outfile := 0;
# global outfile of type int at 5
	pushi 0
	line 12
# 
	line 13
# // Op structure
	line 14
# 
	line 15
# structure Opcode := {
	line 16
# 	int value;
	line 17
# 	int amode;
	line 18
# };
	line 19
# 
	line 20
# global dict Opcode op;
# global op of type dict Opcode at 6
	pusho dict object
	line 21
# 
	line 22
# // Addressing modes
	line 23
# 
	line 24
# global int A_COMPLEX	:= 0;
# global A_COMPLEX of type int at 7
	pushi 0
	line 25
# global int A_SIMPLE	:= 1;
# global A_SIMPLE of type int at 8
	pushi 1
	line 26
# global int A_PUSHO	:= 2;
# global A_PUSHO of type int at 9
	pushi 2
	line 27
# global int A_SYS	:= 3;
# global A_SYS of type int at 10
	pushi 3
	line 28
# global int A_OFFSET	:= 4;
# global A_OFFSET of type int at 11
	pushi 4
	line 29
# global int A_PUSHI	:= 5;
# global A_PUSHI of type int at 12
	pushi 5
	line 30
# 
	line 31
# global int A_CONSTANT	:= 10;
# global A_CONSTANT of type int at 13
	pushi 10
	line 32
# global int A_END	:= 11;
# global A_END of type int at 14
	pushi 11
	line 33
# global int A_COMMENT	:= 12;
# global A_COMMENT of type int at 15
	pushi 12
	line 34
# 
	line 35
# // State
	line 36
# 
	line 37
# global int pass		:= 0;	// The current pass number
# global pass of type int at 16
	pushi 0
	line 38
# global int errors	:= 0;	// Set to report errors
# global errors of type int at 17
	pushi 0
	line 39
# global int codegen	:= 1;	// Set to generate code
# global codegen of type int at 18
	pushi 1
	line 40
# global int changeflag	:= 2;	// Set if a symbol has changed
# global changeflag of type int at 19
	pushi 2
	line 41
# 
	line 42
# global int linenum	:= 0;	// Current line number
# global linenum of type int at 20
	pushi 0
	line 43
# global int pc		:= 1;	// Current program counter
# global pc of type int at 21
	pushi 1
	line 44
# 
	line 45
# global dict int syscalls;	// System calls used
# global syscalls of type dict int at 22
	pusho dict int
	line 46
# global int nsyscalls;		// How many system calls used
# global nsyscalls of type int at 23
	pushi 0
	line 47
# global dict int constants;	// Defined constants & labels
# global constants of type dict int at 24
	pusho dict int
	line 48
# 
	line 49
# // ===========================================================================
	line 50
# //              GENERAL-PURPOSE UTILITIES & SYSTEM FUNCTIONS
	line 51
# // ===========================================================================
	line 52
# 
	line 53
# // --- Process command line arguments ----------------------------------------
	line 54
# 
	line 55
# function void ProcessCommandLine
	line 56
# {
	jump _5
: ProcessCommandLine
	line 57
# 	array string args := AppGetArguments();
# local args of type array string at 0
	sys AppGetArguments
	line 58
# 	string filename;
# local filename of type string at 1
	pusho ""
	line 59
# 
	line 60
# 	if (sizeof(args) < 3)
	line 61
# 	{
	peeko 0
	size
	pushi 3
	sub
	blt _8
	pushi 1
	jump _9
: _8
	pushi 0
: _9
	bne _6
	line 62
# 		PrintString(stderr, "Syntax: masm <input filename> <output filename>\n");
	peeki 3
	pusho "Syntax: masm <input filename> <output filename>\n"
	sys PrintString

	line 63
# 		AppExit(1);
	pushi 1
	sys AppExit

	line 64
# 	}
	line 65
# 	
	line 66
# 	filename := args[1];
: _6
: _7
	peeko 0
	pushi 1
	geta
	pokeo -1

	line 67
# //	filename := "..\\mic.mp";
	line 68
# 	infile := StreamOpenFile(filename, "r");
	peeko -1
	pusho "r"
	sys StreamOpenFile
	pokei 4

	line 69
# 	
	line 70
# 	if (infile == 0)
	line 71
# 	{
	peeki 4
	pushi 0
	sub
	itb
	not
	bne _10
	line 72
# 		PrintString(stderr, "Error: couldn't open input file: ");
	peeki 3
	pusho "Error: couldn't open input file: "
	sys PrintString

	line 73
# 		PrintString(stderr, AppGetErrorString());
	peeki 3
	sys AppGetErrorString
	sys PrintString

	line 74
# 		PrintNL(stderr);
	peeki 3
	sys PrintNL

	line 75
# 		AppExit(1);
	pushi 1
	sys AppExit

	line 76
# 	}
	line 77
# 	
	line 78
# 	filename := args[2];
: _10
: _11
	peeko 0
	pushi 2
	geta
	pokeo -1

	line 79
# //	filename := "..\\mic.mo";
	line 80
# 	outfile := StreamOpenFile(filename, "w");
	peeko -1
	pusho "w"
	sys StreamOpenFile
	pokei 5

	line 81
# 	
	line 82
# 	if (outfile == 0)
	line 83
# 	{
	peeki 5
	pushi 0
	sub
	itb
	not
	bne _12
	line 84
# 		PrintString(stderr, "Error: couldn't open output file: ");
	peeki 3
	pusho "Error: couldn't open output file: "
	sys PrintString

	line 85
# 		PrintString(stderr, AppGetErrorString());
	peeki 3
	sys AppGetErrorString
	sys PrintString

	line 86
# 		PrintNL(stderr);
	peeki 3
	sys PrintNL

	line 87
# 		AppExit(1);
	pushi 1
	sys AppExit

	line 88
# 	}
	line 89
# }
: _12
: _13
: _return_ProcessCommandLine
# retract over local var filename
	popo
# retract over local var args
	popo
	return
: _5
	line 90
# 
	line 91
# // --- Report an error -------------------------------------------------------
	line 92
# 
	line 93
# function void error
	line 94
# 	string msg;
# argument msg of type string at 0
	line 95
# {
	jump _14
: error
	line 96
# 	PrintString(stderr, "Error: ");
	peeki 3
	pusho "Error: "
	sys PrintString

	line 97
# 	PrintString(stderr, msg);
	peeki 3
	peeko 0
	sys PrintString

	line 98
# 	PrintNL(stderr);
	peeki 3
	sys PrintNL

	line 99
# 	AppExit(1);
	pushi 1
	sys AppExit

	line 100
# }
: _return_error
# retract over local var msg
	popo
	return
: _14
	line 101
# 
	line 102
# // --- Process escape sequences ---------------------------------------------
	line 103
# 
	line 104
# function string escape
	line 105
# 	string argument;
# argument argument of type string at 0
	line 106
# {
	jump _15
: escape
	line 107
# 	string s := "";
# local s of type string at 1
	pusho ""
	line 108
# 	int i := 0;
# local i of type int at 2
	pushi 0
	line 109
# 	int n := sizeof(argument);
# local n of type int at 3
	peeko 0
	size
	line 110
# 	string c;
# local c of type string at 4
	pusho ""
	line 111
# 	
	line 112
# 	while (i < n)
: _16
	line 113
# 	{
	peeki -2
	peeki -3
	sub
	blt _18
	pushi 1
	jump _19
: _18
	pushi 0
: _19
	bne _17
	line 114
# 		c := argument[i];
	peeko 0
	peeki -2
	pushi 1
	sys StringMid
	pokeo -4

	line 115
# 		if (c == "\\")
	line 116
# 		{
	peeko -4
	pusho "\\"
	strcmp
	itb
	not
	bne _20
	line 117
# 			i := i + 1;
	peeki -2
	pushi 1
	add
	pokei -2

	line 118
# 			if (i == n)
	line 119
# 				error("Unexpected EOS processing escape sequence");
	peeki -2
	peeki -3
	sub
	itb
	not
	bne _22
	pushfp
	pusho "Unexpected EOS processing escape sequence"
	call error

	line 120
# 			c := argument[i];
: _22
: _23
	peeko 0
	peeki -2
	pushi 1
	sys StringMid
	pokeo -4

	line 121
# 			if (c == "n")
	line 122
# 				s := s + ByteString(10);
	peeko -4
	pusho "n"
	strcmp
	itb
	not
	bne _24
	peeko -1
	pushi 10
	sys ByteString
	concat
	pokeo -1

	line 123
# 			else if (c == "t")
	jump _25
: _24
	line 124
# 				s := s + ByteString(9);
	peeko -4
	pusho "t"
	strcmp
	itb
	not
	bne _26
	peeko -1
	pushi 9
	sys ByteString
	concat
	pokeo -1

	line 125
# 			else if (c == "\\")
	jump _27
: _26
	line 126
# 				s := s + ByteString(92);
	peeko -4
	pusho "\\"
	strcmp
	itb
	not
	bne _28
	peeko -1
	pushi 92
	sys ByteString
	concat
	pokeo -1

	line 127
# 			else if (c == "\"")
	jump _29
: _28
	line 128
# 				s := s + ByteString(34);
	peeko -4
	pusho "\""
	strcmp
	itb
	not
	bne _30
	peeko -1
	pushi 34
	sys ByteString
	concat
	pokeo -1

	line 129
# 			else
	line 130
# 				s := s + c;
	jump _31
: _30
	peeko -1
	peeko -4
	concat
	pokeo -1

: _31
: _29
: _27
: _25
	line 131
# 		}
	line 132
# 		else
	line 133
# 			s := s + c;
	jump _21
: _20
	peeko -1
	peeko -4
	concat
	pokeo -1

: _21
	line 134
# 		i := i + 1;
	peeki -2
	pushi 1
	add
	pokei -2

	line 135
# 	}
	jump _16
: _17
	line 136
# 	
	line 137
# 	return s;
	peeko -1
	saveo
	jump _return_escape

	line 138
# }
	pushi 0
	savei
: _return_escape
# retract over local var c
	popo
# retract over local var n
	popi
# retract over local var i
	popi
# retract over local var s
	popo
# retract over local var argument
	popo
	return
: _15
	line 139
# 
	line 140
# // ===========================================================================
	line 141
# //                            DATA INITIALISATION
	line 142
# // ===========================================================================
	line 143
# 
	line 144
# // Create a single OP structure.
	line 145
# 
	line 146
# function Opcode CreateOp
	line 147
# 	int value;
# argument value of type int at 0
	line 148
# 	int amode;
# argument amode of type int at 1
	line 149
# {
	jump _32
: CreateOp
	line 150
# 	Opcode a;
# local a of type Opcode at 2
	pusho array object
dupo
pushi 2
resize
	line 151
# 	
	line 152
# 	a.value := value;
	peeki 0
	i2o
	peeko -2
	pushi 0
	seta

	line 153
# 	a.amode := amode << 8;
	peeki -1
	pushi 8
	shl
	i2o
	peeko -2
	pushi 1
	seta

	line 154
# 	
	line 155
# 	return a;
	peeko -2
	saveo
	jump _return_CreateOp

	line 156
# }
	pusho array object
dupo
pushi 2
resize
	saveo
: _return_CreateOp
# retract over local var a
	popo
# retract over local var amode
	popi
# retract over local var value
	popi
	return
: _32
	line 157
# 
	line 158
# // Initialise the opcode table.
	line 159
# 
	line 160
# function void LoadOps
	line 161
# {
	jump _33
: LoadOps
	line 162
# 	int p := 0;
# local p of type int at 0
	pushi 0
	line 163
# 	
	line 164
# 	op["pushi"]		:= CreateOp(p, A_PUSHI);	p := p + 4;
	pushfp
	peeki 0
	peeki 12
	call CreateOp
	loado
	peeko 6
	pusho "pushi"
	setd

	peeki 0
	pushi 4
	add
	pokei 0

	line 165
# 	op["add"]		:= CreateOp(p, A_COMPLEX);	p := p + 4;
	pushfp
	peeki 0
	peeki 7
	call CreateOp
	loado
	peeko 6
	pusho "add"
	setd

	peeki 0
	pushi 4
	add
	pokei 0

	line 166
# 	op["sub"]		:= CreateOp(p, A_COMPLEX);	p := p + 4;
	pushfp
	peeki 0
	peeki 7
	call CreateOp
	loado
	peeko 6
	pusho "sub"
	setd

	peeki 0
	pushi 4
	add
	pokei 0

	line 167
# 	op["mul"]		:= CreateOp(p, A_COMPLEX);	p := p + 4;
	pushfp
	peeki 0
	peeki 7
	call CreateOp
	loado
	peeko 6
	pusho "mul"
	setd

	peeki 0
	pushi 4
	add
	pokei 0

	line 168
# 	op["div"]		:= CreateOp(p, A_COMPLEX);	p := p + 4;
	pushfp
	peeki 0
	peeki 7
	call CreateOp
	loado
	peeko 6
	pusho "div"
	setd

	peeki 0
	pushi 4
	add
	pokei 0

	line 169
# 	op["rem"]		:= CreateOp(p, A_COMPLEX);	p := p + 4;
	pushfp
	peeki 0
	peeki 7
	call CreateOp
	loado
	peeko 6
	pusho "rem"
	setd

	peeki 0
	pushi 4
	add
	pokei 0

	line 170
# 	op["and"]		:= CreateOp(p, A_COMPLEX);	p := p + 4;
	pushfp
	peeki 0
	peeki 7
	call CreateOp
	loado
	peeko 6
	pusho "and"
	setd

	peeki 0
	pushi 4
	add
	pokei 0

	line 171
# 	op["or"]		:= CreateOp(p, A_COMPLEX);	p := p + 4;
	pushfp
	peeki 0
	peeki 7
	call CreateOp
	loado
	peeko 6
	pusho "or"
	setd

	peeki 0
	pushi 4
	add
	pokei 0

	line 172
# 	op["xor"]		:= CreateOp(p, A_COMPLEX);	p := p + 4;
	pushfp
	peeki 0
	peeki 7
	call CreateOp
	loado
	peeko 6
	pusho "xor"
	setd

	peeki 0
	pushi 4
	add
	pokei 0

	line 173
# 	op["shl"]		:= CreateOp(p, A_COMPLEX);	p := p + 4;
	pushfp
	peeki 0
	peeki 7
	call CreateOp
	loado
	peeko 6
	pusho "shl"
	setd

	peeki 0
	pushi 4
	add
	pokei 0

	line 174
# 	op["shr"]		:= CreateOp(p, A_COMPLEX);	p := p + 4;
	pushfp
	peeki 0
	peeki 7
	call CreateOp
	loado
	peeko 6
	pusho "shr"
	setd

	peeki 0
	pushi 4
	add
	pokei 0

	line 175
# 	op["beq"]		:= CreateOp(p, A_OFFSET);	p := p + 4;
	pushfp
	peeki 0
	peeki 11
	call CreateOp
	loado
	peeko 6
	pusho "beq"
	setd

	peeki 0
	pushi 4
	add
	pokei 0

	line 176
# 	op["bne"]		:= CreateOp(p, A_OFFSET);	p := p + 4;
	pushfp
	peeki 0
	peeki 11
	call CreateOp
	loado
	peeko 6
	pusho "bne"
	setd

	peeki 0
	pushi 4
	add
	pokei 0

	line 177
# 	op["blt"]		:= CreateOp(p, A_OFFSET);	p := p + 4;
	pushfp
	peeki 0
	peeki 11
	call CreateOp
	loado
	peeko 6
	pusho "blt"
	setd

	peeki 0
	pushi 4
	add
	pokei 0

	line 178
# 	op["ble"]		:= CreateOp(p, A_OFFSET);	p := p + 4;
	pushfp
	peeki 0
	peeki 11
	call CreateOp
	loado
	peeko 6
	pusho "ble"
	setd

	peeki 0
	pushi 4
	add
	pokei 0

	line 179
# 	op["bgt"]		:= CreateOp(p, A_OFFSET);	p := p + 4;
	pushfp
	peeki 0
	peeki 11
	call CreateOp
	loado
	peeko 6
	pusho "bgt"
	setd

	peeki 0
	pushi 4
	add
	pokei 0

	line 180
# 	op["bge"]		:= CreateOp(p, A_OFFSET);	p := p + 4;
	pushfp
	peeki 0
	peeki 11
	call CreateOp
	loado
	peeko 6
	pusho "bge"
	setd

	peeki 0
	pushi 4
	add
	pokei 0

	line 181
# 	op["jump"]		:= CreateOp(p, A_OFFSET);	p := p + 4;
	pushfp
	peeki 0
	peeki 11
	call CreateOp
	loado
	peeko 6
	pusho "jump"
	setd

	peeki 0
	pushi 4
	add
	pokei 0

	line 182
# 	op["call"]		:= CreateOp(p, A_OFFSET);	p := p + 4;
	pushfp
	peeki 0
	peeki 11
	call CreateOp
	loado
	peeko 6
	pusho "call"
	setd

	peeki 0
	pushi 4
	add
	pokei 0

	line 183
# 	op["sys"]		:= CreateOp(p, A_SYS);		p := p + 4;
	pushfp
	peeki 0
	peeki 10
	call CreateOp
	loado
	peeko 6
	pusho "sys"
	setd

	peeki 0
	pushi 4
	add
	pokei 0

	line 184
# 	op["geta"]		:= CreateOp(p, A_COMPLEX);	p := p + 4;
	pushfp
	peeki 0
	peeki 7
	call CreateOp
	loado
	peeko 6
	pusho "geta"
	setd

	peeki 0
	pushi 4
	add
	pokei 0

	line 185
# 	op["seta"]		:= CreateOp(p, A_COMPLEX);	p := p + 4;
	pushfp
	peeki 0
	peeki 7
	call CreateOp
	loado
	peeko 6
	pusho "seta"
	setd

	peeki 0
	pushi 4
	add
	pokei 0

	line 186
# 	op["peeki"]		:= CreateOp(p, A_COMPLEX);	p := p + 4;
	pushfp
	peeki 0
	peeki 7
	call CreateOp
	loado
	peeko 6
	pusho "peeki"
	setd

	peeki 0
	pushi 4
	add
	pokei 0

	line 187
# 	op["pokei"]		:= CreateOp(p, A_COMPLEX);	p := p + 4;
	pushfp
	peeki 0
	peeki 7
	call CreateOp
	loado
	peeko 6
	pusho "pokei"
	setd

	peeki 0
	pushi 4
	add
	pokei 0

	line 188
# 	op["peeko"]		:= CreateOp(p, A_COMPLEX);	p := p + 4;
	pushfp
	peeki 0
	peeki 7
	call CreateOp
	loado
	peeko 6
	pusho "peeko"
	setd

	peeki 0
	pushi 4
	add
	pokei 0

	line 189
# 	op["pokeo"]		:= CreateOp(p, A_COMPLEX);	p := p + 4;
	pushfp
	peeki 0
	peeki 7
	call CreateOp
	loado
	peeko 6
	pusho "pokeo"
	setd

	peeki 0
	pushi 4
	add
	pokei 0

	line 190
# 	op["line"]		:= CreateOp(p, A_COMPLEX);	p := p + 4;
	pushfp
	peeki 0
	peeki 7
	call CreateOp
	loado
	peeko 6
	pusho "line"
	setd

	peeki 0
	pushi 4
	add
	pokei 0

	line 191
# 	
	line 192
# 	p := 200;
	pushi 200
	pokei 0

	line 193
# 	op["pushi1"]		:= CreateOp(p, A_SIMPLE);	p := p + 1;
	pushfp
	peeki 0
	peeki 8
	call CreateOp
	loado
	peeko 6
	pusho "pushi1"
	setd

	peeki 0
	pushi 1
	add
	pokei 0

	line 194
# 	op["pushi-1"]		:= CreateOp(p, A_SIMPLE);	p := p + 1;
	pushfp
	peeki 0
	peeki 8
	call CreateOp
	loado
	peeko 6
	pusho "pushi-1"
	setd

	peeki 0
	pushi 1
	add
	pokei 0

	line 195
# 	op["pusho"]		:= CreateOp(p, A_PUSHO);	p := p + 3;
	pushfp
	peeki 0
	peeki 9
	call CreateOp
	loado
	peeko 6
	pusho "pusho"
	setd

	peeki 0
	pushi 3
	add
	pokei 0

	line 196
# 	op["not"]		:= CreateOp(p, A_SIMPLE);	p := p + 1;
	pushfp
	peeki 0
	peeki 8
	call CreateOp
	loado
	peeko 6
	pusho "not"
	setd

	peeki 0
	pushi 1
	add
	pokei 0

	line 197
# 	op["itb"]		:= CreateOp(p, A_SIMPLE);	p := p + 1;
	pushfp
	peeki 0
	peeki 8
	call CreateOp
	loado
	peeko 6
	pusho "itb"
	setd

	peeki 0
	pushi 1
	add
	pokei 0

	line 198
# 	op["return"]		:= CreateOp(p, A_SIMPLE);	p := p + 1;
	pushfp
	peeki 0
	peeki 8
	call CreateOp
	loado
	peeko 6
	pusho "return"
	setd

	peeki 0
	pushi 1
	add
	pokei 0

	line 199
# 	op["concat"]		:= CreateOp(p, A_SIMPLE);	p := p + 1;
	pushfp
	peeki 0
	peeki 8
	call CreateOp
	loado
	peeko 6
	pusho "concat"
	setd

	peeki 0
	pushi 1
	add
	pokei 0

	line 200
# 	op["popi"]		:= CreateOp(p, A_SIMPLE);	p := p + 1;
	pushfp
	peeki 0
	peeki 8
	call CreateOp
	loado
	peeko 6
	pusho "popi"
	setd

	peeki 0
	pushi 1
	add
	pokei 0

	line 201
# 	op["popo"]		:= CreateOp(p, A_SIMPLE);	p := p + 1;
	pushfp
	peeki 0
	peeki 8
	call CreateOp
	loado
	peeko 6
	pusho "popo"
	setd

	peeki 0
	pushi 1
	add
	pokei 0

	line 202
# 	op["halt"]		:= CreateOp(p, A_SIMPLE);	p := p + 1;
	pushfp
	peeki 0
	peeki 8
	call CreateOp
	loado
	peeko 6
	pusho "halt"
	setd

	peeki 0
	pushi 1
	add
	pokei 0

	line 203
# 	op["savei"]		:= CreateOp(p, A_SIMPLE);	p := p + 1;
	pushfp
	peeki 0
	peeki 8
	call CreateOp
	loado
	peeko 6
	pusho "savei"
	setd

	peeki 0
	pushi 1
	add
	pokei 0

	line 204
# 	op["saveo"]		:= CreateOp(p, A_SIMPLE);	p := p + 1;
	pushfp
	peeki 0
	peeki 8
	call CreateOp
	loado
	peeko 6
	pusho "saveo"
	setd

	peeki 0
	pushi 1
	add
	pokei 0

	line 205
# 	op["loadi"]		:= CreateOp(p, A_SIMPLE);	p := p + 1;
	pushfp
	peeki 0
	peeki 8
	call CreateOp
	loado
	peeko 6
	pusho "loadi"
	setd

	peeki 0
	pushi 1
	add
	pokei 0

	line 206
# 	op["loado"]		:= CreateOp(p, A_SIMPLE);	p := p + 1;
	pushfp
	peeki 0
	peeki 8
	call CreateOp
	loado
	peeko 6
	pusho "loado"
	setd

	peeki 0
	pushi 1
	add
	pokei 0

	line 207
# 	op["pushfp"]		:= CreateOp(p, A_SIMPLE);	p := p + 1;
	pushfp
	peeki 0
	peeki 8
	call CreateOp
	loado
	peeko 6
	pusho "pushfp"
	setd

	peeki 0
	pushi 1
	add
	pokei 0

	line 208
# 	op["strcmp"]		:= CreateOp(p, A_SIMPLE);	p := p + 1;
	pushfp
	peeki 0
	peeki 8
	call CreateOp
	loado
	peeko 6
	pusho "strcmp"
	setd

	peeki 0
	pushi 1
	add
	pokei 0

	line 209
# 	op["resize"]		:= CreateOp(p, A_SIMPLE);	p := p + 1;
	pushfp
	peeki 0
	peeki 8
	call CreateOp
	loado
	peeko 6
	pusho "resize"
	setd

	peeki 0
	pushi 1
	add
	pokei 0

	line 210
# 	op["push_nil"]		:= CreateOp(p, A_SIMPLE);	p := p + 1;
	pushfp
	peeki 0
	peeki 8
	call CreateOp
	loado
	peeko 6
	pusho "push_nil"
	setd

	peeki 0
	pushi 1
	add
	pokei 0

	line 211
# 	op["push_abyte"]	:= CreateOp(p, A_SIMPLE);	p := p + 1;
	pushfp
	peeki 0
	peeki 8
	call CreateOp
	loado
	peeko 6
	pusho "push_abyte"
	setd

	peeki 0
	pushi 1
	add
	pokei 0

	line 212
# 	op["push_aint"]		:= CreateOp(p, A_SIMPLE);	p := p + 1;
	pushfp
	peeki 0
	peeki 8
	call CreateOp
	loado
	peeko 6
	pusho "push_aint"
	setd

	peeki 0
	pushi 1
	add
	pokei 0

	line 213
# 	op["push_aobj"]		:= CreateOp(p, A_SIMPLE);	p := p + 1;
	pushfp
	peeki 0
	peeki 8
	call CreateOp
	loado
	peeko 6
	pusho "push_aobj"
	setd

	peeki 0
	pushi 1
	add
	pokei 0

	line 214
# 	op["size"]		:= CreateOp(p, A_SIMPLE);	p := p + 1;
	pushfp
	peeki 0
	peeki 8
	call CreateOp
	loado
	peeko 6
	pusho "size"
	setd

	peeki 0
	pushi 1
	add
	pokei 0

	line 215
# 	op["neg"]		:= CreateOp(p, A_SIMPLE);	p := p + 1;
	pushfp
	peeki 0
	peeki 8
	call CreateOp
	loado
	peeko 6
	pusho "neg"
	setd

	peeki 0
	pushi 1
	add
	pokei 0

	line 216
# 	op["push_dbyte"]	:= CreateOp(p, A_SIMPLE);	p := p + 1;
	pushfp
	peeki 0
	peeki 8
	call CreateOp
	loado
	peeko 6
	pusho "push_dbyte"
	setd

	peeki 0
	pushi 1
	add
	pokei 0

	line 217
# 	op["push_dint"]		:= CreateOp(p, A_SIMPLE);	p := p + 1;
	pushfp
	peeki 0
	peeki 8
	call CreateOp
	loado
	peeko 6
	pusho "push_dint"
	setd

	peeki 0
	pushi 1
	add
	pokei 0

	line 218
# 	op["push_dobj"]		:= CreateOp(p, A_SIMPLE);	p := p + 1;
	pushfp
	peeki 0
	peeki 8
	call CreateOp
	loado
	peeko 6
	pusho "push_dobj"
	setd

	peeki 0
	pushi 1
	add
	pokei 0

	line 219
# 	op["getd"]		:= CreateOp(p, A_SIMPLE);	p := p + 1;
	pushfp
	peeki 0
	peeki 8
	call CreateOp
	loado
	peeko 6
	pusho "getd"
	setd

	peeki 0
	pushi 1
	add
	pokei 0

	line 220
# 	op["setd"]		:= CreateOp(p, A_SIMPLE);	p := p + 1;
	pushfp
	peeki 0
	peeki 8
	call CreateOp
	loado
	peeko 6
	pusho "setd"
	setd

	peeki 0
	pushi 1
	add
	pokei 0

	line 221
# 	op["statd"]		:= CreateOp(p, A_SIMPLE);	p := p + 1;
	pushfp
	peeki 0
	peeki 8
	call CreateOp
	loado
	peeko 6
	pusho "statd"
	setd

	peeki 0
	pushi 1
	add
	pokei 0

	line 222
# 	op["isnil"]		:= CreateOp(p, A_SIMPLE);	p := p + 1;
	pushfp
	peeki 0
	peeki 8
	call CreateOp
	loado
	peeko 6
	pusho "isnil"
	setd

	peeki 0
	pushi 1
	add
	pokei 0

	line 223
# 	op["dupi"]		:= CreateOp(p, A_SIMPLE);	p := p + 1;
	pushfp
	peeki 0
	peeki 8
	call CreateOp
	loado
	peeko 6
	pusho "dupi"
	setd

	peeki 0
	pushi 1
	add
	pokei 0

	line 224
# 	op["dupo"]		:= CreateOp(p, A_SIMPLE);	p := p + 1;
	pushfp
	peeki 0
	peeki 8
	call CreateOp
	loado
	peeko 6
	pusho "dupo"
	setd

	peeki 0
	pushi 1
	add
	pokei 0

	line 225
# 	op["i2o"]		:= CreateOp(p, A_SIMPLE);	p := p + 1;
	pushfp
	peeki 0
	peeki 8
	call CreateOp
	loado
	peeko 6
	pusho "i2o"
	setd

	peeki 0
	pushi 1
	add
	pokei 0

	line 226
# 	op["o2i"]		:= CreateOp(p, A_SIMPLE);	p := p + 1;
	pushfp
	peeki 0
	peeki 8
	call CreateOp
	loado
	peeko 6
	pusho "o2i"
	setd

	peeki 0
	pushi 1
	add
	pokei 0

	line 227
# 	op["insert_array"]	:= CreateOp(p, A_SIMPLE);	p := p + 1;
	pushfp
	peeki 0
	peeki 8
	call CreateOp
	loado
	peeko 6
	pusho "insert_array"
	setd

	peeki 0
	pushi 1
	add
	pokei 0

	line 228
# 	op["delete_array"]	:= CreateOp(p, A_SIMPLE);	p := p + 1;
	pushfp
	peeki 0
	peeki 8
	call CreateOp
	loado
	peeko 6
	pusho "delete_array"
	setd

	peeki 0
	pushi 1
	add
	pokei 0

	line 229
# 	op["delete_dict"]	:= CreateOp(p, A_SIMPLE);	p := p + 1;
	pushfp
	peeki 0
	peeki 8
	call CreateOp
	loado
	peeko 6
	pusho "delete_dict"
	setd

	peeki 0
	pushi 1
	add
	pokei 0

	line 230
# 	
	line 231
# 	op["#"]			:= CreateOp(-1, A_COMMENT);
	pushfp
	pushi -1
	peeki 15
	call CreateOp
	loado
	peeko 6
	pusho "#"
	setd

	line 232
# 	op[":"]			:= CreateOp(-1, A_CONSTANT);
	pushfp
	pushi -1
	peeki 13
	call CreateOp
	loado
	peeko 6
	pusho ":"
	setd

	line 233
# 	op["end"]		:= CreateOp(-1, A_END);
	pushfp
	pushi -1
	peeki 14
	call CreateOp
	loado
	peeko 6
	pusho "end"
	setd

	line 234
# }
: _return_LoadOps
# retract over local var p
	popi
	return
: _33
	line 235
# 
	line 236
# // ===========================================================================
	line 237
# //                              CODE EMISSION
	line 238
# // ===========================================================================
	line 239
# 
	line 240
# // Output a byte
	line 241
# 
	line 242
# function void emit
	line 243
# 	int b;
# argument b of type int at 0
	line 244
# {
	jump _34
: emit
	line 245
# 	if (codegen)
	line 246
# 		StreamWriteByte(outfile, b);
	peeki 18
	bne _35
	peeki 5
	peeki 0
	sys StreamWriteByte

	line 247
# 	pc := pc + 1;
: _35
: _36
	peeki 21
	pushi 1
	add
	pokei 21

	line 248
# }
: _return_emit
# retract over local var b
	popi
	return
: _34
	line 249
# 
	line 250
# // Output a short
	line 251
# 
	line 252
# function void emit_short
	line 253
# 	int v;
# argument v of type int at 0
	line 254
# {
	jump _37
: emit_short
	line 255
# 	emit(v and 255);
	pushfp
	peeki 0
	pushi 255
	and
	call emit

	line 256
# 	emit(v >> 8);
	pushfp
	peeki 0
	pushi 8
	shr
	call emit

	line 257
# }
: _return_emit_short
# retract over local var v
	popi
	return
: _37
	line 258
# 
	line 259
# // Output a long
	line 260
# 
	line 261
# function void emit_long
	line 262
# 	int v;
# argument v of type int at 0
	line 263
# {
	jump _38
: emit_long
	line 264
# 	emit_short(v and 65535);
	pushfp
	peeki 0
	pushi 65535
	and
	call emit_short

	line 265
# 	emit_short(v >> 16);
	pushfp
	peeki 0
	pushi 16
	shr
	call emit_short

	line 266
# }
: _return_emit_long
# retract over local var v
	popi
	return
: _38
	line 267
# 
	line 268
# // Emit a string, not terminated
	line 269
# 
	line 270
# function void emit_string
	line 271
# 	string s;
# argument s of type string at 0
	line 272
# {
	jump _39
: emit_string
	line 273
# 	int n := sizeof(s);
# local n of type int at 1
	peeko 0
	size
	line 274
# 	int i;
# local i of type int at 2
	pushi 0
	line 275
# 	
	line 276
# 	for(i:=0; i<n; i:=i+1)
	pushi 0
	pokei -2
: _40
	peeki -2
	peeki -1
	sub
	blt _42
	pushi 1
	jump _43
: _42
	pushi 0
: _43
	bne _41
	line 277
# 		emit(StringByte(s[i]));
	pushfp
	peeko 0
	peeki -2
	pushi 1
	sys StringMid
	sys StringByte
	call emit

	peeki -2
	pushi 1
	add
	pokei -2

	jump _40
: _41
	line 278
# }
: _return_emit_string
# retract over local var i
	popi
# retract over local var n
	popi
# retract over local var s
	popo
	return
: _39
	line 279
# 
	line 280
# // Emit the file header
	line 281
# 
	line 282
# function void EmitHeader
	line 283
# 	int progsize;
# argument progsize of type int at 0
	line 284
# {
	jump _44
: EmitHeader
	line 285
# 	array string a := list(syscalls);
# local a of type array string at 1
	peeko 22
	sys DictToArray
	line 286
# 	int n := sizeof(a);
# local n of type int at 2
	peeko -1
	size
	line 287
# 	int i;
# local i of type int at 3
	pushi 0
	line 288
# 
	line 289
# 	// Magic number
	line 290
# 	
	line 291
# 	emit_string(".mp ");
	pushfp
	pusho ".mp "
	call emit_string

	line 292
# 	
	line 293
# 	// File version
	line 294
# 	
	line 295
# 	emit(0);
	pushfp
	pushi 0
	call emit

	line 296
# 	emit(3);
	pushfp
	pushi 3
	call emit

	line 297
# 	
	line 298
# 	// Number of entries in header table
	line 299
# 	
	line 300
# 	emit_short(n);
	pushfp
	peeki -2
	call emit_short

	line 301
# 		
	line 302
# //	PrintString(stderr, "System calls used:\n");
	line 303
# 	for (i:=0; i<n; i:=i+1)
	pushi 0
	pokei -3
: _45
	peeki -3
	peeki -2
	sub
	blt _47
	pushi 1
	jump _48
: _47
	pushi 0
: _48
	bne _46
	line 304
# 	{
	line 305
# //		PrintString(stderr, "\t");
	line 306
# //		PrintShort(stderr, syscalls[a[i]]);
	line 307
# //		PrintString(stderr, "\t");
	line 308
# //		PrintString(stderr, a[i]);
	line 309
# //		PrintNL(stderr);
	line 310
# 		
	line 311
# 		emit_short(syscalls[a[i]]);
	pushfp
	peeko 22
	peeko -1
	peeki -3
	geta
	getd
	call emit_short

	line 312
# 		emit_string(a[i]);
	pushfp
	peeko -1
	peeki -3
	geta
	call emit_string

	line 313
# 		emit(0);
	pushfp
	pushi 0
	call emit

	line 314
# 	}
	peeki -3
	pushi 1
	add
	pokei -3

	jump _45
: _46
	line 315
# 	
	line 316
# 	// Size of code
	line 317
# 	
	line 318
# 	emit_long(progsize);
	pushfp
	peeki 0
	call emit_long

	line 319
# }
: _return_EmitHeader
# retract over local var i
	popi
# retract over local var n
	popi
# retract over local var a
	popo
# retract over local var progsize
	popi
	return
: _44
	line 320
# 
	line 321
# // ===========================================================================
	line 322
# //                           ACTUAL ASSEMBLER BIT
	line 323
# // ===========================================================================
	line 324
# 
	line 325
# // Decodes a value.
	line 326
# 
	line 327
# function int getvalue
	line 328
# 	string s;
# argument s of type string at 0
	line 329
# {
	jump _49
: getvalue
	line 330
# 	if (constants contains s)
	line 331
# 		return constants[s];
	peeko 24
	peeko 0
	statd
	bne _50
	peeko 24
	peeko 0
	getd
	savei
	jump _return_getvalue

	line 332
# 	if (IsDigit(s[0]) or (s[0] == "-"))
: _50
: _51
	line 333
# 		return StringToInt(s);
	peeko 0
	pushi 0
	pushi 1
	sys StringMid
	sys IsDigit
	peeko 0
	pushi 0
	pushi 1
	sys StringMid
	pusho "-"
	strcmp
	itb
	not
	or
	bne _52
	peeko 0
	pushi 10
sys StringToIntRadix
	savei
	jump _return_getvalue

	line 334
# 	
	line 335
# 	if (pass>1)
: _52
: _53
	line 336
# 		error("Undefined symbol `"+s+"'");
	peeki 16
	pushi 1
	sub
	bgt _56
	pushi 1
	jump _57
: _56
	pushi 0
: _57
	bne _54
	pushfp
	pusho "Undefined symbol `"
	peeko 0
	pusho "'"
	concat
	concat
	call error

	line 337
# }
: _54
: _55
	pushi 0
	savei
: _return_getvalue
# retract over local var s
	popo
	return
: _49
	line 338
# 
	line 339
# // Does a single pass.
	line 340
# 
	line 341
# function void process
	line 342
# {
	jump _58
: process
	line 343
# 	string line;
# local line of type string at 0
	pusho ""
	line 344
# 	string opcode;
# local opcode of type string at 1
	pusho ""
	line 345
# 	string argument;
# local argument of type string at 2
	pusho ""
	line 346
# 	int i;
# local i of type int at 3
	pushi 0
	line 347
# 	
	line 348
# 	pass := pass + 1;
	peeki 16
	pushi 1
	add
	pokei 16

	line 349
# 	PrintString(stderr, "Pass ");
	peeki 3
	pusho "Pass "
	sys PrintString

	line 350
# 	PrintInt(stderr, pass);
	peeki 3
	peeki 16
	sys PrintInt

	line 351
# 	PrintNL(stderr);
	peeki 3
	sys PrintNL

	line 352
# 
	line 353
# 	StreamSeek(infile, 0);
	peeki 4
	pushi 0
	sys StreamSeek

	line 354
# 	linenum := 1;
	pushi 1
	pokei 20

	line 355
# 	pc := 0;
	pushi 0
	pokei 21

	line 356
# 	nsyscalls := 0;
	pushi 0
	pokei 23

	line 357
# 		
	line 358
# 	do {
: _59
	line 359
# 		line := StringStrip(StreamReadLine(infile));
	peeki 4
	sys StreamReadLine
	sys StringStrip
	pokeo 0

	line 360
# 		
	line 361
# 		i := StringInstr(line, " ", 0);
	peeko 0
	pusho " "
	pushi 0
	sys StringInstr
	pokei -3

	line 362
# 		if (i == -1)
	line 363
# 		{
	peeki -3
	pushi -1
	sub
	itb
	not
	bne _61
	line 364
# 			opcode := line;
	peeko 0
	pokeo -1

	line 365
# 			argument := "";
	pusho ""
	pokeo -2

	line 366
# 		}
	line 367
# 		else
	line 368
# 		{
	jump _62
: _61
	line 369
# 			opcode := StringMid(line, 0, i);
	peeko 0
	pushi 0
	peeki -3
	sys StringMid
	pokeo -1

	line 370
# 			argument := StringMid(line, i+1, -1);
	peeko 0
	peeki -3
	pushi 1
	add
	pushi -1
	sys StringMid
	pokeo -2

	line 371
# 		}
: _62
	line 372
# 		argument := StringStrip(argument);
	peeko -2
	sys StringStrip
	pokeo -2

	line 373
# 		
	line 374
# 		if (opcode == "")
	line 375
# 			opcode := "#";
	peeko -1
	pusho ""
	strcmp
	itb
	not
	bne _63
	pusho "#"
	pokeo -1

	line 376
# 			
	line 377
# 		if !(op contains opcode)
: _63
: _64
	line 378
# 		{
	peeko 6
	peeko -1
	statd
	not
	bne _65
	line 379
# //			DebugPrintDictArrayInt(op);
	line 380
# 			error("Unknown opcode `" + opcode + "'");
	pushfp
	pusho "Unknown opcode `"
	peeko -1
	pusho "'"
	concat
	concat
	call error

	line 381
# 		}
	line 382
# 		
	line 383
# 		i := op[opcode].amode >> 8;
: _65
: _66
	peeko 6
	peeko -1
	getd
	pushi 1
	geta
	o2i
	pushi 8
	shr
	pokei -3

	line 384
# 
	line 385
# //		PrintInt(stderr, i);
	line 386
# //		PrintString(stderr, ": ");
	line 387
# //		PrintString(stderr, opcode);
	line 388
# //		PrintNL(stderr);
	line 389
# 				
	line 390
# 		if (i == A_COMMENT)
	line 391
# 		{
	peeki -3
	peeki 15
	sub
	itb
	not
	bne _67
	line 392
# 		}
	line 393
# 		else if (i == A_END)
	jump _68
: _67
	line 394
# 			break;
	peeki -3
	peeki 14
	sub
	itb
	not
	bne _69
	jump _60
	line 395
# 		else if (i == A_SIMPLE)
	jump _70
: _69
	line 396
# 			op_simple(opcode);
	peeki -3
	peeki 8
	sub
	itb
	not
	bne _71
	pushfp
	peeko -1
	call op_simple

	line 397
# 		else if (i == A_COMPLEX)
	jump _72
: _71
	line 398
# 			op_complex(opcode, argument);
	peeki -3
	peeki 7
	sub
	itb
	not
	bne _73
	pushfp
	peeko -1
	peeko -2
	call op_complex

	line 399
# 		else if (i == A_SYS)
	jump _74
: _73
	line 400
# 			op_sys(opcode, argument);
	peeki -3
	peeki 10
	sub
	itb
	not
	bne _75
	pushfp
	peeko -1
	peeko -2
	call op_sys

	line 401
# 		else if (i == A_CONSTANT)
	jump _76
: _75
	line 402
# 			op_constant(argument);
	peeki -3
	peeki 13
	sub
	itb
	not
	bne _77
	pushfp
	peeko -2
	call op_constant

	line 403
# 		else if (i == A_PUSHI)
	jump _78
: _77
	line 404
# 			op_pushi(argument);
	peeki -3
	peeki 12
	sub
	itb
	not
	bne _79
	pushfp
	peeko -2
	call op_pushi

	line 405
# 		else if (i == A_OFFSET)
	jump _80
: _79
	line 406
# 			op_offset(opcode, argument);
	peeki -3
	peeki 11
	sub
	itb
	not
	bne _81
	pushfp
	peeko -1
	peeko -2
	call op_offset

	line 407
# 		else if (i == A_PUSHO)
	jump _82
: _81
	line 408
# 			op_pusho(argument);
	peeki -3
	peeki 9
	sub
	itb
	not
	bne _83
	pushfp
	peeko -2
	call op_pusho

	line 409
# 		else
	line 410
# 			error("Unimplemented opcode");
	jump _84
: _83
	pushfp
	pusho "Unimplemented opcode"
	call error

: _84
: _82
: _80
: _78
: _76
: _74
: _72
: _70
: _68
	line 411
# 	} while (1);
	pushi 1
	beq _59
: _60
	line 412
# }
: _return_process
# retract over local var i
	popi
# retract over local var argument
	popo
# retract over local var opcode
	popo
# retract over local var line
	popo
	return
: _58
	line 413
# 
	line 414
# // Simple (no parameter) opcodes
	line 415
# 
	line 416
# function void op_simple
	line 417
# 	string opcode;
# argument opcode of type string at 0
	line 418
# {
	jump _85
: op_simple
	line 419
# 	emit(op[opcode].value);
	pushfp
	peeko 6
	peeko 0
	getd
	pushi 0
	geta
	o2i
	call emit

	line 420
# }
: _return_op_simple
# retract over local var opcode
	popo
	return
: _85
	line 421
# 
	line 422
# // Complex opcodes
	line 423
# 
	line 424
# function void op_complex
	line 425
# 	string opcode;
# argument opcode of type string at 0
	line 426
# 	string argument;
# argument argument of type string at 1
	line 427
# {
	jump _86
: op_complex
	line 428
# 	int l;
# local l of type int at 2
	pushi 0
	line 429
# 	int value := op[opcode].value;
# local value of type int at 3
	peeko 6
	peeko 0
	getd
	pushi 0
	geta
	o2i
	line 430
# 	int amode := op[opcode].amode and 255;
# local amode of type int at 4
	peeko 6
	peeko 0
	getd
	pushi 1
	geta
	o2i
	pushi 255
	and
	line 431
# 
	line 432
# //	PrintString(stderr, opcode);
	line 433
# //	PrintNL(stderr);
	line 434
# 	
	line 435
# 	if (argument == "")
	line 436
# 	{
	peeko -1
	pusho ""
	strcmp
	itb
	not
	bne _87
	line 437
# 		emit(value);
	pushfp
	peeki -3
	call emit

	line 438
# 		return;
	jump _return_op_complex

	line 439
# 	}
	line 440
# 
	line 441
# 	l := getvalue(argument);
: _87
: _88
	pushfp
	peeko -1
	call getvalue
	loadi
	pokei -2

	line 442
# 	
	line 443
# //	if ((l > -128) and (l < 127))
	line 444
# //	{
	line 445
# //		if (amode and 2)
	line 446
# //		{
	line 447
# //			emit(value+1);
	line 448
# //			emit(l);
	line 449
# //		}
	line 450
# //		else
	line 451
# //			error("`" + opcode + "' can't do byte-constant");
	line 452
# //		return;
	line 453
# //	}
	line 454
# //	else if ((l > -32768) and (l < 32767))
	line 455
# //	{
	line 456
# //		if (amode and 4)
	line 457
# //		{
	line 458
# //			emit(value+2);
	line 459
# //			emit_short(l);
	line 460
# //		}
	line 461
# //		else
	line 462
# //			error("`" + opcode + "' can't do short-constant");
	line 463
# //		return;
	line 464
# //	}
	line 465
# //	else
	line 466
# //	{
	line 467
# //		if (amode and 8)
	line 468
# //		{
	line 469
# 			emit(value+3);
	pushfp
	peeki -3
	pushi 3
	add
	call emit

	line 470
# 			emit_long(l);
	pushfp
	peeki -2
	call emit_long

	line 471
# //		}
	line 472
# //		else
	line 473
# //			error("`" + opcode + "' can't do long-constant");
	line 474
# //		return;
	line 475
# //	}
	line 476
# //	error("Internal error in A_COMPLEX instruction!");
	line 477
# }
: _return_op_complex
# retract over local var amode
	popi
# retract over local var value
	popi
# retract over local var l
	popi
# retract over local var argument
	popo
# retract over local var opcode
	popo
	return
: _86
	line 478
# 
	line 479
# // System call
	line 480
# 
	line 481
# function void op_sys
	line 482
# 	string opcode;
# argument opcode of type string at 0
	line 483
# 	string argument;
# argument argument of type string at 1
	line 484
# {
	jump _89
: op_sys
	line 485
# 	int value := op[opcode].value;
# local value of type int at 2
	peeko 6
	peeko 0
	getd
	pushi 0
	geta
	o2i
	line 486
# 	int amode := op[opcode].amode and 255;
# local amode of type int at 3
	peeko 6
	peeko 0
	getd
	pushi 1
	geta
	o2i
	pushi 255
	and
	line 487
# 	int l;
# local l of type int at 4
	pushi 0
	line 488
# 	
	line 489
# 	if (argument == "")
	line 490
# 	{
	peeko -1
	pusho ""
	strcmp
	itb
	not
	bne _90
	line 491
# 		emit(value);
	pushfp
	peeki -2
	call emit

	line 492
# 		return;
	jump _return_op_sys

	line 493
# 	}
	line 494
# 
	line 495
# 	if (pass == 1)
: _90
: _91
	line 496
# 	{
	peeki 16
	pushi 1
	sub
	itb
	not
	bne _92
	line 497
# //		PrintString(stderr, "Adding "+argument+" (");
	line 498
# //		PrintInt(stderr, nsyscalls);
	line 499
# //		PrintString(stderr, ")");
	line 500
# //		PrintNL(stderr);
	line 501
# 		if !(syscalls contains argument)
	line 502
# 		{
	peeko 22
	peeko -1
	statd
	not
	bne _94
	line 503
# 			syscalls[argument] := nsyscalls;
	peeki 23
	peeko 22
	peeko -1
	setd

	line 504
# 			nsyscalls := nsyscalls + 1;
	peeki 23
	pushi 1
	add
	pokei 23

	line 505
# 		}
	line 506
# 	}
: _94
: _95
	line 507
# 	
	line 508
# //	PrintString(stderr, "Looking for "+argument);
	line 509
# //	PrintNL(stderr);
	line 510
# //	DebugPrintDictInt(syscalls);
	line 511
# 	l := syscalls[argument];
: _92
: _93
	peeko 22
	peeko -1
	getd
	pokei -4

	line 512
# 	op_complex(opcode, IntToString(l));
	pushfp
	peeko 0
	peeki -4
	pushi 10
sys IntToStringRadix
	call op_complex

	line 513
# 	
	line 514
# //	if ((l > -128) and (l < 127))
	line 515
# //	{
	line 516
# //		if (amode and 2)
	line 517
# //		{
	line 518
# //			emit(value+1);
	line 519
# //			emit(l);
	line 520
# //		}
	line 521
# //		else
	line 522
# //			error("`" + opcode + "' can't do byte-constant");
	line 523
# //		return;
	line 524
# //	}
	line 525
# //	else
	line 526
# //	{
	line 527
# //		if (amode and 4)
	line 528
# //		{
	line 529
# //			emit(value+2);
	line 530
# //			emit_short(l);
	line 531
# //		}
	line 532
# //		else
	line 533
# //			error("`" + opcode + "' can't do short-constant");
	line 534
# //		return;
	line 535
# //	}
	line 536
# //	error("Internal error in A_SYS instruction!");
	line 537
# }
: _return_op_sys
# retract over local var l
	popi
# retract over local var amode
	popi
# retract over local var value
	popi
# retract over local var argument
	popo
# retract over local var opcode
	popo
	return
: _89
	line 538
# 
	line 539
# // Defined constant
	line 540
# 
	line 541
# function void op_constant
	line 542
# 	string argument;
# argument argument of type string at 0
	line 543
# {
	jump _96
: op_constant
	line 544
# 	string name;
# local name of type string at 1
	pusho ""
	line 545
# 	int value;
# local value of type int at 2
	pushi 0
	line 546
# 	int i;
# local i of type int at 3
	pushi 0
	line 547
# 	
	line 548
# 	i := StringInstr(argument, " ", 0);
	peeko 0
	pusho " "
	pushi 0
	sys StringInstr
	pokei -3

	line 549
# 	if (i == -1)
	line 550
# 	{
	peeki -3
	pushi -1
	sub
	itb
	not
	bne _97
	line 551
# 		name := argument;
	peeko 0
	pokeo -1

	line 552
# 		value := pc;
	peeki 21
	pokei -2

	line 553
# 	}
	line 554
# 	else
	line 555
# 	{
	jump _98
: _97
	line 556
# 		name := StringMid(argument, 0, i);
	peeko 0
	pushi 0
	peeki -3
	sys StringMid
	pokeo -1

	line 557
# 		value := getvalue(StringMid(argument, i+1, -1));
	pushfp
	peeko 0
	peeki -3
	pushi 1
	add
	pushi -1
	sys StringMid
	call getvalue
	loadi
	pokei -2

	line 558
# 	}
: _98
	line 559
# 	
	line 560
# 	if (constants contains name)
	line 561
# 		if (constants[name] != value)
	peeko 24
	peeko -1
	statd
	bne _99
	line 562
# 		{
	peeko 24
	peeko -1
	getd
	peeki -2
	sub
	itb
	bne _101
	line 563
# 			changeflag := 1;
	pushi 1
	pokei 19

	line 564
# //			PrintString(stderr, "CHANGED ");
	line 565
# 		}
	line 566
# 
	line 567
# //	PrintString(stderr, "Constant ");
	line 568
# //	PrintString(stderr, name);
	line 569
# //	PrintString(stderr, " = ");
	line 570
# //	PrintInt(stderr, value);
	line 571
# //	PrintNL(stderr);
	line 572
# 
	line 573
# 	constants[name] := value;
: _101
: _102
: _99
: _100
	peeki -2
	peeko 24
	peeko -1
	setd

	line 574
# }
: _return_op_constant
# retract over local var i
	popi
# retract over local var value
	popi
# retract over local var name
	popo
# retract over local var argument
	popo
	return
: _96
	line 575
# 
	line 576
# // Push int
	line 577
# 
	line 578
# function void op_pushi
	line 579
# 	string argument;
# argument argument of type string at 0
	line 580
# {
	jump _103
: op_pushi
	line 581
# 	if (argument == "1")
	line 582
# 	{
	peeko 0
	pusho "1"
	strcmp
	itb
	not
	bne _104
	line 583
# 		op_simple("pushi1");
	pushfp
	pusho "pushi1"
	call op_simple

	line 584
# 		return;
	jump _return_op_pushi

	line 585
# 	}
	line 586
# 	else if (argument == "-1")
	jump _105
: _104
	line 587
# 	{
	peeko 0
	pusho "-1"
	strcmp
	itb
	not
	bne _106
	line 588
# 		op_simple("pushi-1");
	pushfp
	pusho "pushi-1"
	call op_simple

	line 589
# 		return;
	jump _return_op_pushi

	line 590
# 	}
	line 591
# 	else if (argument == "0")
	jump _107
: _106
	line 592
# 	{
	peeko 0
	pusho "0"
	strcmp
	itb
	not
	bne _108
	line 593
# 		emit(op["pushi"].value);
	pushfp
	peeko 6
	pusho "pushi"
	getd
	pushi 0
	geta
	o2i
	call emit

	line 594
# 		return;
	jump _return_op_pushi

	line 595
# 	}
	line 596
# 	op_complex("pushi", argument);
: _108
: _109
: _107
: _105
	pushfp
	pusho "pushi"
	peeko 0
	call op_complex

	line 597
# }
: _return_op_pushi
# retract over local var argument
	popo
	return
: _103
	line 598
# 
	line 599
# // Push an offset to a label
	line 600
# 
	line 601
# function void op_offset
	line 602
# 	string opcode;
# argument opcode of type string at 0
	line 603
# 	string argument;
# argument argument of type string at 1
	line 604
# {
	jump _110
: op_offset
	line 605
# 	string dest := IntToString(getvalue(argument) - pc);
# local dest of type string at 2
	pushfp
	peeko -1
	call getvalue
	loadi
	peeki 21
	sub
	pushi 10
sys IntToStringRadix
	line 606
# //	PrintString(stderr, "Offset from ");
	line 607
# //	PrintInt(stderr, pc);
	line 608
# //	PrintString(stderr, " to ");
	line 609
# //	PrintString(stderr, argument);
	line 610
# //	PrintString(stderr, " = ");
	line 611
# //	PrintString(stderr, dest);
	line 612
# //	PrintNL(stderr);
	line 613
# 	op_complex(opcode, dest);
	pushfp
	peeko 0
	peeko -2
	call op_complex

	line 614
# }
: _return_op_offset
# retract over local var dest
	popo
# retract over local var argument
	popo
# retract over local var opcode
	popo
	return
: _110
	line 615
# 
	line 616
# // Push a string
	line 617
# 
	line 618
# function void op_pusho
	line 619
# 	string argument;
# argument argument of type string at 0
	line 620
# {
	jump _111
: op_pusho
	line 621
# 	int size := 0;
# local size of type int at 1
	pushi 0
	line 622
# 	if (argument == "\"\"")
	line 623
# 		argument := "";
	peeko 0
	pusho "\"\""
	strcmp
	itb
	not
	bne _112
	pusho ""
	pokeo 0

	line 624
# 	else if (argument == "nil")
	jump _113
: _112
	line 625
# 	{
	peeko 0
	pusho "nil"
	strcmp
	itb
	not
	bne _114
	line 626
# 		op_simple("push_nil");
	pushfp
	pusho "push_nil"
	call op_simple

	line 627
# 		return;
	jump _return_op_pusho

	line 628
# 	}
	line 629
# 	else if (argument == "array byte")
	jump _115
: _114
	line 630
# 	{
	peeko 0
	pusho "array byte"
	strcmp
	itb
	not
	bne _116
	line 631
# 		op_simple("push_abyte");
	pushfp
	pusho "push_abyte"
	call op_simple

	line 632
# 		return;
	jump _return_op_pusho

	line 633
# 	}
	line 634
# 	else if (argument == "array int")
	jump _117
: _116
	line 635
# 	{
	peeko 0
	pusho "array int"
	strcmp
	itb
	not
	bne _118
	line 636
# 		op_simple("push_aint");
	pushfp
	pusho "push_aint"
	call op_simple

	line 637
# 		return;
	jump _return_op_pusho

	line 638
# 	}
	line 639
# 	else if (argument == "array object")
	jump _119
: _118
	line 640
# 	{
	peeko 0
	pusho "array object"
	strcmp
	itb
	not
	bne _120
	line 641
# 		op_simple("push_aobj");
	pushfp
	pusho "push_aobj"
	call op_simple

	line 642
# 		return;
	jump _return_op_pusho

	line 643
# 	}
	line 644
# 	else if (argument == "dict byte")
	jump _121
: _120
	line 645
# 	{
	peeko 0
	pusho "dict byte"
	strcmp
	itb
	not
	bne _122
	line 646
# 		op_simple("push_dbyte");
	pushfp
	pusho "push_dbyte"
	call op_simple

	line 647
# 		return;
	jump _return_op_pusho

	line 648
# 	}
	line 649
# 	else if (argument == "dict int")
	jump _123
: _122
	line 650
# 	{
	peeko 0
	pusho "dict int"
	strcmp
	itb
	not
	bne _124
	line 651
# 		op_simple("push_dint");
	pushfp
	pusho "push_dint"
	call op_simple

	line 652
# 		return;
	jump _return_op_pusho

	line 653
# 	}
	line 654
# 	else if (argument == "dict object")
	jump _125
: _124
	line 655
# 	{
	peeko 0
	pusho "dict object"
	strcmp
	itb
	not
	bne _126
	line 656
# 		op_simple("push_dobj");
	pushfp
	pusho "push_dobj"
	call op_simple

	line 657
# 		return;
	jump _return_op_pusho

	line 658
# 	}
	line 659
# 	else
	line 660
# 	{
	jump _127
: _126
	line 661
# 		argument := escape(StringMid(argument, 1, sizeof(argument)-2));
	pushfp
	peeko 0
	pushi 1
	peeko 0
	size
	pushi 2
	sub
	sys StringMid
	call escape
	loado
	pokeo 0

	line 662
# 		size := sizeof(argument);
	peeko 0
	size
	pokei -1

	line 663
# 	}
: _127
: _125
: _123
: _121
: _119
: _117
: _115
: _113
	line 664
# 			
	line 665
# 	if (size == 0)
	line 666
# 		op_simple("pusho");
	peeki -1
	pushi 0
	sub
	itb
	not
	bne _128
	pushfp
	pusho "pusho"
	call op_simple

	line 667
# 	else if (size < 256)
	jump _129
: _128
	line 668
# 	{
	peeki -1
	pushi 256
	sub
	blt _132
	pushi 1
	jump _133
: _132
	pushi 0
: _133
	bne _130
	line 669
# 		emit(op["pusho"].value + 1);
	pushfp
	peeko 6
	pusho "pusho"
	getd
	pushi 0
	geta
	o2i
	pushi 1
	add
	call emit

	line 670
# 		emit(size);
	pushfp
	peeki -1
	call emit

	line 671
# 		emit_string(argument);
	pushfp
	peeko 0
	call emit_string

	line 672
# 	} else {
	jump _131
: _130
	line 673
# 		emit(op["pusho"].value + 2);
	pushfp
	peeko 6
	pusho "pusho"
	getd
	pushi 0
	geta
	o2i
	pushi 2
	add
	call emit

	line 674
# 		emit_short(size);
	pushfp
	peeki -1
	call emit_short

	line 675
# 		emit_string(argument);
	pushfp
	peeko 0
	call emit_string

	line 676
# 	}
: _131
: _129
	line 677
# }
: _return_op_pusho
# retract over local var size
	popi
# retract over local var argument
	popo
	return
: _111
	line 678
# 
	line 679
# // ===========================================================================
	line 680
# //                               MAIN PROGRAM
	line 681
# // ===========================================================================
	line 682
# 
	line 683
# // This is a function only for the C-translated version. The real version
	line 684
# // will have this as root-level code.
	line 685
# 
	line 686
# function void main
	line 687
# {
	jump _134
: main
	line 688
# 	LoadOps();
	pushfp
	call LoadOps

	line 689
# 	ProcessCommandLine();
	pushfp
	call ProcessCommandLine

	line 690
# 
	line 691
# 	errors := 0;
	pushi 0
	pokei 17

	line 692
# 	codegen := 0;
	pushi 0
	pokei 18

	line 693
# 	changeflag := 0;
	pushi 0
	pokei 19

	line 694
# 	process();
	pushfp
	call process

	line 695
# 	
	line 696
# 	do {
: _135
	line 697
# 		errors := 1;
	pushi 1
	pokei 17

	line 698
# 		codegen := 0;
	pushi 0
	pokei 18

	line 699
# 		changeflag := 0;
	pushi 0
	pokei 19

	line 700
# 		process();
	pushfp
	call process

	line 701
# 	} while (changeflag == 1);
	peeki 19
	pushi 1
	sub
	itb
	not
	beq _135
: _136
	line 702
# 	
	line 703
# 	errors := 1;
	pushi 1
	pokei 17

	line 704
# 	codegen := 1;
	pushi 1
	pokei 18

	line 705
# 	changeflag := 0;
	pushi 0
	pokei 19

	line 706
# 	EmitHeader(pc);
	pushfp
	peeki 21
	call EmitHeader

	line 707
# 	process();
	pushfp
	call process

	line 708
# 	StreamClose(outfile);
	peeki 5
	sys StreamClose

	line 709
# }
: _return_main
	return
: _134
	line 710
# 
	line 711
# end;
	pushfp
	call main
	halt
	end

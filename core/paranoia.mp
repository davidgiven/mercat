	line 1
# // Paranoia
	line 2
# // A conversion of the standard BSD game `Paranoia'.
	line 3
# // Original comments follow:
	line 4
# //
	line 5
# // ---snip---
	line 6
# // This is a solo paranoia game taken from the Jan/Feb issue (No 77) of
	line 7
# // "SpaceGamer/FantasyGamer" magazine.
	line 8
# //
	line 9
# // Article by Sam Shirley.
	line 10
# //
	line 11
# // Implemented in C on Vax 11/780 under UNIX by Tim Lister
	line 12
# //
	line 13
# // This is a public domain adventure and may not be sold for profit
	line 14
# // ---snip---
	line 15
# 
	line 16
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
	line 17
# 
	line 18
# // --- Globals --------------------------------------------------------------
	line 19
# 
	line 20
# global int MOXIE := 13;
# global MOXIE of type int at 4
	pushi 13
	line 21
# global int AGILITY := 15;
# global AGILITY of type int at 5
	pushi 15
	line 22
# global int MAXKILL := 7;	// The maximum number of UV's you can kill
# global MAXKILL of type int at 6
	pushi 7
	line 23
# 
	line 24
# global int clone := 1;
# global clone of type int at 7
	pushi 1
	line 25
# global int page := 1;
# global page of type int at 8
	pushi 1
	line 26
# global int computer_request := 0;
# global computer_request of type int at 9
	pushi 0
	line 27
# global int ultra_violet := 0;
# global ultra_violet of type int at 10
	pushi 0
	line 28
# global int action_doll := 0;
# global action_doll of type int at 11
	pushi 0
	line 29
# global int hit_points := 10;
# global hit_points of type int at 12
	pushi 10
	line 30
# global int read_letter := 0;
# global read_letter of type int at 13
	pushi 0
	line 31
# global int plato_clone := 3;
# global plato_clone of type int at 14
	pushi 3
	line 32
# global int blast_door := 0;
# global blast_door of type int at 15
	pushi 0
	line 33
# global int killer_count := 0;
# global killer_count of type int at 16
	pushi 0
	line 34
# 
	line 35
# // --- Utility functions ----------------------------------------------------
	line 36
# 
	line 37
# function void print
	line 38
# 	string s;
# argument s of type string at 0
	line 39
# {
	jump _5
: print
	line 40
# 	PrintString(stdout, s);
	peeki 2
	peeko 0
	sys PrintString

	line 41
# }
: _return_print
# retract over local var s
	popo
	return
: _5
	line 42
# 
	line 43
# function void prints
	line 44
# 	int i;
# argument i of type int at 0
	line 45
# {
	jump _6
: prints
	line 46
# 	PrintInt(stdout, i);
	peeki 2
	peeki 0
	sys PrintInt

	line 47
# }
: _return_prints
# retract over local var i
	popi
	return
: _6
	line 48
# 
	line 49
# function string get_char
	line 50
# {
	jump _7
: get_char
	line 51
# 	string c;
# local c of type string at 0
	pusho ""
	line 52
# 	
	line 53
# 	StreamFlush(stdout);
	peeki 2
	sys StreamFlush

	line 54
# 	c := StreamReadChar(stdin);
	peeki 1
	sys StreamReadChar
	pokeo 0

	line 55
# 	if (c != "\n")
	line 56
# 		while (StreamReadChar(stdin) != "\n")
	peeko 0
	pusho "\n"
	strcmp
	itb
	bne _8
: _10
	line 57
# 		{
	peeki 1
	sys StreamReadChar
	pusho "\n"
	strcmp
	itb
	bne _11
	line 58
# 		}
	jump _10
: _11
	line 59
# 		
	line 60
# 	return c;
: _8
: _9
	peeko 0
	saveo
	jump _return_get_char

	line 61
# }
	pushi 0
	savei
: _return_get_char
# retract over local var c
	popo
	return
: _7
	line 62
# 
	line 63
# function void wait_char
	line 64
# {
	jump _12
: wait_char
	line 65
# 	string c := get_char();
# local c of type string at 0
	pushfp
	call get_char
	loado
	line 66
# }
: _return_wait_char
# retract over local var c
	popo
	return
: _12
	line 67
# 
	line 68
# function void more
	line 69
# {
	jump _13
: more
	line 70
# 	print("---------- More ----------");
	pushfp
	pusho "---------- More ----------"
	call print

	line 71
# //	print(" (page ");
	line 72
# //	prints(page);
	line 73
# //	print(")");
	line 74
# 	
	line 75
# 	if (get_char() == "p")
	line 76
# 	{
	pushfp
	call get_char
	loado
	pusho "p"
	strcmp
	itb
	not
	bne _14
	line 77
# 		character();
	pushfp
	call character

	line 78
# 		print("---------- More ----------");
	pushfp
	pusho "---------- More ----------"
	call print

	line 79
# 		wait_char();
	pushfp
	call wait_char

	line 80
# 	}
	line 81
# }
: _14
: _15
: _return_more
	return
: _13
	line 82
# 
	line 83
# function int new_clone
	line 84
# 	int resume;
# argument resume of type int at 0
	line 85
# {
	jump _16
: new_clone
	line 86
# 	print("\nClone ");
	pushfp
	pusho "\nClone "
	call print

	line 87
# 	prints(clone);
	pushfp
	peeki 7
	call prints

	line 88
# 	print(" just died.\n");
	pushfp
	pusho " just died.\n"
	call print

	line 89
# 	
	line 90
# 	clone := clone + 1;
	peeki 7
	pushi 1
	add
	pokei 7

	line 91
# 	if (clone>6)
	line 92
# 	{
	peeki 7
	pushi 6
	sub
	bgt _19
	pushi 1
	jump _20
: _19
	pushi 0
: _20
	bne _17
	line 93
# 		print("\n*** You Lose ***\n\nAll your clones are dead.  Your name has been stricken from the records.\n\n			THE END\n");
	pushfp
	pusho "\n*** You Lose ***\n\nAll your clones are dead.  Your name has been stricken from the records.\n\n			THE END\n"
	call print

	line 94
# 		return 0;
	pushi 0
	savei
	jump _return_new_clone

	line 95
# 	}
	line 96
# 	else
	line 97
# 	{
	jump _18
: _17
	line 98
# 		print("Clone ");
	pushfp
	pusho "Clone "
	call print

	line 99
# 		prints(clone);
	pushfp
	peeki 7
	call prints

	line 100
# 		print(" now activated.\n");
	pushfp
	pusho " now activated.\n"
	call print

	line 101
# 		ultra_violet := 0;
	pushi 0
	pokei 10

	line 102
# 		action_doll := 0;
	pushi 0
	pokei 11

	line 103
# 		hit_points := 10;
	pushi 10
	pokei 12

	line 104
# 		killer_count := 0;
	pushi 0
	pokei 16

	line 105
# 		return resume;
	peeki 0
	savei
	jump _return_new_clone

	line 106
# 	}
: _18
	line 107
# }
	pushi 0
	savei
: _return_new_clone
# retract over local var resume
	popi
	return
: _16
	line 108
# 
	line 109
# function int dice_roll
	line 110
# 	int number;
# argument number of type int at 0
	line 111
# 	int faces;
# argument faces of type int at 1
	line 112
# {
	jump _21
: dice_roll
	line 113
# 	int i;
# local i of type int at 2
	pushi 0
	line 114
# 	int total := 0;
# local total of type int at 3
	pushi 0
	line 115
# 	
	line 116
# 	for (i := number; i>0; i := i-1)
	peeki 0
	pokei -2
: _22
	peeki -2
	pushi 0
	sub
	bgt _24
	pushi 1
	jump _25
: _24
	pushi 0
: _25
	bne _23
	line 117
# 		total := total + RandomNumber(faces);
	peeki -3
	peeki -1
	sys RandomNumber
	add
	pokei -3

	peeki -2
	pushi 1
	sub
	pokei -2

	jump _22
: _23
	line 118
# 	return total;
	peeki -3
	savei
	jump _return_dice_roll

	line 119
# }
	pushi 0
	savei
: _return_dice_roll
# retract over local var total
	popi
# retract over local var i
	popi
# retract over local var faces
	popi
# retract over local var number
	popi
	return
: _21
	line 120
# 
	line 121
# // --- Main game ------------------------------------------------------------
	line 122
# 
	line 123
# function void instructions
	line 124
# {
	jump _26
: instructions
	line 125
# 	print(
	pushfp
	line 126
# "\n\n\n\nWelcome to Paranoia!\n\n
	line 127
# HOW TO PLAY:\n\n
	line 128
#   Just press <RETURN> until you are asked to make a choice.\n
	line 129
#   Select 'a' or 'b' or whatever for your choice, then press <RETURN>.\n
	line 130
#   You may select 'p' at any time to get a display of your statistics.\n
	line 131
#   Always choose the least dangerous option.  Continue doing this until you win.\n
	line 132
#   At times you will use a skill or engage in combat and and will be informed of\n
	line 133
#   the outcome.  These sections will be self explanatory.\n\n
	line 134
# HOW TO DIE:\n\n
	line 135
#   As Philo-R-DMD you will die at times during the adventure.\n
	line 136
#   When this happens you will be given an new clone at a particular location.\n
	line 137
#   The new Philo-R will usually have to retrace some of the old Philo-R\'s path;\n
	line 138
#   hopefully he won\'t make the same mistake as his predecessor.\n\n
	line 139
# HOW TO WIN:\n\n
	line 140
#   Simply complete the mission before you expend all six clones.\n
	line 141
#   If you make it, congratulations.\n
	line 142
#   If not, you can try again later.\n");
	pusho "\n\n\n\nWelcome to Paranoia!\n\nHOW TO PLAY:\n\n  Just press <RETURN> until you are asked to make a choice.\n  Select 'a' or 'b' or whatever for your choice, then press <RETURN>.\n  You may select 'p' at any time to get a display of your statistics.\n  Always choose the least dangerous option.  Continue doing this until you win.\n  At times you will use a skill or engage in combat and and will be informed of\n  the outcome.  These sections will be self explanatory.\n\nHOW TO DIE:\n\n  As Philo-R-DMD you will die at times during the adventure.\n  When this happens you will be given an new clone at a particular location.\n  The new Philo-R will usually have to retrace some of the old Philo-R\'s path;\n  hopefully he won\'t make the same mistake as his predecessor.\n\nHOW TO WIN:\n\n  Simply complete the mission before you expend all six clones.\n  If you make it, congratulations.\n  If not, you can try again later.\n"
	call print

	line 143
# }
: _return_instructions
	return
: _26
	line 144
# 
	line 145
# function void character
	line 146
# {
	jump _27
: character
	line 147
# 	print(
	pushfp
	line 148
# "===============================================================================\n
	line 149
# The Character : Philo-R-DMD ");
	pusho "===============================================================================\nThe Character : Philo-R-DMD "
	call print

	line 150
# 	prints(clone);
	pushfp
	peeki 7
	call prints

	line 151
# 	print("\n
	pushfp
	line 152
# Primary Attributes                      Secondary Attributes\n
	line 153
# ===============================================================================\n
	line 154
# Strength ..................... 13       Carrying Capacity ................. 30\n
	line 155
# Endurance .................... 13       Damage Bonus ....................... 0\n
	line 156
# Agility ...................... 15       Macho Bonus ....................... -1\n
	line 157
# Manual Dexterity ............. 15       Melee Bonus ...................... +5%\n
	line 158
# Moxie ........................ 13       Aimed Weapon Bonus .............. +10%\n
	line 159
# Chutzpah ...................... 8       Comprehension Bonus .............. +4%\n
	line 160
# Mechanical Aptitude .......... 14       Believability Bonus .............. +5%\n
	line 161
# Power Index .................. 10       Repair Bonus ..................... +5%\n
	line 162
# ===============================================================================\n
	line 163
# Credits: 160        Secret Society: Illuminati        Secret Society Rank: 1\n
	line 164
# Service Group: Power Services               Mutant Power: Precognition\n
	line 165
# Weapon: laser pistol; to hit, 40%; type, L; Range, 50m; Reload, 6r; Malfnt, 00\n
	line 166
# Skills: Basics 1(20%), Aimed Weapon Combat 2(35%), Laser 3(40%),\n
	line 167
# Personal Development 1(20%), Communications 2(29%), Intimidation 3(34%)\n
	line 168
# Equipment: Red Reflec Armour, Laser Pistol, Laser Barrel (red),\n
	line 169
#            Notebook & Stylus, Knife, Com Unit 1, Jump suit,\n
	line 170
#            Secret Illuminati Eye-In-The-Pyramid(tm) Decoder ring,\n
	line 171
#            Utility Belt & Pouches\n
	line 172
# ===============================================================================\n");
	pusho "\nPrimary Attributes                      Secondary Attributes\n===============================================================================\nStrength ..................... 13       Carrying Capacity ................. 30\nEndurance .................... 13       Damage Bonus ....................... 0\nAgility ...................... 15       Macho Bonus ....................... -1\nManual Dexterity ............. 15       Melee Bonus ...................... +5%\nMoxie ........................ 13       Aimed Weapon Bonus .............. +10%\nChutzpah ...................... 8       Comprehension Bonus .............. +4%\nMechanical Aptitude .......... 14       Believability Bonus .............. +5%\nPower Index .................. 10       Repair Bonus ..................... +5%\n===============================================================================\nCredits: 160        Secret Society: Illuminati        Secret Society Rank: 1\nService Group: Power Services               Mutant Power: Precognition\nWeapon: laser pistol; to hit, 40%; type, L; Range, 50m; Reload, 6r; Malfnt, 00\nSkills: Basics 1(20%), Aimed Weapon Combat 2(35%), Laser 3(40%),\nPersonal Development 1(20%), Communications 2(29%), Intimidation 3(34%)\nEquipment: Red Reflec Armour, Laser Pistol, Laser Barrel (red),\n           Notebook & Stylus, Knife, Com Unit 1, Jump suit,\n           Secret Illuminati Eye-In-The-Pyramid(tm) Decoder ring,\n           Utility Belt & Pouches\n===============================================================================\n"
	call print

	line 173
# }
: _return_character
	return
: _27
	line 174
# 
	line 175
# function int choose
	line 176
# 	int a;
# argument a of type int at 0
	line 177
# 	string as;
# argument as of type string at 1
	line 178
# 	int b;
# argument b of type int at 2
	line 179
# 	string bs;
# argument bs of type string at 3
	line 180
# {
	jump _28
: choose
	line 181
# 	print("\nSelect \'a\' or \'b\' :\n");
	pushfp
	pusho "\nSelect \'a\' or \'b\' :\n"
	call print

	line 182
# 	print(" a - ");
	pushfp
	pusho " a - "
	call print

	line 183
# 	print(as);
	pushfp
	peeko -1
	call print

	line 184
# 	print(".\n b - ");
	pushfp
	pusho ".\n b - "
	call print

	line 185
# 	print(bs);
	pushfp
	peeko -3
	call print

	line 186
# 	print(".\n");
	pushfp
	pusho ".\n"
	call print

	line 187
# 	if (get_char() == "a")	return a;
	pushfp
	call get_char
	loado
	pusho "a"
	strcmp
	itb
	not
	bne _29
	peeki 0
	savei
	jump _return_choose

	line 188
# 	else	 		return b;
	jump _30
: _29
	peeki -2
	savei
	jump _return_choose

: _30
	line 189
# }
	pushi 0
	savei
: _return_choose
# retract over local var bs
	popo
# retract over local var b
	popi
# retract over local var as
	popo
# retract over local var a
	popi
	return
: _28
	line 190
# 
	line 191
# function int page1
	line 192
# {
	jump _31
: page1
	line 193
# 	print("  You wake up face down on the red and pink checked E-Z-Kleen linoleum floor.\n");
	pushfp
	pusho "  You wake up face down on the red and pink checked E-Z-Kleen linoleum floor.\n"
	call print

	line 194
# 	print("  You recognise the pattern, it\'s the type preferred in the internal security\nbriefing cells.  When you finally look around you, you see that you are alone\n");
	pushfp
	pusho "  You recognise the pattern, it\'s the type preferred in the internal security\nbriefing cells.  When you finally look around you, you see that you are alone\n"
	call print

	line 195
# 	print("in a large mission briefing room.\n");
	pushfp
	pusho "in a large mission briefing room.\n"
	call print

	line 196
# 	more();
	pushfp
	call more

	line 197
# 	return 57;
	pushi 57
	savei
	jump _return_page1

	line 198
# }
	pushi 0
	savei
: _return_page1
	return
: _31
	line 199
# 
	line 200
# function int page2
	line 201
# {
	jump _32
: page2
	line 202
# 	print("\"Greetings,\" says the kindly Internal Security self incrimination expert who\n");
	pushfp
	pusho "\"Greetings,\" says the kindly Internal Security self incrimination expert who\n"
	call print

	line 203
# 	print("meets you at the door, \"How are we doing today?\"  He offers you a doughnut\n");
	pushfp
	pusho "meets you at the door, \"How are we doing today?\"  He offers you a doughnut\n"
	call print

	line 204
# 	print("and coffee and asks what brings you here.  This doesn\'t seem so bad, so you\n");
	pushfp
	pusho "and coffee and asks what brings you here.  This doesn\'t seem so bad, so you\n"
	call print

	line 205
# 	print("tell him that you have come to confess some possible security lapses.  He\n");
	pushfp
	pusho "tell him that you have come to confess some possible security lapses.  He\n"
	call print

	line 206
# 	print("smiles knowingly, deftly catching your coffee as you slump to the floor.\n");
	pushfp
	pusho "smiles knowingly, deftly catching your coffee as you slump to the floor.\n"
	call print

	line 207
# 	print("\"Nothing to be alarmed about; it\'s just the truth serum,\" he says,\n");
	pushfp
	pusho "\"Nothing to be alarmed about; it\'s just the truth serum,\" he says,\n"
	call print

	line 208
# 	print("dragging you back into a discussion room.\n");
	pushfp
	pusho "dragging you back into a discussion room.\n"
	call print

	line 209
# 	print("The next five hours are a dim haze, but you can recall snatches of conversation\n");
	pushfp
	pusho "The next five hours are a dim haze, but you can recall snatches of conversation\n"
	call print

	line 210
# 	print("about your secret society, your mutant power, and your somewhat paranoid\n");
	pushfp
	pusho "about your secret society, your mutant power, and your somewhat paranoid\n"
	call print

	line 211
# 	print("distrust of The Computer.  This should explain why you are hogtied and moving\n");
	pushfp
	pusho "distrust of The Computer.  This should explain why you are hogtied and moving\n"
	call print

	line 212
# 	print("slowly down the conveyer belt towards the meat processing unit in Food\n");
	pushfp
	pusho "slowly down the conveyer belt towards the meat processing unit in Food\n"
	call print

	line 213
# 	print("Services.\n");
	pushfp
	pusho "Services.\n"
	call print

	line 214
# 	if (computer_request==1) return new_clone(45);
	peeki 9
	pushi 1
	sub
	itb
	not
	bne _33
	pushfp
	pushi 45
	call new_clone
	loadi
	savei
	jump _return_page2

	line 215
# 	else 			 return new_clone(32);
	jump _34
: _33
	pushfp
	pushi 32
	call new_clone
	loadi
	savei
	jump _return_page2

: _34
	line 216
# }
	pushi 0
	savei
: _return_page2
	return
: _32
	line 217
# 
	line 218
# function int page3
	line 219
# {
	jump _35
: page3
	line 220
# 	print("You walk to the nearest Computer terminal and request more information about\n");
	pushfp
	pusho "You walk to the nearest Computer terminal and request more information about\n"
	call print

	line 221
# 	print("Christmas.  The Computer says, \"That is an A-1 ULTRAVIOLET ONLY IMMEDIATE\n");
	pushfp
	pusho "Christmas.  The Computer says, \"That is an A-1 ULTRAVIOLET ONLY IMMEDIATE\n"
	call print

	line 222
# 	print("TERMINATION classified topic.  What is your clearance please, Troubleshooter?\"\n");
	pushfp
	pusho "TERMINATION classified topic.  What is your clearance please, Troubleshooter?\"\n"
	call print

	line 223
# 	return choose(4,"You give your correct clearance",5,"You lie and claim Ultraviolet clearance");
	pushfp
	pushi 4
	pusho "You give your correct clearance"
	pushi 5
	pusho "You lie and claim Ultraviolet clearance"
	call choose
	loadi
	savei
	jump _return_page3

	line 224
# }
	pushi 0
	savei
: _return_page3
	return
: _35
	line 225
# 
	line 226
# function int page4
	line 227
# {
	jump _36
: page4
	line 228
# 	print("\"That is classified information, Troubleshooter, thank you for your inquiry.\n");
	pushfp
	pusho "\"That is classified information, Troubleshooter, thank you for your inquiry.\n"
	call print

	line 229
# 	print(" Please report to an Internal Security self incrimination station as soon as\n");
	pushfp
	pusho " Please report to an Internal Security self incrimination station as soon as\n"
	call print

	line 230
# 	print(" possible.\"\n");
	pushfp
	pusho " possible.\"\n"
	call print

	line 231
# 	more();
	pushfp
	call more

	line 232
# 	return 9;
	pushi 9
	savei
	jump _return_page4

	line 233
# }
	pushi 0
	savei
: _return_page4
	return
: _36
	line 234
# 
	line 235
# function int page5
	line 236
# {
	jump _37
: page5
	line 237
# 	print("The computer says, \"Troubleshooter, you are not wearing the correct colour\n");
	pushfp
	pusho "The computer says, \"Troubleshooter, you are not wearing the correct colour\n"
	call print

	line 238
# 	print("uniform.  You must put on an Ultraviolet uniform immediately.  I have seen to\n");
	pushfp
	pusho "uniform.  You must put on an Ultraviolet uniform immediately.  I have seen to\n"
	call print

	line 239
# 	print("your needs and ordered one already; it will be here shortly.  Please wait with\n");
	pushfp
	pusho "your needs and ordered one already; it will be here shortly.  Please wait with\n"
	call print

	line 240
# 	print("your back to the wall until it arrives.\"  In less than a minute an infrared\n");
	pushfp
	pusho "your back to the wall until it arrives.\"  In less than a minute an infrared\n"
	call print

	line 241
# 	print("arrives carrying a white bundle.  He asks you to sign for it, then hands it to\n");
	pushfp
	pusho "arrives carrying a white bundle.  He asks you to sign for it, then hands it to\n"
	call print

	line 242
# 	print("you and stands back, well outside of a fragmentation grenade\'s blast radius.\n");
	pushfp
	pusho "you and stands back, well outside of a fragmentation grenade\'s blast radius.\n"
	call print

	line 243
# 	return choose(6, "You open the package and put on the uniform", 7, "You finally come to your senses and run for it");
	pushfp
	pushi 6
	pusho "You open the package and put on the uniform"
	pushi 7
	pusho "You finally come to your senses and run for it"
	call choose
	loadi
	savei
	jump _return_page5

	line 244
# }
	pushi 0
	savei
: _return_page5
	return
: _37
	line 245
# 
	line 246
# function int page6
	line 247
# {
	jump _38
: page6
	line 248
# 	print("The uniform definitely makes you look snappy and pert.  It really looks\n");
	pushfp
	pusho "The uniform definitely makes you look snappy and pert.  It really looks\n"
	call print

	line 249
# 	print("impressive, and even has the new lopsided lapel fashion that you admire so\n");
	pushfp
	pusho "impressive, and even has the new lopsided lapel fashion that you admire so\n"
	call print

	line 250
# 	print("much.  What\'s more, citizens of all ranks come to obsequious attention as you\n");
	pushfp
	pusho "much.  What\'s more, citizens of all ranks come to obsequious attention as you\n"
	call print

	line 251
# 	print("walk past.  This isn\'t so bad being an Ultraviolet.  You could probably come\n");
	pushfp
	pusho "walk past.  This isn\'t so bad being an Ultraviolet.  You could probably come\n"
	call print

	line 252
# 	print("to like it, given time.\n");
	pushfp
	pusho "to like it, given time.\n"
	call print

	line 253
# 	print("The beeping computer terminal interrupts your musings.\n");
	pushfp
	pusho "The beeping computer terminal interrupts your musings.\n"
	call print

	line 254
# 	ultra_violet := 1;
	pushi 1
	pokei 10

	line 255
# 	more();
	pushfp
	call more

	line 256
# 	return 8;
	pushi 8
	savei
	jump _return_page6

	line 257
# }
	pushi 0
	savei
: _return_page6
	return
: _38
	line 258
# 
	line 259
# function int page7
	line 260
# {
	jump _39
: page7
	line 261
# 	print("The corridor lights dim and are replaced by red battle lamps as the Security\n");
	pushfp
	pusho "The corridor lights dim and are replaced by red battle lamps as the Security\n"
	call print

	line 262
# 	print("Breach alarms howl all around you.  You run headint down the corridor and\n");
	pushfp
	pusho "Breach alarms howl all around you.  You run headint down the corridor and\n"
	call print

	line 263
# 	print("desperately windmill around a corner, only to collide with a squad of 12 Blue\n");
	pushfp
	pusho "desperately windmill around a corner, only to collide with a squad of 12 Blue\n"
	call print

	line 264
# 	print("clearance Vulture squadron soldiers.  \"Stop, Slime Face,\" shouts the\n");
	pushfp
	pusho "clearance Vulture squadron soldiers.  \"Stop, Slime Face,\" shouts the\n"
	call print

	line 265
# 	print("commander, \"or there won\'t be enough of you left for a tissue sample.\"\n");
	pushfp
	pusho "commander, \"or there won\'t be enough of you left for a tissue sample.\"\n"
	call print

	line 266
# 	print("\"All right, soldiers, stuff the greasy traitor into the uniform,\" he orders,\n");
	pushfp
	pusho "\"All right, soldiers, stuff the greasy traitor into the uniform,\" he orders,\n"
	call print

	line 267
# 	print("waving the business end of his blue laser scant inches from your nose.\n");
	pushfp
	pusho "waving the business end of his blue laser scant inches from your nose.\n"
	call print

	line 268
# 	print("With his other hand he shakes open a white bundle to reveal a pristine new\n");
	pushfp
	pusho "With his other hand he shakes open a white bundle to reveal a pristine new\n"
	call print

	line 269
# 	print("Ultraviolet citizen's uniform.\n");
	pushfp
	pusho "Ultraviolet citizen's uniform.\n"
	call print

	line 270
# 	print("One of the Vulture squadron Troubleshooters grabs you by the neck in the\n");
	pushfp
	pusho "One of the Vulture squadron Troubleshooters grabs you by the neck in the\n"
	call print

	line 271
# 	print("exotic and very painful Vulture Clamp(tm) death grip (you saw a special about\n");
	pushfp
	pusho "exotic and very painful Vulture Clamp(tm) death grip (you saw a special about\n"
	call print

	line 272
# 	print("it on the Teela O\'Malley show), while the rest tear off your clothes and\n");
	pushfp
	pusho "it on the Teela O\'Malley show), while the rest tear off your clothes and\n"
	call print

	line 273
# 	print("force you into the Ultraviolet uniform.  The moment you are dressed they step\n");
	pushfp
	pusho "force you into the Ultraviolet uniform.  The moment you are dressed they step\n"
	call print

	line 274
# 	print("clear and stand at attention.\n");
	pushfp
	pusho "clear and stand at attention.\n"
	call print

	line 275
# 	print("\"Thank you for your cooperation, sir,\" says the steely eyed leader of the\n");
	pushfp
	pusho "\"Thank you for your cooperation, sir,\" says the steely eyed leader of the\n"
	call print

	line 276
# 	print("Vulture Squad.  \"We will be going about our business now.\"  With perfect\n");
	pushfp
	pusho "Vulture Squad.  \"We will be going about our business now.\"  With perfect\n"
	call print

	line 277
# 	print("timing the Vultures wheel smartly and goosestep down the corridor.\n");
	pushfp
	pusho "timing the Vultures wheel smartly and goosestep down the corridor.\n"
	call print

	line 278
# 	print("Special Note: don\'t make the mistake of assuming that your skills have\n");
	pushfp
	pusho "Special Note: don\'t make the mistake of assuming that your skills have\n"
	call print

	line 279
# 	print("improved any because of the uniform; you\'re only a Red Troubleshooter\n");
	pushfp
	pusho "improved any because of the uniform; you\'re only a Red Troubleshooter\n"
	call print

	line 280
# 	print("traitorously posing as an Ultraviolet, and don\'t you forget it!\n");
	pushfp
	pusho "traitorously posing as an Ultraviolet, and don\'t you forget it!\n"
	call print

	line 281
# 	print("Suddenly, a computer terminal comes to life beside you.\n");
	pushfp
	pusho "Suddenly, a computer terminal comes to life beside you.\n"
	call print

	line 282
# 	ultra_violet := 1;
	pushi 1
	pokei 10

	line 283
# 	more();
	pushfp
	call more

	line 284
# 	return 8;
	pushi 8
	savei
	jump _return_page7

	line 285
# }
	pushi 0
	savei
: _return_page7
	return
: _39
	line 286
# 
	line 287
# function int page8
	line 288
# {
	jump _40
: page8
	line 289
# 	print("\"Now, about your question, citizen.  Christmas was an old world marketing ploy\n");
	pushfp
	pusho "\"Now, about your question, citizen.  Christmas was an old world marketing ploy\n"
	call print

	line 290
# 	print("to induce lower clearance citizens to purchase vast quantities of goods, thus\n");
	pushfp
	pusho "to induce lower clearance citizens to purchase vast quantities of goods, thus\n"
	call print

	line 291
# 	print("accumulation a large amount of credit under the control of a single class of\n");
	pushfp
	pusho "accumulation a large amount of credit under the control of a single class of\n"
	call print

	line 292
# 	print("citizen known as Retailers.  The strategy used is to imply that all good\n");
	pushfp
	pusho "citizen known as Retailers.  The strategy used is to imply that all good\n"
	call print

	line 293
# 	print("citizens give gifts during Christmas, thus if one wishes to be a valuable\n");
	pushfp
	pusho "citizens give gifts during Christmas, thus if one wishes to be a valuable\n"
	call print

	line 294
# 	print("member of society one must also give gifts during Christmas.  More valuable\n");
	pushfp
	pusho "member of society one must also give gifts during Christmas.  More valuable\n"
	call print

	line 295
# 	print("gifts make one a more valuable member, and thus did the Retailers come to\n");
	pushfp
	pusho "gifts make one a more valuable member, and thus did the Retailers come to\n"
	call print

	line 296
# 	print("control a disproportionate amount of the currency.  In this way Christmas\n");
	pushfp
	pusho "control a disproportionate amount of the currency.  In this way Christmas\n"
	call print

	line 297
# 	print("eventually caused the collapse of the old world.  Understandably, Christmas\n");
	pushfp
	pusho "eventually caused the collapse of the old world.  Understandably, Christmas\n"
	call print

	line 298
# 	print("has been declared a treasonable practice in Alpha Complex.\n");
	pushfp
	pusho "has been declared a treasonable practice in Alpha Complex.\n"
	call print

	line 299
# 	print("Thank you for your inquiry.\"\n");
	pushfp
	pusho "Thank you for your inquiry.\"\n"
	call print

	line 300
# 	print("You continue on your way to GDH7-beta.\n");
	pushfp
	pusho "You continue on your way to GDH7-beta.\n"
	call print

	line 301
# 	more();
	pushfp
	call more

	line 302
# 	return 10;
	pushi 10
	savei
	jump _return_page8

	line 303
# }
	pushi 0
	savei
: _return_page8
	return
: _40
	line 304
# 
	line 305
# function int page9
	line 306
# {
	jump _41
: page9
	line 307
# 	int choice;
# local choice of type int at 0
	pushi 0
	line 308
# 	print("As you walk toward the tubecar that will take you to GDH7-beta, you pass one\n");
	pushfp
	pusho "As you walk toward the tubecar that will take you to GDH7-beta, you pass one\n"
	call print

	line 309
# 	print("of the bright blue and orange Internal Security self incrimination stations.\n");
	pushfp
	pusho "of the bright blue and orange Internal Security self incrimination stations.\n"
	call print

	line 310
# 	print("Inside, you can see an IS agent cheerfully greet an infrared citizen and then\n");
	pushfp
	pusho "Inside, you can see an IS agent cheerfully greet an infrared citizen and then\n"
	call print

	line 311
# 	print("lead him at gunpoint into one of the rubber lined discussion rooms.\n");
	pushfp
	pusho "lead him at gunpoint into one of the rubber lined discussion rooms.\n"
	call print

	line 312
# 	choice := choose(2,"You decide to stop here and chat, as ordered by The Computer",10,"You just continue blithely on past");
	pushfp
	pushi 2
	pusho "You decide to stop here and chat, as ordered by The Computer"
	pushi 10
	pusho "You just continue blithely on past"
	call choose
	loadi
	pokei 0

	line 313
# 	if (choice==2) computer_request := 1;
	peeki 0
	pushi 2
	sub
	itb
	not
	bne _42
	pushi 1
	pokei 9

	line 314
# 	else	       computer_request := 0;
	jump _43
: _42
	pushi 0
	pokei 9

: _43
	line 315
# 	return choice;
	peeki 0
	savei
	jump _return_page9

	line 316
# }
	pushi 0
	savei
: _return_page9
# retract over local var choice
	popi
	return
: _41
	line 317
# 
	line 318
# function int page10
	line 319
# {
	jump _44
: page10
	line 320
# 	int choice;
# local choice of type int at 0
	pushi 0
	line 321
# 	print("You stroll briskly down the corridor, up a ladder, across an unrailed catwalk,\n");
	pushfp
	pusho "You stroll briskly down the corridor, up a ladder, across an unrailed catwalk,\n"
	call print

	line 322
# 	print("under a perilously swinging blast door in urgent need of repair, and into\n");
	pushfp
	pusho "under a perilously swinging blast door in urgent need of repair, and into\n"
	call print

	line 323
# 	print("tubecar grand central.  This is the bustling hub of Alpha Complex tubecar\n");
	pushfp
	pusho "tubecar grand central.  This is the bustling hub of Alpha Complex tubecar\n"
	call print

	line 324
# 	print("transportation.  Before you spreads a spaghetti maze of magnalift tube tracks\n");
	pushfp
	pusho "transportation.  Before you spreads a spaghetti maze of magnalift tube tracks\n"
	call print

	line 325
# 	print("and linear accelerators.  You bravely study the specially enhanced 3-D tube\n");
	pushfp
	pusho "and linear accelerators.  You bravely study the specially enhanced 3-D tube\n"
	call print

	line 326
# 	print("route map; you wouldn\'t be the first Troubleshooter to take a fast tube ride\n");
	pushfp
	pusho "route map; you wouldn\'t be the first Troubleshooter to take a fast tube ride\n"
	call print

	line 327
# 	print("to nowhere.\n");
	pushfp
	pusho "to nowhere.\n"
	call print

	line 328
# 	if (ultra_violet == 0)
	line 329
# 	{
	peeki 10
	pushi 0
	sub
	itb
	not
	bne _45
	line 330
# 		choice := choose(3,"You decide to ask The Computer about Christmas using a nearby terminal",10,"You think you have the route worked out, so you\'ll board a tube train");
	pushfp
	pushi 3
	pusho "You decide to ask The Computer about Christmas using a nearby terminal"
	pushi 10
	pusho "You think you have the route worked out, so you\'ll board a tube train"
	call choose
	loadi
	pokei 0

	line 331
# 		if (choice==3) return choice;
	peeki 0
	pushi 3
	sub
	itb
	not
	bne _47
	peeki 0
	savei
	jump _return_page10

	line 332
# 	}
: _47
: _48
	line 333
# 	print("You nervously select a tubecar and step aboard.\n");
: _45
: _46
	pushfp
	pusho "You nervously select a tubecar and step aboard.\n"
	call print

	line 334
# 	if (dice_roll(2,10) < MOXIE)
	line 335
# 	{
	pushfp
	pushi 2
	pushi 10
	call dice_roll
	loadi
	peeki 4
	sub
	blt _51
	pushi 1
	jump _52
: _51
	pushi 0
: _52
	bne _49
	line 336
# 		print("You just caught a purple line tubecar.\n");
	pushfp
	pusho "You just caught a purple line tubecar.\n"
	call print

	line 337
# 		more();
	pushfp
	call more

	line 338
# 		return 13;
	pushi 13
	savei
	jump _return_page10

	line 339
# 	}
	line 340
# 	else
	line 341
# 	{
	jump _50
: _49
	line 342
# 		print("You just caught a brown line tubecar.\n");
	pushfp
	pusho "You just caught a brown line tubecar.\n"
	call print

	line 343
# 		more();
	pushfp
	call more

	line 344
# 		return 48;
	pushi 48
	savei
	jump _return_page10

	line 345
# 	}
: _50
	line 346
# }
	pushi 0
	savei
: _return_page10
# retract over local var choice
	popi
	return
: _44
	line 347
# 
	line 348
# function int page11
	line 349
# {
	jump _53
: page11
	line 350
# 	print("The printing on the folder says \"Experimental Self Briefing.\"\n");
	pushfp
	pusho "The printing on the folder says \"Experimental Self Briefing.\"\n"
	call print

	line 351
# 	print("You open it and begin to read the following:\n");
	pushfp
	pusho "You open it and begin to read the following:\n"
	call print

	line 352
# 	print("Step 1: Compel the briefing subject to attend the briefing.\n");
	pushfp
	pusho "Step 1: Compel the briefing subject to attend the briefing.\n"
	call print

	line 353
# 	print("        Note: See Experimental Briefing Sub Form Indigo-WY-2,\n");
	pushfp
	pusho "        Note: See Experimental Briefing Sub Form Indigo-WY-2,\n"
	call print

	line 354
# 	print("        \'Experimental Self Briefing Subject Acquisition Through The Use Of\n");
	pushfp
	pusho "        \'Experimental Self Briefing Subject Acquisition Through The Use Of\n"
	call print

	line 355
# 	print("         Neurotoxin Room Foggers.\'\n");
	pushfp
	pusho "         Neurotoxin Room Foggers.\'\n"
	call print

	line 356
# 	print("Step 2: Inform the briefing subject that the briefing has begun.\n");
	pushfp
	pusho "Step 2: Inform the briefing subject that the briefing has begun.\n"
	call print

	line 357
# 	print("        ATTENTION: THE BRIEFING HAS BEGUN.\n");
	pushfp
	pusho "        ATTENTION: THE BRIEFING HAS BEGUN.\n"
	call print

	line 358
# 	print("Step 3: Present the briefing material to the briefing subject.\n");
	pushfp
	pusho "Step 3: Present the briefing material to the briefing subject.\n"
	call print

	line 359
# 	print("        GREETINGS TROUBLESHOOTER.\n");
	pushfp
	pusho "        GREETINGS TROUBLESHOOTER.\n"
	call print

	line 360
# 	print("        YOU HAVE BEEN SPECIALLY SELECTED TO SINGLEHANDEDLY\n");
	pushfp
	pusho "        YOU HAVE BEEN SPECIALLY SELECTED TO SINGLEHANDEDLY\n"
	call print

	line 361
# 	print("        WIPE OUT A DEN OF TRAITOROUS CHRISTMAS ACTIVITY.  YOUR MISSION IS TO\n");
	pushfp
	pusho "        WIPE OUT A DEN OF TRAITOROUS CHRISTMAS ACTIVITY.  YOUR MISSION IS TO\n"
	call print

	line 362
# 	print("        GO TO GOODS DISTRIBUTION HALL 7-BETA AND ASSESS ANY CHRISTMAS ACTIVITY\n");
	pushfp
	pusho "        GO TO GOODS DISTRIBUTION HALL 7-BETA AND ASSESS ANY CHRISTMAS ACTIVITY\n"
	call print

	line 363
# 	print("        YOU FIND THERE.  YOU ARE TO INFILTRATE THESE CHRISTMAS CELEBRANTS,\n");
	pushfp
	pusho "        YOU FIND THERE.  YOU ARE TO INFILTRATE THESE CHRISTMAS CELEBRANTS,\n"
	call print

	line 364
# 	print("        LOCATE THEIR RINGLEADER, AN UNKNOWN MASTER RETAILER, AND BRING HIM\n");
	pushfp
	pusho "        LOCATE THEIR RINGLEADER, AN UNKNOWN MASTER RETAILER, AND BRING HIM\n"
	call print

	line 365
# 	print("        BACK FOR EXECUTION AND TRIAL.  THANK YOU.  THE COMPUTER IS YOUR FRIEND.\n");
	pushfp
	pusho "        BACK FOR EXECUTION AND TRIAL.  THANK YOU.  THE COMPUTER IS YOUR FRIEND.\n"
	call print

	line 366
# 	print("Step 4: Sign the briefing subject\'s briefing release form to indicate that\n");
	pushfp
	pusho "Step 4: Sign the briefing subject\'s briefing release form to indicate that\n"
	call print

	line 367
# 	print("        the briefing subject has completed the briefing.\n");
	pushfp
	pusho "        the briefing subject has completed the briefing.\n"
	call print

	line 368
# 	print("        ATTENTION: PLEASE SIGN YOUR BRIEFING RELEASE FORM.\n");
	pushfp
	pusho "        ATTENTION: PLEASE SIGN YOUR BRIEFING RELEASE FORM.\n"
	call print

	line 369
# 	print("Step 5: Terminate the briefing\n");
	pushfp
	pusho "Step 5: Terminate the briefing\n"
	call print

	line 370
# 	print("        ATTENTION: THE BRIEFING IS TERMINATED.\n");
	pushfp
	pusho "        ATTENTION: THE BRIEFING IS TERMINATED.\n"
	call print

	line 371
# 	more();
	pushfp
	call more

	line 372
# 	print("You walk to the door and hold your signed briefing release form up to the\n");
	pushfp
	pusho "You walk to the door and hold your signed briefing release form up to the\n"
	call print

	line 373
# 	print("plexiglass window.  A guard scrutinises it for a moment and then slides back\n");
	pushfp
	pusho "plexiglass window.  A guard scrutinises it for a moment and then slides back\n"
	call print

	line 374
# 	print("the megabolts holding the door shut.  You are now free to continue the\n");
	pushfp
	pusho "the megabolts holding the door shut.  You are now free to continue the\n"
	call print

	line 375
# 	print("mission.\n");
	pushfp
	pusho "mission.\n"
	call print

	line 376
# 	return choose(3,"You wish to ask The Computer for more information about Christmas",10,"You have decided to go directly to Goods Distribution Hall 7-beta");
	pushfp
	pushi 3
	pusho "You wish to ask The Computer for more information about Christmas"
	pushi 10
	pusho "You have decided to go directly to Goods Distribution Hall 7-beta"
	call choose
	loadi
	savei
	jump _return_page11

	line 377
# }
	pushi 0
	savei
: _return_page11
	return
: _53
	line 378
# 
	line 379
# function int page12
	line 380
# {
	jump _54
: page12
	line 381
# 	print("You walk up to the door and push the button labelled \"push to exit.\"\n");
	pushfp
	pusho "You walk up to the door and push the button labelled \"push to exit.\"\n"
	call print

	line 382
# 	print("Within seconds a surly looking guard shoves his face into the small plexiglass\n");
	pushfp
	pusho "Within seconds a surly looking guard shoves his face into the small plexiglass\n"
	call print

	line 383
# 	print("window.  You can see his mouth forming words but you can\'t hear any of them.\n");
	pushfp
	pusho "window.  You can see his mouth forming words but you can\'t hear any of them.\n"
	call print

	line 384
# 	print("You just stare at him blankly  for a few moments until he points down to a\n");
	pushfp
	pusho "You just stare at him blankly  for a few moments until he points down to a\n"
	call print

	line 385
# 	print("speaker on your side of the door.  When you put your ear to it you can barely\n");
	pushfp
	pusho "speaker on your side of the door.  When you put your ear to it you can barely\n"
	call print

	line 386
# 	print("hear him say, \"Let\'s see your briefing release form, bud.  You aren\'t\n");
	pushfp
	pusho "hear him say, \"Let\'s see your briefing release form, bud.  You aren\'t\n"
	call print

	line 387
# 	print("getting out of here without it.\"\n");
	pushfp
	pusho "getting out of here without it.\"\n"
	call print

	line 388
# 	return choose(11,"You sit down at the table and read the Orange packet",57,"You stare around the room some more");
	pushfp
	pushi 11
	pusho "You sit down at the table and read the Orange packet"
	pushi 57
	pusho "You stare around the room some more"
	call choose
	loadi
	savei
	jump _return_page12

	line 389
# }
	pushi 0
	savei
: _return_page12
	return
: _54
	line 390
# 
	line 391
# function int page13
	line 392
# {
	jump _55
: page13
	line 393
# 	print("You step into the shiny plasteel tubecar, wondering why the shape has always\n");
	pushfp
	pusho "You step into the shiny plasteel tubecar, wondering why the shape has always\n"
	call print

	line 394
# 	print("reminded you of bullets.  The car shoots forward the instant your feet touch\n");
	pushfp
	pusho "reminded you of bullets.  The car shoots forward the instant your feet touch\n"
	call print

	line 395
# 	print("the slippery gray floor, pinning you immobile against the back wall as the\n");
	pushfp
	pusho "the slippery gray floor, pinning you immobile against the back wall as the\n"
	call print

	line 396
# 	print("tubecar careens toward GDH7-beta.  Your only solace is the knowledge that it\n");
	pushfp
	pusho "tubecar careens toward GDH7-beta.  Your only solace is the knowledge that it\n"
	call print

	line 397
# 	print("could be worse, much worse.\n");
	pushfp
	pusho "could be worse, much worse.\n"
	call print

	line 398
# 	print("Before too int the car comes to a stop.  You can see signs for GDH7-beta\n");
	pushfp
	pusho "Before too int the car comes to a stop.  You can see signs for GDH7-beta\n"
	call print

	line 399
# 	print("through the window.  With a little practice you discover that you can crawl\n");
	pushfp
	pusho "through the window.  With a little practice you discover that you can crawl\n"
	call print

	line 400
# 	print("to the door and pull open the latch.\n");
	pushfp
	pusho "to the door and pull open the latch.\n"
	call print

	line 401
# 	more();
	pushfp
	call more

	line 402
# 	return 14;
	pushi 14
	savei
	jump _return_page13

	line 403
# }
	pushi 0
	savei
: _return_page13
	return
: _55
	line 404
# 
	line 405
# function int page14
	line 406
# {
	jump _56
: page14
	line 407
# 	print("You manage to pull yourself out of the tubecar and look around.  Before you is\n");
	pushfp
	pusho "You manage to pull yourself out of the tubecar and look around.  Before you is\n"
	call print

	line 408
# 	print("one of the most confusing things you have ever seen, a hallway that is\n");
	pushfp
	pusho "one of the most confusing things you have ever seen, a hallway that is\n"
	call print

	line 409
# 	print("simultaneously both red and green clearance.  If this is the result of\n");
	pushfp
	pusho "simultaneously both red and green clearance.  If this is the result of\n"
	call print

	line 410
# 	print("Christmas then it\'s easy to see the evils inherent in its practice.\n");
	pushfp
	pusho "Christmas then it\'s easy to see the evils inherent in its practice.\n"
	call print

	line 411
# 	print("You are in the heart of a large goods distribution centre.  You can see all\n");
	pushfp
	pusho "You are in the heart of a large goods distribution centre.  You can see all\n"
	call print

	line 412
# 	print("about you evidence of traitorous secret society Christmas celebration; rubber\n");
	pushfp
	pusho "about you evidence of traitorous secret society Christmas celebration; rubber\n"
	call print

	line 413
# 	print("faced robots whiz back and forth selling toys to holiday shoppers, simul-plast\n");
	pushfp
	pusho "faced robots whiz back and forth selling toys to holiday shoppers, simul-plast\n"
	call print

	line 414
# 	print("wreaths hang from every light fixture, while ahead in the shadows is a citizen\n");
	pushfp
	pusho "wreaths hang from every light fixture, while ahead in the shadows is a citizen\n"
	call print

	line 415
# 	print("wearing a huge red synthetic flower.\n");
	pushfp
	pusho "wearing a huge red synthetic flower.\n"
	call print

	line 416
# 	more();
	pushfp
	call more

	line 417
# 	return 22;
	pushi 22
	savei
	jump _return_page14

	line 418
# }
	pushi 0
	savei
: _return_page14
	return
: _56
	line 419
# 
	line 420
# function int page15
	line 421
# {
	jump _57
: page15
	line 422
# 	string c;
# local c of type string at 0
	pusho ""
	line 423
# 	print("You are set upon by a runty robot with a queer looking face and two pointy\n");
	pushfp
	pusho "You are set upon by a runty robot with a queer looking face and two pointy\n"
	call print

	line 424
# 	print("rubber ears poking from beneath a tattered cap.  \"Hey mister,\" it says,\n");
	pushfp
	pusho "rubber ears poking from beneath a tattered cap.  \"Hey mister,\" it says,\n"
	call print

	line 425
# 	print("\"you done all your last minute Christmas shopping?  I got some real neat junk\n");
	pushfp
	pusho "\"you done all your last minute Christmas shopping?  I got some real neat junk\n"
	call print

	line 426
# 	print("here.  You don\'t wanna miss the big day tommorrow, if you know what I mean.\"\n");
	pushfp
	pusho "here.  You don\'t wanna miss the big day tommorrow, if you know what I mean.\"\n"
	call print

	line 427
# 	print("The robot opens its bag to show you a pile of shoddy Troubleshooter dolls.  It\n");
	pushfp
	pusho "The robot opens its bag to show you a pile of shoddy Troubleshooter dolls.  It\n"
	call print

	line 428
# 	print("reaches in and pulls out one of them.  \"Look, these Action Troubleshooter(tm)\n");
	pushfp
	pusho "reaches in and pulls out one of them.  \"Look, these Action Troubleshooter(tm)\n"
	call print

	line 429
# 	print("dolls are the neatest thing.  This one\'s got moveable arms and when you\n");
	pushfp
	pusho "dolls are the neatest thing.  This one\'s got moveable arms and when you\n"
	call print

	line 430
# 	print("squeeze him, his little rifle squirts realistic looking napalm.  It\'s only\n");
	pushfp
	pusho "squeeze him, his little rifle squirts realistic looking napalm.  It\'s only\n"
	call print

	line 431
# 	print("50 credits.  Oh yeah, Merry Christmas.\"\n");
	pushfp
	pusho "50 credits.  Oh yeah, Merry Christmas.\"\n"
	call print

	line 432
# 	print("\nSelect \'a\', \'b\' or \'c\' :\n");
	pushfp
	pusho "\nSelect \'a\', \'b\' or \'c\' :\n"
	call print

	line 433
# 	print(" a - You decide to buy the doll.\n");
	pushfp
	pusho " a - You decide to buy the doll.\n"
	call print

	line 434
# 	print(" b - You shoot the robot.\n");
	pushfp
	pusho " b - You shoot the robot.\n"
	call print

	line 435
# 	print(" c - You ignore the robot and keep searching the hall.\n");
	pushfp
	pusho " c - You ignore the robot and keep searching the hall.\n"
	call print

	line 436
# 	c := get_char();
	pushfp
	call get_char
	loado
	pokeo 0

	line 437
# 	if (c == "a")
	line 438
# 		return 16;
	peeko 0
	pusho "a"
	strcmp
	itb
	not
	bne _58
	pushi 16
	savei
	jump _return_page15

	line 439
# 	else if (c == "b")
	jump _59
: _58
	line 440
# 		return 17;
	peeko 0
	pusho "b"
	strcmp
	itb
	not
	bne _60
	pushi 17
	savei
	jump _return_page15

	line 441
# 	else
	line 442
# 		return 22;
	jump _61
: _60
	pushi 22
	savei
	jump _return_page15

: _61
: _59
	line 443
# }
	pushi 0
	savei
: _return_page15
# retract over local var c
	popo
	return
: _57
	line 444
# 
	line 445
# function int page16
	line 446
# {
	jump _62
: page16
	line 447
# 	print("The doll is a good buy for fifty credits; it will make a fine Christmas present\n");
	pushfp
	pusho "The doll is a good buy for fifty credits; it will make a fine Christmas present\n"
	call print

	line 448
# 	print("for one of your friends.  After the sale the robot rolls away.  You can use\n");
	pushfp
	pusho "for one of your friends.  After the sale the robot rolls away.  You can use\n"
	call print

	line 449
# 	print("the doll later in combat.  It works just like a cone rifle firing napalm,\n");
	pushfp
	pusho "the doll later in combat.  It works just like a cone rifle firing napalm,\n"
	call print

	line 450
# 	print("except that occasionally it will explode and blow the user to smithereens.\n");
	pushfp
	pusho "except that occasionally it will explode and blow the user to smithereens.\n"
	call print

	line 451
# 	print("But don\'t let that stop you.\n");
	pushfp
	pusho "But don\'t let that stop you.\n"
	call print

	line 452
# 	action_doll := 1;
	pushi 1
	pokei 11

	line 453
# 	more();
	pushfp
	call more

	line 454
# 	return 22;
	pushi 22
	savei
	jump _return_page16

	line 455
# }
	pushi 0
	savei
: _return_page16
	return
: _62
	line 456
# 
	line 457
# function int page17
	line 458
# {
	jump _63
: page17
	line 459
# 	int i;
# local i of type int at 0
	pushi 0
	line 460
# 	int robot_hp := 15;
# local robot_hp of type int at 1
	pushi 15
	line 461
# 	print("You whip out your laser and shoot the robot, but not before it squeezes the\n");
	pushfp
	pusho "You whip out your laser and shoot the robot, but not before it squeezes the\n"
	call print

	line 462
# 	print("toy at you.  The squeeze toy has the same effect as a cone rifle firing napalm,\n");
	pushfp
	pusho "toy at you.  The squeeze toy has the same effect as a cone rifle firing napalm,\n"
	call print

	line 463
# 	print("and the elfbot\'s armour has no effect against your laser.\n");
	pushfp
	pusho "and the elfbot\'s armour has no effect against your laser.\n"
	call print

	line 464
# 	for(i:=0;i<2;i:=i+1)
	pushi 0
	pokei 0
: _64
	peeki 0
	pushi 2
	sub
	blt _66
	pushi 1
	jump _67
: _66
	pushi 0
: _67
	bne _65
	line 465
# 	{
	line 466
# 		if (dice_roll(1,100)<=25)
	line 467
# 		{
	pushfp
	pushi 1
	pushi 100
	call dice_roll
	loadi
	pushi 25
	sub
	ble _70
	pushi 1
	jump _71
: _70
	pushi 0
: _71
	bne _68
	line 468
# 			print("You have been hit!\n");
	pushfp
	pusho "You have been hit!\n"
	call print

	line 469
# 			hit_points := hit_points - dice_roll(1,10);
	peeki 12
	pushfp
	pushi 1
	pushi 10
	call dice_roll
	loadi
	sub
	pokei 12

	line 470
# 			if (hit_points<=0)
	line 471
# 			{
	peeki 12
	pushi 0
	sub
	ble _74
	pushi 1
	jump _75
: _74
	pushi 0
: _75
	bne _72
	line 472
# 				more();
	pushfp
	call more

	line 473
# 				return new_clone(45);
	pushfp
	pushi 45
	call new_clone
	loadi
	savei
	jump _return_page17

	line 474
# 			}
	line 475
# 		}
: _72
: _73
	line 476
# 		else
	line 477
# 			print("It missed you, but not by much!\n");
	jump _69
: _68
	pushfp
	pusho "It missed you, but not by much!\n"
	call print

: _69
	line 478
# 		if (dice_roll(1,100)<=40)
	line 479
# 		{
	pushfp
	pushi 1
	pushi 100
	call dice_roll
	loadi
	pushi 40
	sub
	ble _78
	pushi 1
	jump _79
: _78
	pushi 0
: _79
	bne _76
	line 480
# 			print("You zapped the little bastard!\n");
	pushfp
	pusho "You zapped the little bastard!\n"
	call print

	line 481
# 			robot_hp := robot_hp - dice_roll(2,10);
	peeki -1
	pushfp
	pushi 2
	pushi 10
	call dice_roll
	loadi
	sub
	pokei -1

	line 482
# 			if (robot_hp<=0)
	line 483
# 			{
	peeki -1
	pushi 0
	sub
	ble _82
	pushi 1
	jump _83
: _82
	pushi 0
: _83
	bne _80
	line 484
# 				print("You wasted it! Good shooting!\n");
	pushfp
	pusho "You wasted it! Good shooting!\n"
	call print

	line 485
# 				print("You will need more evidence, so you search GDH7-beta further\n");
	pushfp
	pusho "You will need more evidence, so you search GDH7-beta further\n"
	call print

	line 486
# 				if (hit_points<10)
	line 487
# 					print("after the GDH medbot has patched you up.\n");
	peeki 12
	pushi 10
	sub
	blt _86
	pushi 1
	jump _87
: _86
	pushi 0
: _87
	bne _84
	pushfp
	pusho "after the GDH medbot has patched you up.\n"
	call print

	line 488
# 				hit_points := 10;
: _84
: _85
	pushi 10
	pokei 12

	line 489
# 				more();
	pushfp
	call more

	line 490
# 				return 22;
	pushi 22
	savei
	jump _return_page17

	line 491
# 			}
	line 492
# 		}
: _80
: _81
	line 493
# 		else
	line 494
# 			print("Damn! You missed!\n");
	jump _77
: _76
	pushfp
	pusho "Damn! You missed!\n"
	call print

: _77
	line 495
# 	}
	peeki 0
	pushi 1
	add
	pokei 0

	jump _64
: _65
	line 496
# 	print("It tries to fire again, but the toy explodes and demolishes it.\n");
	pushfp
	pusho "It tries to fire again, but the toy explodes and demolishes it.\n"
	call print

	line 497
# 	print("You will need more evidence, so you search GDH7-beta further\n");
	pushfp
	pusho "You will need more evidence, so you search GDH7-beta further\n"
	call print

	line 498
# 	if (hit_points<10)
	line 499
# 		print("after the GDH medbot has patched you up.\n");
	peeki 12
	pushi 10
	sub
	blt _90
	pushi 1
	jump _91
: _90
	pushi 0
: _91
	bne _88
	pushfp
	pusho "after the GDH medbot has patched you up.\n"
	call print

	line 500
# 	hit_points := 10;
: _88
: _89
	pushi 10
	pokei 12

	line 501
# 	more();
	pushfp
	call more

	line 502
# 	return 22;
	pushi 22
	savei
	jump _return_page17

	line 503
# }
	pushi 0
	savei
: _return_page17
# retract over local var robot_hp
	popi
# retract over local var i
	popi
	return
: _63
	line 504
# 
	line 505
# function int page18
	line 506
# {
	jump _92
: page18
	line 507
# 	print("You walk to the centre of the hall, ogling like an infrared fresh from the\n");
	pushfp
	pusho "You walk to the centre of the hall, ogling like an infrared fresh from the\n"
	call print

	line 508
# 	print("clone vats.  Towering before you is the most unearthly thing you have ever\n");
	pushfp
	pusho "clone vats.  Towering before you is the most unearthly thing you have ever\n"
	call print

	line 509
# 	print("seen, a green multi armed mutant horror hulking 15 feet above your head.\n");
	pushfp
	pusho "seen, a green multi armed mutant horror hulking 15 feet above your head.\n"
	call print

	line 510
# 	print("Its skeletal body is draped with hundreds of metallic strips (probably to\n");
	pushfp
	pusho "Its skeletal body is draped with hundreds of metallic strips (probably to\n"
	call print

	line 511
# 	print("negate the effects of some insidious mutant power), and the entire hideous\n");
	pushfp
	pusho "negate the effects of some insidious mutant power), and the entire hideous\n"
	call print

	line 512
# 	print("creature is wrapped in a thousand blinking hazard lights.  It\'s times like\n");
	pushfp
	pusho "creature is wrapped in a thousand blinking hazard lights.  It\'s times like\n"
	call print

	line 513
# 	print("this when you wish you\'d had some training for this job.  Luckily the\n");
	pushfp
	pusho "this when you wish you\'d had some training for this job.  Luckily the\n"
	call print

	line 514
# 	print("creature doesn\'t take notice of you but stands unmoving, as though waiting for\n");
	pushfp
	pusho "creature doesn\'t take notice of you but stands unmoving, as though waiting for\n"
	call print

	line 515
# 	print("a summons from its dark lord, the Master Retailer.\n");
	pushfp
	pusho "a summons from its dark lord, the Master Retailer.\n"
	call print

	line 516
# 	print("WHAM, suddenly you are struck from behind.\n");
	pushfp
	pusho "WHAM, suddenly you are struck from behind.\n"
	call print

	line 517
# 	if (dice_roll(2,10)<AGILITY)	return 19;
	pushfp
	pushi 2
	pushi 10
	call dice_roll
	loadi
	peeki 5
	sub
	blt _95
	pushi 1
	jump _96
: _95
	pushi 0
: _96
	bne _93
	pushi 19
	savei
	jump _return_page18

	line 518
# 	else				return 20;
	jump _94
: _93
	pushi 20
	savei
	jump _return_page18

: _94
	line 519
# }
	pushi 0
	savei
: _return_page18
	return
: _92
	line 520
# 
	line 521
# function int page19
	line 522
# {
	jump _97
: page19
	line 523
# 	print("Quickly you regain your balance, whirl and fire your laser into the Ultraviolet\n");
	pushfp
	pusho "Quickly you regain your balance, whirl and fire your laser into the Ultraviolet\n"
	call print

	line 524
# 	print("citizen behind you.  For a moment your heart leaps to your throat, then you\n");
	pushfp
	pusho "citizen behind you.  For a moment your heart leaps to your throat, then you\n"
	call print

	line 525
# 	print("realise that he is indeed dead and you will be the only one filing a report on\n");
	pushfp
	pusho "realise that he is indeed dead and you will be the only one filing a report on\n"
	call print

	line 526
# 	print("this incident.  Besides, he was participating in this traitorous Christmas\n");
	pushfp
	pusho "this incident.  Besides, he was participating in this traitorous Christmas\n"
	call print

	line 527
# 	print("shopping, as is evident from the rain of shoddy toys falling all around you.\n");
	pushfp
	pusho "shopping, as is evident from the rain of shoddy toys falling all around you.\n"
	call print

	line 528
# 	print("Another valorous deed done in the service of The Computer!\n");
	pushfp
	pusho "Another valorous deed done in the service of The Computer!\n"
	call print

	line 529
# 	killer_count := killer_count + 1;
	peeki 16
	pushi 1
	add
	pokei 16

	line 530
# 	if (killer_count>(MAXKILL-clone))
	line 531
# 	{
	peeki 16
	peeki 6
	peeki 7
	sub
	sub
	bgt _100
	pushi 1
	jump _101
: _100
	pushi 0
: _101
	bne _98
	line 532
# 		more();
	pushfp
	call more

	line 533
# 		return 21;
	pushi 21
	savei
	jump _return_page19

	line 534
# 	}
	line 535
# 	if (read_letter==1)
: _98
: _99
	line 536
# 	{
	peeki 13
	pushi 1
	sub
	itb
	not
	bne _102
	line 537
# 		more();
	pushfp
	call more

	line 538
# 		return 22;
	pushi 22
	savei
	jump _return_page19

	line 539
# 	}
	line 540
# 	return choose(34,"You search the body, keeping an eye open for Internal Security",22,"You run away like the cowardly dog you are");
: _102
: _103
	pushfp
	pushi 34
	pusho "You search the body, keeping an eye open for Internal Security"
	pushi 22
	pusho "You run away like the cowardly dog you are"
	call choose
	loadi
	savei
	jump _return_page19

	line 541
# }
	pushi 0
	savei
: _return_page19
	return
: _97
	line 542
# 
	line 543
# function int page20
	line 544
# {
	jump _104
: page20
	line 545
# 	print("Oh no! you can\'t keep your balance.  You\'re falling, falling head first into\n");
	pushfp
	pusho "Oh no! you can\'t keep your balance.  You\'re falling, falling head first into\n"
	call print

	line 546
# 	print("the Christmas beast\'s gaping maw.  It\'s a valiant struggle; you think you are\n");
	pushfp
	pusho "the Christmas beast\'s gaping maw.  It\'s a valiant struggle; you think you are\n"
	call print

	line 547
# 	print("gone when its poisonous needles dig into your flesh, but with a heroic effort\n");
	pushfp
	pusho "gone when its poisonous needles dig into your flesh, but with a heroic effort\n"
	call print

	line 548
# 	print("you jerk a string of lights free and jam the live wires into the creature\'s\n");
	pushfp
	pusho "you jerk a string of lights free and jam the live wires into the creature\'s\n"
	call print

	line 549
# 	print("spine.  The Christmas beast topples to the ground and begins to burn, filling\n");
	pushfp
	pusho "spine.  The Christmas beast topples to the ground and begins to burn, filling\n"
	call print

	line 550
# 	print("the area with a thick acrid smoke.  It takes only a moment to compose yourself,\n");
	pushfp
	pusho "the area with a thick acrid smoke.  It takes only a moment to compose yourself,\n"
	call print

	line 551
# 	print("and then you are ready to continue your search for the Master Retailer.\n");
	pushfp
	pusho "and then you are ready to continue your search for the Master Retailer.\n"
	call print

	line 552
# 	more();
	pushfp
	call more

	line 553
# 	return 22;
	pushi 22
	savei
	jump _return_page20

	line 554
# }
	pushi 0
	savei
: _return_page20
	return
: _104
	line 555
# 
	line 556
# function int page21
	line 557
# {
	jump _105
: page21
	line 558
# 	print("You have been wasting the leading citizens of Alpha Complex at a prodigious\n");
	pushfp
	pusho "You have been wasting the leading citizens of Alpha Complex at a prodigious\n"
	call print

	line 559
# 	print("rate.  This has not gone unnoticed by the Internal Security squad at GDH7-beta.\n");
	pushfp
	pusho "rate.  This has not gone unnoticed by the Internal Security squad at GDH7-beta.\n"
	call print

	line 560
# 	print("Suddenly, a net of laser beams spear out of the gloomy corners of the hall,\n");
	pushfp
	pusho "Suddenly, a net of laser beams spear out of the gloomy corners of the hall,\n"
	call print

	line 561
# 	print("chopping you into teeny, weeny bite size pieces.\n");
	pushfp
	pusho "chopping you into teeny, weeny bite size pieces.\n"
	call print

	line 562
# 	more();
	pushfp
	call more

	line 563
# 	return new_clone(45);
	pushfp
	pushi 45
	call new_clone
	loadi
	savei
	jump _return_page21

	line 564
# }
	pushi 0
	savei
: _return_page21
	return
: _105
	line 565
# 
	line 566
# function int page22
	line 567
# {
	jump _106
: page22
	line 568
# 	int d;
# local d of type int at 0
	pushi 0
	line 569
# 	print("You are searching Goods Distribution Hall 7-beta.\n");
	pushfp
	pusho "You are searching Goods Distribution Hall 7-beta.\n"
	call print

	line 570
# 	d := dice_roll(1,4);
	pushfp
	pushi 1
	pushi 4
	call dice_roll
	loadi
	pokei 0

	line 571
# 	more();
	pushfp
	call more

	line 572
# 	if (d == 1)
	line 573
# 		return 18;
	peeki 0
	pushi 1
	sub
	itb
	not
	bne _107
	pushi 18
	savei
	jump _return_page22

	line 574
# 	else if (d == 2)
	jump _108
: _107
	line 575
# 		return 15;
	peeki 0
	pushi 2
	sub
	itb
	not
	bne _109
	pushi 15
	savei
	jump _return_page22

	line 576
# 	else if (d == 3)
	jump _110
: _109
	line 577
# 		return 18;
	peeki 0
	pushi 3
	sub
	itb
	not
	bne _111
	pushi 18
	savei
	jump _return_page22

	line 578
# 	else if (d == 4)
	jump _112
: _111
	line 579
# 		return 29;
	peeki 0
	pushi 4
	sub
	itb
	not
	bne _113
	pushi 29
	savei
	jump _return_page22

	line 580
# }
: _113
: _114
: _112
: _110
: _108
	pushi 0
	savei
: _return_page22
# retract over local var d
	popi
	return
: _106
	line 581
# 
	line 582
# function int page23
	line 583
# {
	jump _115
: page23
	line 584
# 	print("You go to the nearest computer terminal and declare yourself a mutant.\n");
	pushfp
	pusho "You go to the nearest computer terminal and declare yourself a mutant.\n"
	call print

	line 585
# 	print("\"A mutant, he\'s a mutant,\" yells a previously unnoticed infrared who had\n");
	pushfp
	pusho "\"A mutant, he\'s a mutant,\" yells a previously unnoticed infrared who had\n"
	call print

	line 586
# 	print("been looking over your shoulder.  You easily gun him down, but not before a\n");
	pushfp
	pusho "been looking over your shoulder.  You easily gun him down, but not before a\n"
	call print

	line 587
# 	print("dozen more citizens take notice and aim their weapons at you.\n");
	pushfp
	pusho "dozen more citizens take notice and aim their weapons at you.\n"
	call print

	line 588
# 	return choose(28,"You tell them that it was really only a bad joke",24,"You want to fight it out, one against twelve");
	pushfp
	pushi 28
	pusho "You tell them that it was really only a bad joke"
	pushi 24
	pusho "You want to fight it out, one against twelve"
	call choose
	loadi
	savei
	jump _return_page23

	line 589
# }
	pushi 0
	savei
: _return_page23
	return
: _115
	line 590
# 
	line 591
# function int page24
	line 592
# {
	jump _116
: page24
	line 593
# 	print("Golly, I never expected someone to pick this.  I haven\'t even designed\n");
	pushfp
	pusho "Golly, I never expected someone to pick this.  I haven\'t even designed\n"
	call print

	line 594
# 	print("the 12 citizens who are going to make a sponge out of you.  Tell you what,\n");
	pushfp
	pusho "the 12 citizens who are going to make a sponge out of you.  Tell you what,\n"
	call print

	line 595
# 	print("I\'ll give you a second chance.\n");
	pushfp
	pusho "I\'ll give you a second chance.\n"
	call print

	line 596
# 	return choose(28,"You change your mind and say it was only a bad joke",25,"You REALLY want to shoot it out");
	pushfp
	pushi 28
	pusho "You change your mind and say it was only a bad joke"
	pushi 25
	pusho "You REALLY want to shoot it out"
	call choose
	loadi
	savei
	jump _return_page24

	line 597
# }
	pushi 0
	savei
: _return_page24
	return
: _116
	line 598
# 
	line 599
# function int page25
	line 600
# {
	jump _117
: page25
	line 601
# 	print("Boy, you really can\'t take a hint!\n");
	pushfp
	pusho "Boy, you really can\'t take a hint!\n"
	call print

	line 602
# 	print("They\'re closing in.  Their trigger fingers are twitching, they\'re about to\n");
	pushfp
	pusho "They\'re closing in.  Their trigger fingers are twitching, they\'re about to\n"
	call print

	line 603
# 	print("shoot.  This is your last chance.\n");
	pushfp
	pusho "shoot.  This is your last chance.\n"
	call print

	line 604
# 	return choose(28,"You tell them it was all just a bad joke",26,"You are going to shoot");
	pushfp
	pushi 28
	pusho "You tell them it was all just a bad joke"
	pushi 26
	pusho "You are going to shoot"
	call choose
	loadi
	savei
	jump _return_page25

	line 605
# }
	pushi 0
	savei
: _return_page25
	return
: _117
	line 606
# 
	line 607
# function int page26
	line 608
# {
	jump _118
: page26
	line 609
# 	print("You can read the cold, sober hatred in their eyes (They really didn\'t think\n");
	pushfp
	pusho "You can read the cold, sober hatred in their eyes (They really didn\'t think\n"
	call print

	line 610
# 	print("it was funny), as they tighten the circle around you.  One of them shoves a\n");
	pushfp
	pusho "it was funny), as they tighten the circle around you.  One of them shoves a\n"
	call print

	line 611
# 	print("blaster up your nose, but that doesn\'t hurt as much as the multi-gigawatt\n");
	pushfp
	pusho "blaster up your nose, but that doesn\'t hurt as much as the multi-gigawatt\n"
	call print

	line 612
# 	print("carbonium tipped food drill in the small of your back.\n");
	pushfp
	pusho "carbonium tipped food drill in the small of your back.\n"
	call print

	line 613
# 	print("You spend the remaining micro-seconds of your life wondering what you did wrong.\n");
	pushfp
	pusho "You spend the remaining micro-seconds of your life wondering what you did wrong.\n"
	call print

	line 614
# 	more();
	pushfp
	call more

	line 615
# 	return new_clone(32);
	pushfp
	pushi 32
	call new_clone
	loadi
	savei
	jump _return_page26

	line 616
# }
	pushi 0
	savei
: _return_page26
	return
: _118
	line 617
# 
	line 618
# function int page27
	line 619
# {
	jump _119
: page27
	line 620
# 	// doesn't exist.  Can't happen with computer version.
	line 621
# 	// designed to catch dice cheats
	line 622
# }
	pushi 0
	savei
: _return_page27
	return
: _119
	line 623
# 
	line 624
# function int page28
	line 625
# {
	jump _120
: page28
	line 626
# 	print("They don\'t think it\'s funny.\n");
	pushfp
	pusho "They don\'t think it\'s funny.\n"
	call print

	line 627
# 	more();
	pushfp
	call more

	line 628
# 	return 26;
	pushi 26
	savei
	jump _return_page28

	line 629
# }
	pushi 0
	savei
: _return_page28
	return
: _120
	line 630
# 
	line 631
# function int page29
	line 632
# {
	jump _121
: page29
	line 633
# 	string c;
# local c of type string at 0
	pusho ""
	line 634
# 	print("\"Psst, hey citizen, come here.  Pssfft,\" you hear.  When you peer around\n");
	pushfp
	pusho "\"Psst, hey citizen, come here.  Pssfft,\" you hear.  When you peer around\n"
	call print

	line 635
# 	print("you can see someone\'s dim outline in the shadows.  \"I got some information\n");
	pushfp
	pusho "you can see someone\'s dim outline in the shadows.  \"I got some information\n"
	call print

	line 636
# 	print("on the Master Retailer.  It\'ll only cost you 30 psst credits.\"\n");
	pushfp
	pusho "on the Master Retailer.  It\'ll only cost you 30 psst credits.\"\n"
	call print

	line 637
# 	print("\nSelect \'a\', \'b\' or \'c\' :\n");
	pushfp
	pusho "\nSelect \'a\', \'b\' or \'c\' :\n"
	call print

	line 638
# 	print(" a - You pay the 30 credits for the info.\n");
	pushfp
	pusho " a - You pay the 30 credits for the info.\n"
	call print

	line 639
# 	print(" b - You would rather threaten him for the information.\n");
	pushfp
	pusho " b - You would rather threaten him for the information.\n"
	call print

	line 640
# 	print(" c - You ignore him and walk away.\n");
	pushfp
	pusho " c - You ignore him and walk away.\n"
	call print

	line 641
# 	c := get_char();
	pushfp
	call get_char
	loado
	pokeo 0

	line 642
# 	if (c == "a")
	line 643
# 		return 30;
	peeko 0
	pusho "a"
	strcmp
	itb
	not
	bne _122
	pushi 30
	savei
	jump _return_page29

	line 644
# 	else if (c == "b")
	jump _123
: _122
	line 645
# 		return 31;
	peeko 0
	pusho "b"
	strcmp
	itb
	not
	bne _124
	pushi 31
	savei
	jump _return_page29

	line 646
# 	else
	line 647
# 		return 22;
	jump _125
: _124
	pushi 22
	savei
	jump _return_page29

: _125
: _123
	line 648
# }
	pushi 0
	savei
: _return_page29
# retract over local var c
	popo
	return
: _121
	line 649
# 
	line 650
# function int page30
	line 651
# {
	jump _126
: page30
	line 652
# 	string c;
# local c of type string at 0
	pusho ""
	line 653
# 	print("You step into the shadows and offer the man a thirty credit bill.  \"Just drop\n");
	pushfp
	pusho "You step into the shadows and offer the man a thirty credit bill.  \"Just drop\n"
	call print

	line 654
# 	print("it on the floor,\" he says.  \"So you\'re looking for the Master Retailer, pssfft?\n");
	pushfp
	pusho "it on the floor,\" he says.  \"So you\'re looking for the Master Retailer, pssfft?\n"
	call print

	line 655
# 	print("I\'ve seen him, he\'s a fat man in a fuzzy red and white jump suit.  They say\n");
	pushfp
	pusho "I\'ve seen him, he\'s a fat man in a fuzzy red and white jump suit.  They say\n"
	call print

	line 656
# 	print("he\'s a high programmer with no respect for proper security.  If you want to\n");
	pushfp
	pusho "he\'s a high programmer with no respect for proper security.  If you want to\n"
	call print

	line 657
# 	print("find him then pssfft step behind me and go through the door.\"\n");
	pushfp
	pusho "find him then pssfft step behind me and go through the door.\"\n"
	call print

	line 658
# 	print("Behind the man is a reinforced plasteel blast door.  The centre of it has been\n");
	pushfp
	pusho "Behind the man is a reinforced plasteel blast door.  The centre of it has been\n"
	call print

	line 659
# 	print("buckled toward you in a manner you only saw once before when you were field\n");
	pushfp
	pusho "buckled toward you in a manner you only saw once before when you were field\n"
	call print

	line 660
# 	print("testing the rocket assist plasma slingshot (you found it easily portable but\n");
	pushfp
	pusho "testing the rocket assist plasma slingshot (you found it easily portable but\n"
	call print

	line 661
# 	print("prone to misfire).  Luckily it isn\'t buckled too far for you to make out the\n");
	pushfp
	pusho "prone to misfire).  Luckily it isn\'t buckled too far for you to make out the\n"
	call print

	line 662
# 	print("warning sign.  WARNING!! Don\'t open this door or the same thing will happen to\n");
	pushfp
	pusho "warning sign.  WARNING!! Don\'t open this door or the same thing will happen to\n"
	call print

	line 663
# 	print("you.  Opening this door is a capital offense.  Do not do it.  Not at all. This\n");
	pushfp
	pusho "you.  Opening this door is a capital offense.  Do not do it.  Not at all. This\n"
	call print

	line 664
# 	print("is not a joke.\n");
	pushfp
	pusho "is not a joke.\n"
	call print

	line 665
# 	print("\nSelect \'a\', \'b\' or \'c\' :\n");
	pushfp
	pusho "\nSelect \'a\', \'b\' or \'c\' :\n"
	call print

	line 666
# 	print(" a - You use your Precognition mutant power on opening the door.\n");
	pushfp
	pusho " a - You use your Precognition mutant power on opening the door.\n"
	call print

	line 667
# 	print(" b - You just go through the door anyway.\n");
	pushfp
	pusho " b - You just go through the door anyway.\n"
	call print

	line 668
# 	print(" c - You decide it\'s too dangerous and walk away.\n");
	pushfp
	pusho " c - You decide it\'s too dangerous and walk away.\n"
	call print

	line 669
# 	c := get_char();
	pushfp
	call get_char
	loado
	pokeo 0

	line 670
# 	if (c == "a")
	line 671
# 		return 56;
	peeko 0
	pusho "a"
	strcmp
	itb
	not
	bne _127
	pushi 56
	savei
	jump _return_page30

	line 672
# 	else if (c == "b")
	jump _128
: _127
	line 673
# 		return 33;
	peeko 0
	pusho "b"
	strcmp
	itb
	not
	bne _129
	pushi 33
	savei
	jump _return_page30

	line 674
# 	else
	line 675
# 		return 22;
	jump _130
: _129
	pushi 22
	savei
	jump _return_page30

: _130
: _128
	line 676
# }
	pushi 0
	savei
: _return_page30
# retract over local var c
	popo
	return
: _126
	line 677
# 
	line 678
# function int page31
	line 679
# {
	jump _131
: page31
	line 680
# 	print("Like any good troubleshooter you make the least expensive decision and threaten\n");
	pushfp
	pusho "Like any good troubleshooter you make the least expensive decision and threaten\n"
	call print

	line 681
# 	print("him for information.  With lightning like reflexes you whip out your laser and\n");
	pushfp
	pusho "him for information.  With lightning like reflexes you whip out your laser and\n"
	call print

	line 682
# 	print("stick it up his nose.  \"Talk, you traitorous Christmas celebrator, or who nose\n");
	pushfp
	pusho "stick it up his nose.  \"Talk, you traitorous Christmas celebrator, or who nose\n"
	call print

	line 683
# 	print("what will happen to you, yuk yuk,\" you pun menacingly, and then you notice\n");
	pushfp
	pusho "what will happen to you, yuk yuk,\" you pun menacingly, and then you notice\n"
	call print

	line 684
# 	print("something is very wrong.  He doesn\'t have a nose.  As a matter of fact he\'s\n");
	pushfp
	pusho "something is very wrong.  He doesn\'t have a nose.  As a matter of fact he\'s\n"
	call print

	line 685
# 	print("made of one eighth inch cardboard and your laser is sticking through the other\n");
	pushfp
	pusho "made of one eighth inch cardboard and your laser is sticking through the other\n"
	call print

	line 686
# 	print("side of his head.  \"Are you going to pay?\" says his mouth speaker,\n");
	pushfp
	pusho "side of his head.  \"Are you going to pay?\" says his mouth speaker,\n"
	call print

	line 687
# 	print("\"or are you going to pssfft go away stupid?\"\n");
	pushfp
	pusho "\"or are you going to pssfft go away stupid?\"\n"
	call print

	line 688
# 	return choose(30,"You pay the 30 credits",22,"You pssfft go away stupid");
	pushfp
	pushi 30
	pusho "You pay the 30 credits"
	pushi 22
	pusho "You pssfft go away stupid"
	call choose
	loadi
	savei
	jump _return_page31

	line 689
# }
	pushi 0
	savei
: _return_page31
	return
: _131
	line 690
# 
	line 691
# function int page32
	line 692
# {
	jump _132
: page32
	line 693
# 	print("Finally it\'s your big chance to prove that you\'re as good a troubleshooter\n");
	pushfp
	pusho "Finally it\'s your big chance to prove that you\'re as good a troubleshooter\n"
	call print

	line 694
# 	print("as your previous clone.  You walk briskly to mission briefing and pick up your\n");
	pushfp
	pusho "as your previous clone.  You walk briskly to mission briefing and pick up your\n"
	call print

	line 695
# 	print("previous clone\'s personal effects and notepad.  After reviewing the notes you\n");
	pushfp
	pusho "previous clone\'s personal effects and notepad.  After reviewing the notes you\n"
	call print

	line 696
# 	print("know what has to be done.  You catch the purple line to Goods Distribution Hall\n");
	pushfp
	pusho "know what has to be done.  You catch the purple line to Goods Distribution Hall\n"
	call print

	line 697
# 	print("7-beta and begin to search for the blast door.\n");
	pushfp
	pusho "7-beta and begin to search for the blast door.\n"
	call print

	line 698
# 	more();
	pushfp
	call more

	line 699
# 	return 22;
	pushi 22
	savei
	jump _return_page32

	line 700
# }
	pushi 0
	savei
: _return_page32
	return
: _132
	line 701
# 
	line 702
# function int page33
	line 703
# {
	jump _133
: page33
	line 704
# 	blast_door := 1;
	pushi 1
	pokei 15

	line 705
# 	print("You release the megabolts on the blast door, then strain against it with your\n");
	pushfp
	pusho "You release the megabolts on the blast door, then strain against it with your\n"
	call print

	line 706
# 	print("awesome strength.  Slowly the door creaks open.  You bravely leap through the\n");
	pushfp
	pusho "awesome strength.  Slowly the door creaks open.  You bravely leap through the\n"
	call print

	line 707
# 	print("opening and smack your head into the barrel of a 300 mm \'ultra shock\' class\n");
	pushfp
	pusho "opening and smack your head into the barrel of a 300 mm \'ultra shock\' class\n"
	call print

	line 708
# 	print("plasma cannon.  It\'s dark in the barrel now, but just before your head got\n");
	pushfp
	pusho "plasma cannon.  It\'s dark in the barrel now, but just before your head got\n"
	call print

	line 709
# 	print("stuck you can remember seeing a group of technicians anxiously watch you leap\n");
	pushfp
	pusho "stuck you can remember seeing a group of technicians anxiously watch you leap\n"
	call print

	line 710
# 	print("into the room.\n");
	pushfp
	pusho "into the room.\n"
	call print

	line 711
# 	more();
	pushfp
	call more

	line 712
# 	if (ultra_violet == 1)
	line 713
# 		return 35;
	peeki 10
	pushi 1
	sub
	itb
	not
	bne _134
	pushi 35
	savei
	jump _return_page33

	line 714
# 	else
	line 715
# 		return 36;
	jump _135
: _134
	pushi 36
	savei
	jump _return_page33

: _135
	line 716
# }
	pushi 0
	savei
: _return_page33
	return
: _133
	line 717
# 
	line 718
# function int page34
	line 719
# {
	jump _136
: page34
	line 720
# 	print("You have found a sealed envelope on the body.  You open it and read:\n");
	pushfp
	pusho "You have found a sealed envelope on the body.  You open it and read:\n"
	call print

	line 721
# 	print("\"WARNING: Ultraviolet Clearance ONLY.  DO NOT READ.\n");
	pushfp
	pusho "\"WARNING: Ultraviolet Clearance ONLY.  DO NOT READ.\n"
	call print

	line 722
# 	print("Memo from Chico-U-MRX4 to Harpo-U-MRX5.\n");
	pushfp
	pusho "Memo from Chico-U-MRX4 to Harpo-U-MRX5.\n"
	call print

	line 723
# 	print("The planned takeover of the Troubleshooter Training Course goes well, Comrade.\n");
	pushfp
	pusho "The planned takeover of the Troubleshooter Training Course goes well, Comrade.\n"
	call print

	line 724
# 	print("Once we have trained the unwitting bourgeois troubleshooters to work as\n");
	pushfp
	pusho "Once we have trained the unwitting bourgeois troubleshooters to work as\n"
	call print

	line 725
# 	print("communist dupes, the overthrow of Alpha Complex will be unstoppable.  My survey\n");
	pushfp
	pusho "communist dupes, the overthrow of Alpha Complex will be unstoppable.  My survey\n"
	call print

	line 726
# 	print("of the complex has convinced me that no one suspects a thing; soon it will be\n");
	pushfp
	pusho "of the complex has convinced me that no one suspects a thing; soon it will be\n"
	call print

	line 727
# 	print("too late for them to oppose the revolution.  The only thing that could possibly\n");
	pushfp
	pusho "too late for them to oppose the revolution.  The only thing that could possibly\n"
	call print

	line 728
# 	print("impede the people\'s revolution would be someone alerting The Computer to our\n");
	pushfp
	pusho "impede the people\'s revolution would be someone alerting The Computer to our\n"
	call print

	line 729
# 	print("plans (for instance, some enterprising Troubleshooter could tell The Computer\n");
	pushfp
	pusho "plans (for instance, some enterprising Troubleshooter could tell The Computer\n"
	call print

	line 730
# 	print("that the communists have liberated the Troubleshooter Training Course and plan\n");
	pushfp
	pusho "that the communists have liberated the Troubleshooter Training Course and plan\n"
	call print

	line 731
# 	print("to use it as a jumping off point from which to undermine the stability of all\n");
	pushfp
	pusho "to use it as a jumping off point from which to undermine the stability of all\n"
	call print

	line 732
# 	print("Alpha Complex), but as we both know, the capitalistic Troubleshooters would\n");
	pushfp
	pusho "Alpha Complex), but as we both know, the capitalistic Troubleshooters would\n"
	call print

	line 733
# 	print("never serve the interests of the proletariat above their own bourgeois desires.\n");
	pushfp
	pusho "never serve the interests of the proletariat above their own bourgeois desires.\n"
	call print

	line 734
# 	print("P.S. I\'m doing some Christmas shopping later today.  Would you like me to pick\n");
	pushfp
	pusho "P.S. I\'m doing some Christmas shopping later today.  Would you like me to pick\n"
	call print

	line 735
# 	print("you up something?\"\n");
	pushfp
	pusho "you up something?\"\n"
	call print

	line 736
# 	more();
	pushfp
	call more

	line 737
# 	print("When you put down the memo you are overcome by that strange deja\'vu again.\n");
	pushfp
	pusho "When you put down the memo you are overcome by that strange deja\'vu again.\n"
	call print

	line 738
# 	print("You see yourself talking privately with The Computer.  You are telling it all\n");
	pushfp
	pusho "You see yourself talking privately with The Computer.  You are telling it all\n"
	call print

	line 739
# 	print("about the communists\' plan, and then the scene shifts and you see yourself\n");
	pushfp
	pusho "about the communists\' plan, and then the scene shifts and you see yourself\n"
	call print

	line 740
# 	print("showered with awards for foiling the insidious communist plot to take over the\n");
	pushfp
	pusho "showered with awards for foiling the insidious communist plot to take over the\n"
	call print

	line 741
# 	print("complex.\n");
	pushfp
	pusho "complex.\n"
	call print

	line 742
# 	read_letter := 1;
	pushi 1
	pokei 13

	line 743
# 	return choose(46,"You rush off to the nearest computer terminal to expose the commies",22,"You wander off to look for more evidence");
	pushfp
	pushi 46
	pusho "You rush off to the nearest computer terminal to expose the commies"
	pushi 22
	pusho "You wander off to look for more evidence"
	call choose
	loadi
	savei
	jump _return_page34

	line 744
# }
	pushi 0
	savei
: _return_page34
	return
: _136
	line 745
# 
	line 746
# function int page35
	line 747
# {
	jump _137
: page35
	line 748
# 	print("\"Oh master,\" you hear through the gun barrel, \"where have you been? It is\n");
	pushfp
	pusho "\"Oh master,\" you hear through the gun barrel, \"where have you been? It is\n"
	call print

	line 749
# 	print("time for the great Christmas gifting ceremony.  You had better hurry and get\n");
	pushfp
	pusho "time for the great Christmas gifting ceremony.  You had better hurry and get\n"
	call print

	line 750
# 	print("the costume on or the trainee may begin to suspect.\"  For the second time\n");
	pushfp
	pusho "the costume on or the trainee may begin to suspect.\"  For the second time\n"
	call print

	line 751
# 	print("today you are forced to wear attire not of your own choosing.  They zip the\n");
	pushfp
	pusho "today you are forced to wear attire not of your own choosing.  They zip the\n"
	call print

	line 752
# 	print("suit to your chin just as you hear gunfire erupt behind you.\n");
	pushfp
	pusho "suit to your chin just as you hear gunfire erupt behind you.\n"
	call print

	line 753
# 	print("\"Oh no! Who left the door open?  The commies will get in.  Quick, fire the\n");
	pushfp
	pusho "\"Oh no! Who left the door open?  The commies will get in.  Quick, fire the\n"
	call print

	line 754
# 	print("laser cannon or we\'re all doomed.\"\n");
	pushfp
	pusho "laser cannon or we\'re all doomed.\"\n"
	call print

	line 755
# 	print("\"Too late you capitalist swine, the people\'s revolutionary strike force claims\n");
	pushfp
	pusho "\"Too late you capitalist swine, the people\'s revolutionary strike force claims\n"
	call print

	line 756
# 	print("this cannon for the proletariat\'s valiant struggle against oppression.  Take\n");
	pushfp
	pusho "this cannon for the proletariat\'s valiant struggle against oppression.  Take\n"
	call print

	line 757
# 	print("that, you running dog imperialist lackey.  ZAP, KAPOW\"\n");
	pushfp
	pusho "that, you running dog imperialist lackey.  ZAP, KAPOW\"\n"
	call print

	line 758
# 	print("Just when you think that things couldn\'t get worse, \"Aha, look what we have\n");
	pushfp
	pusho "Just when you think that things couldn\'t get worse, \"Aha, look what we have\n"
	call print

	line 759
# 	print("here, the Master Retailer himself with his head caught in his own cannon.  His\n");
	pushfp
	pusho "here, the Master Retailer himself with his head caught in his own cannon.  His\n"
	call print

	line 760
# 	print("death will serve as a symbol of freedom for all Alpha Complex.\n");
	pushfp
	pusho "death will serve as a symbol of freedom for all Alpha Complex.\n"
	call print

	line 761
# 	print("Fire the cannon.\"\n");
	pushfp
	pusho "Fire the cannon.\"\n"
	call print

	line 762
# 	more();
	pushfp
	call more

	line 763
# 	return new_clone(32);
	pushfp
	pushi 32
	call new_clone
	loadi
	savei
	jump _return_page35

	line 764
# }
	pushi 0
	savei
: _return_page35
	return
: _137
	line 765
# 
	line 766
# function int page36
	line 767
# {
	jump _138
: page36
	line 768
# 	string c;
# local c of type string at 0
	pusho ""
	line 769
# 	print("\"Congratulations, troubleshooter, you have successfully found the lair of the\n");
	pushfp
	pusho "\"Congratulations, troubleshooter, you have successfully found the lair of the\n"
	call print

	line 770
# 	print("Master Retailer and completed the Troubleshooter Training Course test mission,\"\n");
	pushfp
	pusho "Master Retailer and completed the Troubleshooter Training Course test mission,\"\n"
	call print

	line 771
# 	print("a muffled voice tells you through the barrel.  \"Once we dislodge your head\n");
	pushfp
	pusho "a muffled voice tells you through the barrel.  \"Once we dislodge your head\n"
	call print

	line 772
# 	print("from the barrel of the \'Ultra Shock\' plasma cannon you can begin with the\n");
	pushfp
	pusho "from the barrel of the \'Ultra Shock\' plasma cannon you can begin with the\n"
	call print

	line 773
# 	print("training seminars, the first of which will concern the 100%% accurate\n");
	pushfp
	pusho "training seminars, the first of which will concern the 100%% accurate\n"
	call print

	line 774
# 	print("identification and elimination of unregistered mutants.  If you have any\n");
	pushfp
	pusho "identification and elimination of unregistered mutants.  If you have any\n"
	call print

	line 775
# 	print("objections please voice them now.\"\n");
	pushfp
	pusho "objections please voice them now.\"\n"
	call print

	line 776
# 	print("\nSelect \'a\', \'b\' or \'c\' :\n");
	pushfp
	pusho "\nSelect \'a\', \'b\' or \'c\' :\n"
	call print

	line 777
# 	print(" a - You appreciate his courtesy and voice an objection.\n");
	pushfp
	pusho " a - You appreciate his courtesy and voice an objection.\n"
	call print

	line 778
# 	print(" b - After your head is removed from the cannon, you register as a mutant.\n");
	pushfp
	pusho " b - After your head is removed from the cannon, you register as a mutant.\n"
	call print

	line 779
# 	print(" c - After your head is removed from the cannon, you go to the unregistered\n");
	pushfp
	pusho " c - After your head is removed from the cannon, you go to the unregistered\n"
	call print

	line 780
# 	print("     mutant identification and elimination seminar.\n");
	pushfp
	pusho "     mutant identification and elimination seminar.\n"
	call print

	line 781
# 	c := get_char();
	pushfp
	call get_char
	loado
	pokeo 0

	line 782
# 	if (c == "a")
	line 783
# 		return new_clone(32);
	peeko 0
	pusho "a"
	strcmp
	itb
	not
	bne _139
	pushfp
	pushi 32
	call new_clone
	loadi
	savei
	jump _return_page36

	line 784
# 	else if (c == "b")
	jump _140
: _139
	line 785
# 		return 23;
	peeko 0
	pusho "b"
	strcmp
	itb
	not
	bne _141
	pushi 23
	savei
	jump _return_page36

	line 786
# 	else
	line 787
# 		return 37;
	jump _142
: _141
	pushi 37
	savei
	jump _return_page36

: _142
: _140
	line 788
# }
	pushi 0
	savei
: _return_page36
# retract over local var c
	popo
	return
: _138
	line 789
# 
	line 790
# function int page37
	line 791
# {
	jump _143
: page37
	line 792
# 	print("\"Come with me please, Troubleshooter,\" says the Green clearance technician\n");
	pushfp
	pusho "\"Come with me please, Troubleshooter,\" says the Green clearance technician\n"
	call print

	line 793
# 	print("after he has dislodged your head from the cannon.  \"You have been participating\n");
	pushfp
	pusho "after he has dislodged your head from the cannon.  \"You have been participating\n"
	call print

	line 794
# 	print("in the Troubleshooter Training Course since you got off the tube car in\n");
	pushfp
	pusho "in the Troubleshooter Training Course since you got off the tube car in\n"
	call print

	line 795
# 	print("GDH7-beta,\" he explains as he leads you down a corridor.  \"The entire\n");
	pushfp
	pusho "GDH7-beta,\" he explains as he leads you down a corridor.  \"The entire\n"
	call print

	line 796
# 	print("Christmas assignment was a test mission to assess your current level of\n");
	pushfp
	pusho "Christmas assignment was a test mission to assess your current level of\n"
	call print

	line 797
# 	print("training.  You didn\'t do so well.  We\'re going to start at the beginning with\n");
	pushfp
	pusho "training.  You didn\'t do so well.  We\'re going to start at the beginning with\n"
	call print

	line 798
# 	print("the other student.  Ah, here we are, the mutant identification and elimination\n");
	pushfp
	pusho "the other student.  Ah, here we are, the mutant identification and elimination\n"
	call print

	line 799
# 	print("lecture.\"  He shows you into a vast lecture hall filled with empty seats.\n");
	pushfp
	pusho "lecture.\"  He shows you into a vast lecture hall filled with empty seats.\n"
	call print

	line 800
# 	print("There is only one other student here, a Troubleshooter near the front row\n");
	pushfp
	pusho "There is only one other student here, a Troubleshooter near the front row\n"
	call print

	line 801
# 	print("playing with his Action Troubleshooter(tm) figure.  \"Find a seat and I will\n");
	pushfp
	pusho "playing with his Action Troubleshooter(tm) figure.  \"Find a seat and I will\n"
	call print

	line 802
# 	print("begin,\" says the instructor.\n");
	pushfp
	pusho "begin,\" says the instructor.\n"
	call print

	line 803
# 	more();
	pushfp
	call more

	line 804
# 	return 38;
	pushi 38
	savei
	jump _return_page37

	line 805
# }
	pushi 0
	savei
: _return_page37
	return
: _143
	line 806
# 
	line 807
# function int page38
	line 808
# {
	jump _144
: page38
	line 809
# 	print("\"I am Plato-B-PHI");
	pushfp
	pusho "\"I am Plato-B-PHI"
	call print

	line 810
# 	prints(plato_clone);
	pushfp
	peeki 14
	call prints

	line 811
# 	print(", head of mutant propaganda here at the training course.\n");
	pushfp
	pusho ", head of mutant propaganda here at the training course.\n"
	call print

	line 812
# 	print("If you have any questions about mutants please come to me.  Today I will be\n");
	pushfp
	pusho "If you have any questions about mutants please come to me.  Today I will be\n"
	call print

	line 813
# 	print("talking about mutant detection.  Detecting mutants is very easy.  One simply\n");
	pushfp
	pusho "talking about mutant detection.  Detecting mutants is very easy.  One simply\n"
	call print

	line 814
# 	print("watches for certain tell tale signs, such as the green scaly skin, the third\n");
	pushfp
	pusho "watches for certain tell tale signs, such as the green scaly skin, the third\n"
	call print

	line 815
# 	print("arm growing from the forehead, or other similar disfigurements so common with\n");
	pushfp
	pusho "arm growing from the forehead, or other similar disfigurements so common with\n"
	call print

	line 816
# 	print("their kind.  There are, however, a few rare specimens that show no outward sign\n");
	pushfp
	pusho "their kind.  There are, however, a few rare specimens that show no outward sign\n"
	call print

	line 817
# 	print("of their treason.  This has been a significant problem, so our researchers have\n");
	pushfp
	pusho "of their treason.  This has been a significant problem, so our researchers have\n"
	call print

	line 818
# 	print("been working on a solution.  I would like a volunteer to test this device,\"\n");
	pushfp
	pusho "been working on a solution.  I would like a volunteer to test this device,\"\n"
	call print

	line 819
# 	print("he says, holding up a ray gun looking thing.  \"It is a mutant detection ray.\n");
	pushfp
	pusho "he says, holding up a ray gun looking thing.  \"It is a mutant detection ray.\n"
	call print

	line 820
# 	print("This little button detects for mutants, and this big button stuns them once\n");
	pushfp
	pusho "This little button detects for mutants, and this big button stuns them once\n"
	call print

	line 821
# 	print("they are discovered.  Who would like to volunteer for a test?\"\n");
	pushfp
	pusho "they are discovered.  Who would like to volunteer for a test?\"\n"
	call print

	line 822
# 	print("The Troubleshooter down the front squirms deeper into his chair.\n");
	pushfp
	pusho "The Troubleshooter down the front squirms deeper into his chair.\n"
	call print

	line 823
# 	return choose(39,"You volunteer for the test",40,"You duck behind a chair and hope the instructor doesn\'t notice you");
	pushfp
	pushi 39
	pusho "You volunteer for the test"
	pushi 40
	pusho "You duck behind a chair and hope the instructor doesn\'t notice you"
	call choose
	loadi
	savei
	jump _return_page38

	line 824
# }
	pushi 0
	savei
: _return_page38
	return
: _144
	line 825
# 
	line 826
# function int page39
	line 827
# {
	jump _145
: page39
	line 828
# 	print("You bravely volunteer to test the mutant detection gun.  You stand up and walk\n");
	pushfp
	pusho "You bravely volunteer to test the mutant detection gun.  You stand up and walk\n"
	call print

	line 829
# 	print("down the steps to the podium, passing a very relieved Troubleshooter aint the\n");
	pushfp
	pusho "down the steps to the podium, passing a very relieved Troubleshooter aint the\n"
	call print

	line 830
# 	print("way.  When you reach the podium Plato-B-PHI hands you the mutant detection gun\n");
	pushfp
	pusho "way.  When you reach the podium Plato-B-PHI hands you the mutant detection gun\n"
	call print

	line 831
# 	print("and says, \"Here, aim the gun at that Troubleshooter and push the small button.\n");
	pushfp
	pusho "and says, \"Here, aim the gun at that Troubleshooter and push the small button.\n"
	call print

	line 832
# 	print("If you see a purple light, stun him.\"  Grasping the opportunity to prove your\n");
	pushfp
	pusho "If you see a purple light, stun him.\"  Grasping the opportunity to prove your\n"
	call print

	line 833
# 	print("worth to The Computer, you fire the mutant detection ray at the Troubleshooter.\n");
	pushfp
	pusho "worth to The Computer, you fire the mutant detection ray at the Troubleshooter.\n"
	call print

	line 834
# 	print("A brilliant purple nimbus instantly surrounds his body.  You slip your finger\n");
	pushfp
	pusho "A brilliant purple nimbus instantly surrounds his body.  You slip your finger\n"
	call print

	line 835
# 	print("to the large stun button and he falls writhing to the floor.\n");
	pushfp
	pusho "to the large stun button and he falls writhing to the floor.\n"
	call print

	line 836
# 	print("\"Good shot,\" says the instructor as you hand him the mutant detection gun,\n");
	pushfp
	pusho "\"Good shot,\" says the instructor as you hand him the mutant detection gun,\n"
	call print

	line 837
# 	print("\"I\'ll see that you get a commendation for this.  It seems you have the hang\n");
	pushfp
	pusho "\"I\'ll see that you get a commendation for this.  It seems you have the hang\n"
	call print

	line 838
# 	print("of mutant detection and elimination.  You can go on to the secret society\n");
	pushfp
	pusho "of mutant detection and elimination.  You can go on to the secret society\n"
	call print

	line 839
# 	print("infiltration class.  I\'ll see that the little mutie gets packaged for\n");
	pushfp
	pusho "infiltration class.  I\'ll see that the little mutie gets packaged for\n"
	call print

	line 840
# 	print("tomorrow\'s mutant dissection class.\"\n");
	pushfp
	pusho "tomorrow\'s mutant dissection class.\"\n"
	call print

	line 841
# 	more();
	pushfp
	call more

	line 842
# 	return 41;
	pushi 41
	savei
	jump _return_page39

	line 843
# }
	pushi 0
	savei
: _return_page39
	return
: _145
	line 844
# 
	line 845
# function int page40
	line 846
# {
	jump _146
: page40
	line 847
# 	print("You breathe a sigh of relief as Plato-B-PHI picks on the other Troubleshooter.\n");
	pushfp
	pusho "You breathe a sigh of relief as Plato-B-PHI picks on the other Troubleshooter.\n"
	call print

	line 848
# 	print("\"You down here in the front,\" says the instructor pointing at the other\n");
	pushfp
	pusho "\"You down here in the front,\" says the instructor pointing at the other\n"
	call print

	line 849
# 	print("Troubleshooter, \"you\'ll make a good volunteer.  Please step forward.\"\n");
	pushfp
	pusho "Troubleshooter, \"you\'ll make a good volunteer.  Please step forward.\"\n"
	call print

	line 850
# 	print("The Troubleshooter looks around with a \`who me?\' expression on his face, but\n");
	pushfp
	pusho "The Troubleshooter looks around with a \`who me?\' expression on his face, but\n"
	call print

	line 851
# 	print("since he is the only one visible in the audience he figures his number is up.\n");
	pushfp
	pusho "since he is the only one visible in the audience he figures his number is up.\n"
	call print

	line 852
# 	print("He walks down to the podium clutching his Action Troubleshooter(tm) doll before\n");
	pushfp
	pusho "He walks down to the podium clutching his Action Troubleshooter(tm) doll before\n"
	call print

	line 853
# 	print("him like a weapon.  \"Here,\" says Plato-B-PHI, \"take the mutant detection ray\n");
	pushfp
	pusho "him like a weapon.  \"Here,\" says Plato-B-PHI, \"take the mutant detection ray\n"
	call print

	line 854
# 	print("and point it at the audience.  If there are any mutants out there we\'ll know\n");
	pushfp
	pusho "and point it at the audience.  If there are any mutants out there we\'ll know\n"
	call print

	line 855
# 	print("soon enough.\"  Suddenly your skin prickles with static electricity as a bright\n");
	pushfp
	pusho "soon enough.\"  Suddenly your skin prickles with static electricity as a bright\n"
	call print

	line 856
# 	print("purple nimbus surrounds your body.  \"Ha Ha, got one,\" says the instructor.\n");
	pushfp
	pusho "purple nimbus surrounds your body.  \"Ha Ha, got one,\" says the instructor.\n"
	call print

	line 857
# 	print("\"Stun him before he gets away.\"\n");
	pushfp
	pusho "\"Stun him before he gets away.\"\n"
	call print

	line 858
# 	more();
	pushfp
	call more

	line 859
# 	while(1)
: _147
	line 860
# 	{
	pushi 1
	bne _148
	line 861
# 		if (dice_roll(1,100)<=30)
	line 862
# 		{
	pushfp
	pushi 1
	pushi 100
	call dice_roll
	loadi
	pushi 30
	sub
	ble _151
	pushi 1
	jump _152
: _151
	pushi 0
: _152
	bne _149
	line 863
# 			print("His shot hits you.  You feel numb all over.\n");
	pushfp
	pusho "His shot hits you.  You feel numb all over.\n"
	call print

	line 864
# 			more();
	pushfp
	call more

	line 865
# 			return 49;
	pushi 49
	savei
	jump _return_page40

	line 866
# 		}
	line 867
# 		else
	line 868
# 			print("His shot just missed.\n");
	jump _150
: _149
	pushfp
	pusho "His shot just missed.\n"
	call print

: _150
	line 869
# 
	line 870
# 		if (dice_roll(1,100)<=40)
	line 871
# 		{
	pushfp
	pushi 1
	pushi 100
	call dice_roll
	loadi
	pushi 40
	sub
	ble _155
	pushi 1
	jump _156
: _155
	pushi 0
: _156
	bne _153
	line 872
# 			print("You just blew his head off.  His lifeless hand drops the mutant detector ray.\n");
	pushfp
	pusho "You just blew his head off.  His lifeless hand drops the mutant detector ray.\n"
	call print

	line 873
# 			more();
	pushfp
	call more

	line 874
# 			return 50;
	pushi 50
	savei
	jump _return_page40

	line 875
# 		}
	line 876
# 		else
	line 877
# 			print("You burnt a hole in the podium.  He sights the mutant detector ray on you.\n");
	jump _154
: _153
	pushfp
	pusho "You burnt a hole in the podium.  He sights the mutant detector ray on you.\n"
	call print

: _154
	line 878
# 	}
	jump _147
: _148
	line 879
# }
	pushi 0
	savei
: _return_page40
	return
: _146
	line 880
# 
	line 881
# function int page41
	line 882
# {
	jump _157
: page41
	line 883
# 	print("You stumble down the hallway of the Troubleshooter Training Course looking for\n");
	pushfp
	pusho "You stumble down the hallway of the Troubleshooter Training Course looking for\n"
	call print

	line 884
# 	print("your next class.  Up ahead you see one of the instructors waving to you.  When\n");
	pushfp
	pusho "your next class.  Up ahead you see one of the instructors waving to you.  When\n"
	call print

	line 885
# 	print("you get there he shakes your hand and says, \"I am Jung-I-PSY.  Welcome to the\n");
	pushfp
	pusho "you get there he shakes your hand and says, \"I am Jung-I-PSY.  Welcome to the\n"
	call print

	line 886
# 	print("secret society infiltration seminar.  I hope you ...\"  You don\'t catch the\n");
	pushfp
	pusho "secret society infiltration seminar.  I hope you ...\"  You don\'t catch the\n"
	call print

	line 887
# 	print("rest of his greeting because you\'re paying too much attention to his handshake;\n");
	pushfp
	pusho "rest of his greeting because you\'re paying too much attention to his handshake;\n"
	call print

	line 888
# 	print("it is the strangest thing that has ever been done to your hand, sort of how it\n");
	pushfp
	pusho "it is the strangest thing that has ever been done to your hand, sort of how it\n"
	call print

	line 889
# 	print("would feel if you put a neuro whip in a high energy palm massage unit.\n");
	pushfp
	pusho "would feel if you put a neuro whip in a high energy palm massage unit.\n"
	call print

	line 890
# 	print("It doesn\'t take you int to learn what he is up to; you feel him briefly shake\n");
	pushfp
	pusho "It doesn\'t take you int to learn what he is up to; you feel him briefly shake\n"
	call print

	line 891
# 	print("your hand with the secret Illuminati handshake.\n");
	pushfp
	pusho "your hand with the secret Illuminati handshake.\n"
	call print

	line 892
# 	return choose(42,"You respond with the proper Illuminati code phrase, \"Ewige Blumenkraft\"",43,"You ignore this secret society contact");
	pushfp
	pushi 42
	pusho "You respond with the proper Illuminati code phrase, \"Ewige Blumenkraft\""
	pushi 43
	pusho "You ignore this secret society contact"
	call choose
	loadi
	savei
	jump _return_page41

	line 893
# }
	pushi 0
	savei
: _return_page41
	return
: _157
	line 894
# 
	line 895
# function int page42
	line 896
# {
	jump _158
: page42
	line 897
# 	print("\"Aha, so you are a member of the elitist Illuminati secret society,\" he says\n");
	pushfp
	pusho "\"Aha, so you are a member of the elitist Illuminati secret society,\" he says\n"
	call print

	line 898
# 	print("loudly, \"that is most interesting.\"  He turns to the large class already\n");
	pushfp
	pusho "loudly, \"that is most interesting.\"  He turns to the large class already\n"
	call print

	line 899
# 	print("seated in the auditorium and says, \"You see, class, by simply using the correct\n");
	pushfp
	pusho "seated in the auditorium and says, \"You see, class, by simply using the correct\n"
	call print

	line 900
# 	print("hand shake you can identify the member of any secret society.  Please keep your\n");
	pushfp
	pusho "hand shake you can identify the member of any secret society.  Please keep your\n"
	call print

	line 901
# 	print("weapons trained on him while I call a guard.\n");
	pushfp
	pusho "weapons trained on him while I call a guard.\n"
	call print

	line 902
# 	return choose(51,"You run for it",52,"You wait for the guard");
	pushfp
	pushi 51
	pusho "You run for it"
	pushi 52
	pusho "You wait for the guard"
	call choose
	loadi
	savei
	jump _return_page42

	line 903
# }
	pushi 0
	savei
: _return_page42
	return
: _158
	line 904
# 
	line 905
# function int page43
	line 906
# {
	jump _159
: page43
	line 907
# 	print("You sit through a int lecture on how to recognise and infiltrate secret\n");
	pushfp
	pusho "You sit through a int lecture on how to recognise and infiltrate secret\n"
	call print

	line 908
# 	print("societies, with an emphasis on mimicking secret handshakes.  The basic theory,\n");
	pushfp
	pusho "societies, with an emphasis on mimicking secret handshakes.  The basic theory,\n"
	call print

	line 909
# 	print("which you realise to be sound from your Iluminati training, is that with the\n");
	pushfp
	pusho "which you realise to be sound from your Iluminati training, is that with the\n"
	call print

	line 910
# 	print("proper handshake you can pass unnoticed in any secret society gathering.\n");
	pushfp
	pusho "proper handshake you can pass unnoticed in any secret society gathering.\n"
	call print

	line 911
# 	print("What\'s more, the proper handshake will open doors faster than an \'ultra shock\'\n");
	pushfp
	pusho "What\'s more, the proper handshake will open doors faster than an \'ultra shock\'\n"
	call print

	line 912
# 	print("plasma cannon.  You are certain that with the information you learn here you\n");
	pushfp
	pusho "plasma cannon.  You are certain that with the information you learn here you\n"
	call print

	line 913
# 	print("will easily be promoted to the next level of your Illuminati secret society.\n");
	pushfp
	pusho "will easily be promoted to the next level of your Illuminati secret society.\n"
	call print

	line 914
# 	print("The lecture continues for three hours, during which you have the opportunity\n");
	pushfp
	pusho "The lecture continues for three hours, during which you have the opportunity\n"
	call print

	line 915
# 	print("to practice many different handshakes.  Afterwards everyone is directed to\n");
	pushfp
	pusho "to practice many different handshakes.  Afterwards everyone is directed to\n"
	call print

	line 916
# 	print("attend the graduation ceremony.  Before you must go you have a little time to\n");
	pushfp
	pusho "attend the graduation ceremony.  Before you must go you have a little time to\n"
	call print

	line 917
# 	print("talk to The Computer about, you know, certain topics.\n");
	pushfp
	pusho "talk to The Computer about, you know, certain topics.\n"
	call print

	line 918
# 	return choose(44,"You go looking for a computer terminal",55,"You go to the graduation ceremony immediately");
	pushfp
	pushi 44
	pusho "You go looking for a computer terminal"
	pushi 55
	pusho "You go to the graduation ceremony immediately"
	call choose
	loadi
	savei
	jump _return_page43

	line 919
# }
	pushi 0
	savei
: _return_page43
	return
: _159
	line 920
# 
	line 921
# function int page44
	line 922
# {
	jump _160
: page44
	line 923
# 	string c;
# local c of type string at 0
	pusho ""
	line 924
# 	print("You walk down to a semi-secluded part of the training course complex and\n");
	pushfp
	pusho "You walk down to a semi-secluded part of the training course complex and\n"
	call print

	line 925
# 	print("activate a computer terminal.  \"AT YOUR SERVICE\" reads the computer screen.\n");
	pushfp
	pusho "activate a computer terminal.  \"AT YOUR SERVICE\" reads the computer screen.\n"
	call print

	line 926
# 	if (read_letter==0)
	line 927
# 		return choose(23,"You register yourself as a mutant",55,"You change your mind and go to the graduation ceremony");
	peeki 13
	pushi 0
	sub
	itb
	not
	bne _161
	pushfp
	pushi 23
	pusho "You register yourself as a mutant"
	pushi 55
	pusho "You change your mind and go to the graduation ceremony"
	call choose
	loadi
	savei
	jump _return_page44

	line 928
# 	print("\nSelect \'a\', \'b\' or \'c\' :\n");
: _161
: _162
	pushfp
	pusho "\nSelect \'a\', \'b\' or \'c\' :\n"
	call print

	line 929
# 	print(" a - You register yourself as a mutant.\n");
	pushfp
	pusho " a - You register yourself as a mutant.\n"
	call print

	line 930
# 	print(" b - You want to chat about the commies.\n");
	pushfp
	pusho " b - You want to chat about the commies.\n"
	call print

	line 931
# 	print(" c - You change your mind and go to the graduation ceremony.\n");
	pushfp
	pusho " c - You change your mind and go to the graduation ceremony.\n"
	call print

	line 932
# 	c := get_char();
	pushfp
	call get_char
	loado
	pokeo 0

	line 933
# 	if (c == "a")
	line 934
# 		return 23;
	peeko 0
	pusho "a"
	strcmp
	itb
	not
	bne _163
	pushi 23
	savei
	jump _return_page44

	line 935
# 	else if (c == "b")
	jump _164
: _163
	line 936
# 		return 46;
	peeko 0
	pusho "b"
	strcmp
	itb
	not
	bne _165
	pushi 46
	savei
	jump _return_page44

	line 937
# 	else
	line 938
# 		return 55;
	jump _166
: _165
	pushi 55
	savei
	jump _return_page44

: _166
: _164
	line 939
# }
	pushi 0
	savei
: _return_page44
# retract over local var c
	popo
	return
: _160
	line 940
# 
	line 941
# function int page45
	line 942
# {
	jump _167
: page45
	line 943
# 	print("\"Hrank Hrank,\" snorts the alarm in your living quarters.  Something is up.\n");
	pushfp
	pusho "\"Hrank Hrank,\" snorts the alarm in your living quarters.  Something is up.\n"
	call print

	line 944
# 	print("You look at the monitor above the bathroom mirror and see the message you have\n");
	pushfp
	pusho "You look at the monitor above the bathroom mirror and see the message you have\n"
	call print

	line 945
# 	print("been waiting for all these years.  \"ATTENTION TROUBLESHOOTER, YOU ARE BEING\n");
	pushfp
	pusho "been waiting for all these years.  \"ATTENTION TROUBLESHOOTER, YOU ARE BEING\n"
	call print

	line 946
# 	print("ACTIVATED. PLEASE REPORT IMMEDIATELY TO MISSION ASSIGNMENT ROOM A17/GAMMA/LB22.\n");
	pushfp
	pusho "ACTIVATED. PLEASE REPORT IMMEDIATELY TO MISSION ASSIGNMENT ROOM A17/GAMMA/LB22.\n"
	call print

	line 947
# 	print("THANK YOU. THE COMPUTER IS YOUR FRIEND.\"  When you arrive at mission\n");
	pushfp
	pusho "THANK YOU. THE COMPUTER IS YOUR FRIEND.\"  When you arrive at mission\n"
	call print

	line 948
# 	print("assignment room A17-gamma/LB22 you are given your previous clone\'s\n");
	pushfp
	pusho "assignment room A17-gamma/LB22 you are given your previous clone\'s\n"
	call print

	line 949
# 	print("remaining possessions and notebook.  You puzzle through your predecessor\'s\n");
	pushfp
	pusho "remaining possessions and notebook.  You puzzle through your predecessor\'s\n"
	call print

	line 950
# 	print("cryptic notes, managing to decipher enough to lead you to the tube station and\n");
	pushfp
	pusho "cryptic notes, managing to decipher enough to lead you to the tube station and\n"
	call print

	line 951
# 	print("the tube car to GDH7-beta.\n");
	pushfp
	pusho "the tube car to GDH7-beta.\n"
	call print

	line 952
# 	more();
	pushfp
	call more

	line 953
# 	return 10;
	pushi 10
	savei
	jump _return_page45

	line 954
# }
	pushi 0
	savei
: _return_page45
	return
: _167
	line 955
# 
	line 956
# function int page46
	line 957
# {
	jump _168
: page46
	line 958
# 	print("\"Why do you ask about the communists, Troubleshooter?  It is not in the\n");
	pushfp
	pusho "\"Why do you ask about the communists, Troubleshooter?  It is not in the\n"
	call print

	line 959
# 	print("interest of your continued survival to be asking about such topics,\" says\n");
	pushfp
	pusho "interest of your continued survival to be asking about such topics,\" says\n"
	call print

	line 960
# 	print("The Computer.\n");
	pushfp
	pusho "The Computer.\n"
	call print

	line 961
# 	return choose(53,"You insist on talking about the communists",54,"You change the subject");
	pushfp
	pushi 53
	pusho "You insist on talking about the communists"
	pushi 54
	pusho "You change the subject"
	call choose
	loadi
	savei
	jump _return_page46

	line 962
# }
	pushi 0
	savei
: _return_page46
	return
: _168
	line 963
# 
	line 964
# function int page47
	line 965
# {
	jump _169
: page47
	line 966
# 	print("The Computer orders the entire Vulture squadron to terminate the Troubleshooter\n");
	pushfp
	pusho "The Computer orders the entire Vulture squadron to terminate the Troubleshooter\n"
	call print

	line 967
# 	print("Training Course.  Unfortunately you too are terminated for possessing\n");
	pushfp
	pusho "Training Course.  Unfortunately you too are terminated for possessing\n"
	call print

	line 968
# 	print("classified information.\n\n");
	pushfp
	pusho "classified information.\n\n"
	call print

	line 969
# 	print("Don\'t act so innocent, we both know that you are an Illuminatus which is in\n");
	pushfp
	pusho "Don\'t act so innocent, we both know that you are an Illuminatus which is in\n"
	call print

	line 970
# 	print("itself an act of treason.\n\n");
	pushfp
	pusho "itself an act of treason.\n\n"
	call print

	line 971
# 	print("Don\'t look to me for sympathy.\n\n");
	pushfp
	pusho "Don\'t look to me for sympathy.\n\n"
	call print

	line 972
# 	print("			THE END\n");
	pushfp
	pusho "			THE END\n"
	call print

	line 973
# 	return 0;
	pushi 0
	savei
	jump _return_page47

	line 974
# }
	pushi 0
	savei
: _return_page47
	return
: _169
	line 975
# 
	line 976
# function int page48
	line 977
# {
	jump _170
: page48
	line 978
# 	print("The tubecar shoots forward as you enter, slamming you back into a pile of\n");
	pushfp
	pusho "The tubecar shoots forward as you enter, slamming you back into a pile of\n"
	call print

	line 979
# 	print("garbage.  The front end rotates upward and you, the garbage and the garbage\n");
	pushfp
	pusho "garbage.  The front end rotates upward and you, the garbage and the garbage\n"
	call print

	line 980
# 	print("disposal car shoot straight up out of Alpha Complex.  One of the last things\n");
	pushfp
	pusho "disposal car shoot straight up out of Alpha Complex.  One of the last things\n"
	call print

	line 981
# 	print("you see is a small blue sphere slowly dwindling behind you.  After you fail to\n");
	pushfp
	pusho "you see is a small blue sphere slowly dwindling behind you.  After you fail to\n"
	call print

	line 982
# 	print("report in, you will be assumed dead.\n");
	pushfp
	pusho "report in, you will be assumed dead.\n"
	call print

	line 983
# 	more();
	pushfp
	call more

	line 984
# 	return new_clone(45);
	pushfp
	pushi 45
	call new_clone
	loadi
	savei
	jump _return_page48

	line 985
# }
	pushi 0
	savei
: _return_page48
	return
: _170
	line 986
# 
	line 987
# function int page49
	line 988
# {
	jump _171
: page49
	line 989
# 	print("The instructor drags your inert body into a specimen detainment cage.\n");
	pushfp
	pusho "The instructor drags your inert body into a specimen detainment cage.\n"
	call print

	line 990
# 	print("\"He\'ll make a good subject for tomorrow\'s mutant dissection class,\" you hear.\n");
	pushfp
	pusho "\"He\'ll make a good subject for tomorrow\'s mutant dissection class,\" you hear.\n"
	call print

	line 991
# 	more();
	pushfp
	call more

	line 992
# 	return new_clone(32);
	pushfp
	pushi 32
	call new_clone
	loadi
	savei
	jump _return_page49

	line 993
# }
	pushi 0
	savei
: _return_page49
	return
: _171
	line 994
# 
	line 995
# function int page50
	line 996
# {
	jump _172
: page50
	line 997
# 	print("You put down the other Troubleshooter, and then wisely decide to drill a few\n");
	pushfp
	pusho "You put down the other Troubleshooter, and then wisely decide to drill a few\n"
	call print

	line 998
# 	print("holes in the instructor as well; the only good witness is a dead witness.\n");
	pushfp
	pusho "holes in the instructor as well; the only good witness is a dead witness.\n"
	call print

	line 999
# 	print("You continue with the training course.\n");
	pushfp
	pusho "You continue with the training course.\n"
	call print

	line 1000
# 	plato_clone := plato_clone + 1;
	peeki 14
	pushi 1
	add
	pokei 14

	line 1001
# 	more();
	pushfp
	call more

	line 1002
# 	return 41;
	pushi 41
	savei
	jump _return_page50

	line 1003
# }
	pushi 0
	savei
: _return_page50
	return
: _172
	line 1004
# 
	line 1005
# function int page51
	line 1006
# {
	jump _173
: page51
	line 1007
# 	print("You run for it, but you don\'t run far.  Three hundred strange and exotic\n");
	pushfp
	pusho "You run for it, but you don\'t run far.  Three hundred strange and exotic\n"
	call print

	line 1008
# 	print("weapons turn you into a freeze dried cloud of soot.\n");
	pushfp
	pusho "weapons turn you into a freeze dried cloud of soot.\n"
	call print

	line 1009
# 	more();
	pushfp
	call more

	line 1010
# 	return new_clone(32);
	pushfp
	pushi 32
	call new_clone
	loadi
	savei
	jump _return_page51

	line 1011
# }
	pushi 0
	savei
: _return_page51
	return
: _173
	line 1012
# 
	line 1013
# function int page52
	line 1014
# {
	jump _174
: page52
	line 1015
# 	print("You wisely wait until the instructor returns with a Blue Internal Security\n");
	pushfp
	pusho "You wisely wait until the instructor returns with a Blue Internal Security\n"
	call print

	line 1016
# 	print("guard.  The guard leads you to an Internal Security self incrimination station.\n");
	pushfp
	pusho "guard.  The guard leads you to an Internal Security self incrimination station.\n"
	call print

	line 1017
# 	more();
	pushfp
	call more

	line 1018
# 	return 2;
	pushi 2
	savei
	jump _return_page52

	line 1019
# }
	pushi 0
	savei
: _return_page52
	return
: _174
	line 1020
# 
	line 1021
# function int page53
	line 1022
# {
	jump _175
: page53
	line 1023
# 	print("You tell The Computer about:\n");
	pushfp
	pusho "You tell The Computer about:\n"
	call print

	line 1024
# 	return choose(47,"The commies who have infiltrated the Troubleshooter Training Course\n     and the impending People\'s Revolution",54,"Something less dangerous");
	pushfp
	pushi 47
	pusho "The commies who have infiltrated the Troubleshooter Training Course\n     and the impending People\'s Revolution"
	pushi 54
	pusho "Something less dangerous"
	call choose
	loadi
	savei
	jump _return_page53

	line 1025
# }
	pushi 0
	savei
: _return_page53
	return
: _175
	line 1026
# 
	line 1027
# function int page54
	line 1028
# {
	jump _176
: page54
	line 1029
# 	print("\"Do not try to change the subject, Troubleshooter,\" says The Computer.\n");
	pushfp
	pusho "\"Do not try to change the subject, Troubleshooter,\" says The Computer.\n"
	call print

	line 1030
# 	print("\"It is a serious crime to ask about the communists.  You will be terminated\n");
	pushfp
	pusho "\"It is a serious crime to ask about the communists.  You will be terminated\n"
	call print

	line 1031
# 	print("immediately.  Thank you for your inquiry.  The Computer is your friend.\"\n");
	pushfp
	pusho "immediately.  Thank you for your inquiry.  The Computer is your friend.\"\n"
	call print

	line 1032
# 	print("Steel bars drop to your left and right, trapping you here in the hallway.\n");
	pushfp
	pusho "Steel bars drop to your left and right, trapping you here in the hallway.\n"
	call print

	line 1033
# 	print("A spotlight beams from the computer console to brilliantly iiluminate you while\n");
	pushfp
	pusho "A spotlight beams from the computer console to brilliantly iiluminate you while\n"
	call print

	line 1034
# 	print("the speaker above your head rapidly repeats \"Traitor, Traitor, Traitor.\"\n");
	pushfp
	pusho "the speaker above your head rapidly repeats \"Traitor, Traitor, Traitor.\"\n"
	call print

	line 1035
# 	print("It doesn\'t take int for a few guards to notice your predicament and come to\n");
	pushfp
	pusho "It doesn\'t take int for a few guards to notice your predicament and come to\n"
	call print

	line 1036
# 	print("finish you off.\n");
	pushfp
	pusho "finish you off.\n"
	call print

	line 1037
# 	more();
	pushfp
	call more

	line 1038
# 	if (blast_door==0) return new_clone(45);
	peeki 15
	pushi 0
	sub
	itb
	not
	bne _177
	pushfp
	pushi 45
	call new_clone
	loadi
	savei
	jump _return_page54

	line 1039
# 	else		   return new_clone(32);
	jump _178
: _177
	pushfp
	pushi 32
	call new_clone
	loadi
	savei
	jump _return_page54

: _178
	line 1040
# }
	pushi 0
	savei
: _return_page54
	return
: _176
	line 1041
# 
	line 1042
# function int page55
	line 1043
# {
	jump _179
: page55
	line 1044
# 	print("You and 300 other excited graduates are marched  from the lecture hall and into\n");
	pushfp
	pusho "You and 300 other excited graduates are marched  from the lecture hall and into\n"
	call print

	line 1045
# 	print("a large auditorium for the graduation exercise.  The auditorium is\n");
	pushfp
	pusho "a large auditorium for the graduation exercise.  The auditorium is\n"
	call print

	line 1046
# 	print("extravagantly decorated in the colours of the graduating class.  Great red and\n");
	pushfp
	pusho "extravagantly decorated in the colours of the graduating class.  Great red and\n"
	call print

	line 1047
# 	print("green plasti-paper ribbons drape from the walls, while a huge sign reading\n");
	pushfp
	pusho "green plasti-paper ribbons drape from the walls, while a huge sign reading\n"
	call print

	line 1048
# 	print("\"Congratulations class of GDH7-beta-203.44/A\" hangs from the raised stage down\n");
	pushfp
	pusho "\"Congratulations class of GDH7-beta-203.44/A\" hangs from the raised stage down\n"
	call print

	line 1049
# 	print("front.  Once everyone finds a seat the ceremony begins.  Jung-I-PSY is the\n");
	pushfp
	pusho "front.  Once everyone finds a seat the ceremony begins.  Jung-I-PSY is the\n"
	call print

	line 1050
# 	print("first to speak, \"Congratulations students, you have successfully survived the\n");
	pushfp
	pusho "first to speak, \"Congratulations students, you have successfully survived the\n"
	call print

	line 1051
# 	print("Troubleshooter Training Course.  It always brings me great pride to address\n");
	pushfp
	pusho "Troubleshooter Training Course.  It always brings me great pride to address\n"
	call print

	line 1052
# 	print("the graduating class, for I know, as I am sure you do too, that you are now\n");
	pushfp
	pusho "the graduating class, for I know, as I am sure you do too, that you are now\n"
	call print

	line 1053
# 	print("qualified for the most perilous missions The Computer may select for you.  The\n");
	pushfp
	pusho "qualified for the most perilous missions The Computer may select for you.  The\n"
	call print

	line 1054
# 	print("thanks is not owed to us of the teaching staff, but to all of you, who have\n");
	pushfp
	pusho "thanks is not owed to us of the teaching staff, but to all of you, who have\n"
	call print

	line 1055
# 	print("persevered and graduated.  Good luck and die trying.\"  Then the instructor\n");
	pushfp
	pusho "persevered and graduated.  Good luck and die trying.\"  Then the instructor\n"
	call print

	line 1056
# 	print("begins reading the names of the students who one by one walk to the front of\n");
	pushfp
	pusho "begins reading the names of the students who one by one walk to the front of\n"
	call print

	line 1057
# 	print("the auditorium and receive their diplomas.  Soon it is your turn,\n");
	pushfp
	pusho "the auditorium and receive their diplomas.  Soon it is your turn,\n"
	call print

	line 1058
# 	print("\"Philo-R-DMD, graduating a master of mutant identification and secret society\n");
	pushfp
	pusho "\"Philo-R-DMD, graduating a master of mutant identification and secret society\n"
	call print

	line 1059
# 	print("infiltration.\"  You walk up and receive your diploma from Plato-B-PHI");
	pushfp
	pusho "infiltration.\"  You walk up and receive your diploma from Plato-B-PHI"
	call print

	line 1060
# 	prints(plato_clone);
	pushfp
	peeki 14
	call prints

	line 1061
# 	print(", then\n");
	pushfp
	pusho ", then\n"
	call print

	line 1062
# 	print("return to your seat.  There is another speech after the diplomas are handed\n");
	pushfp
	pusho "return to your seat.  There is another speech after the diplomas are handed\n"
	call print

	line 1063
# 	print("out, but it is cut short by by rapid fire laser bursts from the high spirited\n");
	pushfp
	pusho "out, but it is cut short by by rapid fire laser bursts from the high spirited\n"
	call print

	line 1064
# 	print("graduating class.  You are free to return to your barracks to wait, trained\n");
	pushfp
	pusho "graduating class.  You are free to return to your barracks to wait, trained\n"
	call print

	line 1065
# 	print("and fully qualified, for your next mission.  You also get that cherished\n");
	pushfp
	pusho "and fully qualified, for your next mission.  You also get that cherished\n"
	call print

	line 1066
# 	print("promotion from the Illuminati secret society.  In a week you receive a\n");
	pushfp
	pusho "promotion from the Illuminati secret society.  In a week you receive a\n"
	call print

	line 1067
# 	print("detailed Training Course bill totalling 1,523 credits.\n");
	pushfp
	pusho "detailed Training Course bill totalling 1,523 credits.\n"
	call print

	line 1068
# 	print("			THE END\n");
	pushfp
	pusho "			THE END\n"
	call print

	line 1069
# 	return 0;
	pushi 0
	savei
	jump _return_page55

	line 1070
# }
	pushi 0
	savei
: _return_page55
	return
: _179
	line 1071
# 
	line 1072
# function int page56
	line 1073
# {
	jump _180
: page56
	line 1074
# 	print("That familiar strange feeling of deja\'vu envelops you again.  It is hard to\n");
	pushfp
	pusho "That familiar strange feeling of deja\'vu envelops you again.  It is hard to\n"
	call print

	line 1075
# 	print("say, but whatever is on the other side of the door does not seem to be intended\n");
	pushfp
	pusho "say, but whatever is on the other side of the door does not seem to be intended\n"
	call print

	line 1076
# 	print("for you.\n");
	pushfp
	pusho "for you.\n"
	call print

	line 1077
# 	return choose(33,"You open the door and step through",22,"You go looking for more information");
	pushfp
	pushi 33
	pusho "You open the door and step through"
	pushi 22
	pusho "You go looking for more information"
	call choose
	loadi
	savei
	jump _return_page56

	line 1078
# }
	pushi 0
	savei
: _return_page56
	return
: _180
	line 1079
# 
	line 1080
# function int page57
	line 1081
# {
	jump _181
: page57
	line 1082
# 	print("In the centre of the room is a table and a single chair.  There is an Orange\n");
	pushfp
	pusho "In the centre of the room is a table and a single chair.  There is an Orange\n"
	call print

	line 1083
# 	print("folder on the table top, but you can\'t make out the lettering on it.\n");
	pushfp
	pusho "folder on the table top, but you can\'t make out the lettering on it.\n"
	call print

	line 1084
# 	return choose(11,"You sit down and read the folder",12,"You leave the room");
	pushfp
	pushi 11
	pusho "You sit down and read the folder"
	pushi 12
	pusho "You leave the room"
	call choose
	loadi
	savei
	jump _return_page57

	line 1085
# }
	pushi 0
	savei
: _return_page57
	return
: _181
	line 1086
# 
	line 1087
# function int next_page
	line 1088
# 	int this_page;
# argument this_page of type int at 0
	line 1089
# {
	jump _182
: next_page
	line 1090
# 	print("\n");
	pushfp
	pusho "\n"
	call print

	line 1091
# 	if (this_page == 0)		return 0;
	peeki 0
	pushi 0
	sub
	itb
	not
	bne _183
	pushi 0
	savei
	jump _return_next_page

	line 1092
# 	else if (this_page == 1)	return page1();
	jump _184
: _183
	peeki 0
	pushi 1
	sub
	itb
	not
	bne _185
	pushfp
	call page1
	loadi
	savei
	jump _return_next_page

	line 1093
# 	else if (this_page == 2)	return page2();
	jump _186
: _185
	peeki 0
	pushi 2
	sub
	itb
	not
	bne _187
	pushfp
	call page2
	loadi
	savei
	jump _return_next_page

	line 1094
# 	else if (this_page == 3)	return page3();
	jump _188
: _187
	peeki 0
	pushi 3
	sub
	itb
	not
	bne _189
	pushfp
	call page3
	loadi
	savei
	jump _return_next_page

	line 1095
# 	else if (this_page == 4)	return page4();
	jump _190
: _189
	peeki 0
	pushi 4
	sub
	itb
	not
	bne _191
	pushfp
	call page4
	loadi
	savei
	jump _return_next_page

	line 1096
# 	else if (this_page == 5)	return page5();
	jump _192
: _191
	peeki 0
	pushi 5
	sub
	itb
	not
	bne _193
	pushfp
	call page5
	loadi
	savei
	jump _return_next_page

	line 1097
# 	else if (this_page == 6)	return page6();
	jump _194
: _193
	peeki 0
	pushi 6
	sub
	itb
	not
	bne _195
	pushfp
	call page6
	loadi
	savei
	jump _return_next_page

	line 1098
# 	else if (this_page == 7)	return page7();
	jump _196
: _195
	peeki 0
	pushi 7
	sub
	itb
	not
	bne _197
	pushfp
	call page7
	loadi
	savei
	jump _return_next_page

	line 1099
# 	else if (this_page == 8)	return page8();
	jump _198
: _197
	peeki 0
	pushi 8
	sub
	itb
	not
	bne _199
	pushfp
	call page8
	loadi
	savei
	jump _return_next_page

	line 1100
# 	else if (this_page == 9)	return page9();
	jump _200
: _199
	peeki 0
	pushi 9
	sub
	itb
	not
	bne _201
	pushfp
	call page9
	loadi
	savei
	jump _return_next_page

	line 1101
# 	else if (this_page == 10)	return page10();
	jump _202
: _201
	peeki 0
	pushi 10
	sub
	itb
	not
	bne _203
	pushfp
	call page10
	loadi
	savei
	jump _return_next_page

	line 1102
# 	else if (this_page == 11)	return page11();
	jump _204
: _203
	peeki 0
	pushi 11
	sub
	itb
	not
	bne _205
	pushfp
	call page11
	loadi
	savei
	jump _return_next_page

	line 1103
# 	else if (this_page == 12)	return page12();
	jump _206
: _205
	peeki 0
	pushi 12
	sub
	itb
	not
	bne _207
	pushfp
	call page12
	loadi
	savei
	jump _return_next_page

	line 1104
# 	else if (this_page == 13)	return page13();
	jump _208
: _207
	peeki 0
	pushi 13
	sub
	itb
	not
	bne _209
	pushfp
	call page13
	loadi
	savei
	jump _return_next_page

	line 1105
# 	else if (this_page == 14)	return page14();
	jump _210
: _209
	peeki 0
	pushi 14
	sub
	itb
	not
	bne _211
	pushfp
	call page14
	loadi
	savei
	jump _return_next_page

	line 1106
# 	else if (this_page == 15)	return page15();
	jump _212
: _211
	peeki 0
	pushi 15
	sub
	itb
	not
	bne _213
	pushfp
	call page15
	loadi
	savei
	jump _return_next_page

	line 1107
# 	else if (this_page == 16)	return page16();
	jump _214
: _213
	peeki 0
	pushi 16
	sub
	itb
	not
	bne _215
	pushfp
	call page16
	loadi
	savei
	jump _return_next_page

	line 1108
# 	else if (this_page == 17)	return page17();
	jump _216
: _215
	peeki 0
	pushi 17
	sub
	itb
	not
	bne _217
	pushfp
	call page17
	loadi
	savei
	jump _return_next_page

	line 1109
# 	else if (this_page == 18)	return page18();
	jump _218
: _217
	peeki 0
	pushi 18
	sub
	itb
	not
	bne _219
	pushfp
	call page18
	loadi
	savei
	jump _return_next_page

	line 1110
# 	else if (this_page == 19)	return page19();
	jump _220
: _219
	peeki 0
	pushi 19
	sub
	itb
	not
	bne _221
	pushfp
	call page19
	loadi
	savei
	jump _return_next_page

	line 1111
# 	else if (this_page == 20)	return page20();
	jump _222
: _221
	peeki 0
	pushi 20
	sub
	itb
	not
	bne _223
	pushfp
	call page20
	loadi
	savei
	jump _return_next_page

	line 1112
# 	else if (this_page == 21)	return page21();
	jump _224
: _223
	peeki 0
	pushi 21
	sub
	itb
	not
	bne _225
	pushfp
	call page21
	loadi
	savei
	jump _return_next_page

	line 1113
# 	else if (this_page == 22)	return page22();
	jump _226
: _225
	peeki 0
	pushi 22
	sub
	itb
	not
	bne _227
	pushfp
	call page22
	loadi
	savei
	jump _return_next_page

	line 1114
# 	else if (this_page == 23)	return page23();
	jump _228
: _227
	peeki 0
	pushi 23
	sub
	itb
	not
	bne _229
	pushfp
	call page23
	loadi
	savei
	jump _return_next_page

	line 1115
# 	else if (this_page == 24)	return page24();
	jump _230
: _229
	peeki 0
	pushi 24
	sub
	itb
	not
	bne _231
	pushfp
	call page24
	loadi
	savei
	jump _return_next_page

	line 1116
# 	else if (this_page == 25)	return page25();
	jump _232
: _231
	peeki 0
	pushi 25
	sub
	itb
	not
	bne _233
	pushfp
	call page25
	loadi
	savei
	jump _return_next_page

	line 1117
# 	else if (this_page == 26)	return page26();
	jump _234
: _233
	peeki 0
	pushi 26
	sub
	itb
	not
	bne _235
	pushfp
	call page26
	loadi
	savei
	jump _return_next_page

	line 1118
# 	else if (this_page == 27)	return page27();
	jump _236
: _235
	peeki 0
	pushi 27
	sub
	itb
	not
	bne _237
	pushfp
	call page27
	loadi
	savei
	jump _return_next_page

	line 1119
# 	else if (this_page == 28)	return page28();
	jump _238
: _237
	peeki 0
	pushi 28
	sub
	itb
	not
	bne _239
	pushfp
	call page28
	loadi
	savei
	jump _return_next_page

	line 1120
# 	else if (this_page == 29)	return page29();
	jump _240
: _239
	peeki 0
	pushi 29
	sub
	itb
	not
	bne _241
	pushfp
	call page29
	loadi
	savei
	jump _return_next_page

	line 1121
# 	else if (this_page == 30)	return page30();
	jump _242
: _241
	peeki 0
	pushi 30
	sub
	itb
	not
	bne _243
	pushfp
	call page30
	loadi
	savei
	jump _return_next_page

	line 1122
# 	else if (this_page == 31)	return page31();
	jump _244
: _243
	peeki 0
	pushi 31
	sub
	itb
	not
	bne _245
	pushfp
	call page31
	loadi
	savei
	jump _return_next_page

	line 1123
# 	else if (this_page == 32)	return page32();
	jump _246
: _245
	peeki 0
	pushi 32
	sub
	itb
	not
	bne _247
	pushfp
	call page32
	loadi
	savei
	jump _return_next_page

	line 1124
# 	else if (this_page == 33)	return page33();
	jump _248
: _247
	peeki 0
	pushi 33
	sub
	itb
	not
	bne _249
	pushfp
	call page33
	loadi
	savei
	jump _return_next_page

	line 1125
# 	else if (this_page == 34)	return page34();
	jump _250
: _249
	peeki 0
	pushi 34
	sub
	itb
	not
	bne _251
	pushfp
	call page34
	loadi
	savei
	jump _return_next_page

	line 1126
# 	else if (this_page == 35)	return page35();
	jump _252
: _251
	peeki 0
	pushi 35
	sub
	itb
	not
	bne _253
	pushfp
	call page35
	loadi
	savei
	jump _return_next_page

	line 1127
# 	else if (this_page == 36)	return page36();
	jump _254
: _253
	peeki 0
	pushi 36
	sub
	itb
	not
	bne _255
	pushfp
	call page36
	loadi
	savei
	jump _return_next_page

	line 1128
# 	else if (this_page == 37)	return page37();
	jump _256
: _255
	peeki 0
	pushi 37
	sub
	itb
	not
	bne _257
	pushfp
	call page37
	loadi
	savei
	jump _return_next_page

	line 1129
# 	else if (this_page == 38)	return page38();
	jump _258
: _257
	peeki 0
	pushi 38
	sub
	itb
	not
	bne _259
	pushfp
	call page38
	loadi
	savei
	jump _return_next_page

	line 1130
# 	else if (this_page == 39)	return page39();
	jump _260
: _259
	peeki 0
	pushi 39
	sub
	itb
	not
	bne _261
	pushfp
	call page39
	loadi
	savei
	jump _return_next_page

	line 1131
# 	else if (this_page == 40)	return page40();
	jump _262
: _261
	peeki 0
	pushi 40
	sub
	itb
	not
	bne _263
	pushfp
	call page40
	loadi
	savei
	jump _return_next_page

	line 1132
# 	else if (this_page == 41)	return page41();
	jump _264
: _263
	peeki 0
	pushi 41
	sub
	itb
	not
	bne _265
	pushfp
	call page41
	loadi
	savei
	jump _return_next_page

	line 1133
# 	else if (this_page == 42)	return page42();
	jump _266
: _265
	peeki 0
	pushi 42
	sub
	itb
	not
	bne _267
	pushfp
	call page42
	loadi
	savei
	jump _return_next_page

	line 1134
# 	else if (this_page == 43)	return page43();
	jump _268
: _267
	peeki 0
	pushi 43
	sub
	itb
	not
	bne _269
	pushfp
	call page43
	loadi
	savei
	jump _return_next_page

	line 1135
# 	else if (this_page == 44)	return page44();
	jump _270
: _269
	peeki 0
	pushi 44
	sub
	itb
	not
	bne _271
	pushfp
	call page44
	loadi
	savei
	jump _return_next_page

	line 1136
# 	else if (this_page == 45)	return page45();
	jump _272
: _271
	peeki 0
	pushi 45
	sub
	itb
	not
	bne _273
	pushfp
	call page45
	loadi
	savei
	jump _return_next_page

	line 1137
# 	else if (this_page == 46)	return page46();
	jump _274
: _273
	peeki 0
	pushi 46
	sub
	itb
	not
	bne _275
	pushfp
	call page46
	loadi
	savei
	jump _return_next_page

	line 1138
# 	else if (this_page == 47)	return page47();
	jump _276
: _275
	peeki 0
	pushi 47
	sub
	itb
	not
	bne _277
	pushfp
	call page47
	loadi
	savei
	jump _return_next_page

	line 1139
# 	else if (this_page == 48)	return page48();
	jump _278
: _277
	peeki 0
	pushi 48
	sub
	itb
	not
	bne _279
	pushfp
	call page48
	loadi
	savei
	jump _return_next_page

	line 1140
# 	else if (this_page == 49)	return page49();
	jump _280
: _279
	peeki 0
	pushi 49
	sub
	itb
	not
	bne _281
	pushfp
	call page49
	loadi
	savei
	jump _return_next_page

	line 1141
# 	else if (this_page == 50)	return page50();
	jump _282
: _281
	peeki 0
	pushi 50
	sub
	itb
	not
	bne _283
	pushfp
	call page50
	loadi
	savei
	jump _return_next_page

	line 1142
# 	else if (this_page == 51)	return page51();
	jump _284
: _283
	peeki 0
	pushi 51
	sub
	itb
	not
	bne _285
	pushfp
	call page51
	loadi
	savei
	jump _return_next_page

	line 1143
# 	else if (this_page == 52)	return page52();
	jump _286
: _285
	peeki 0
	pushi 52
	sub
	itb
	not
	bne _287
	pushfp
	call page52
	loadi
	savei
	jump _return_next_page

	line 1144
# 	else if (this_page == 53)	return page53();
	jump _288
: _287
	peeki 0
	pushi 53
	sub
	itb
	not
	bne _289
	pushfp
	call page53
	loadi
	savei
	jump _return_next_page

	line 1145
# 	else if (this_page == 54)	return page54();
	jump _290
: _289
	peeki 0
	pushi 54
	sub
	itb
	not
	bne _291
	pushfp
	call page54
	loadi
	savei
	jump _return_next_page

	line 1146
# 	else if (this_page == 55)	return page55();
	jump _292
: _291
	peeki 0
	pushi 55
	sub
	itb
	not
	bne _293
	pushfp
	call page55
	loadi
	savei
	jump _return_next_page

	line 1147
# 	else if (this_page == 56)	return page56();
	jump _294
: _293
	peeki 0
	pushi 56
	sub
	itb
	not
	bne _295
	pushfp
	call page56
	loadi
	savei
	jump _return_next_page

	line 1148
# 	else if (this_page == 57)	return page57();
	jump _296
: _295
	peeki 0
	pushi 57
	sub
	itb
	not
	bne _297
	pushfp
	call page57
	loadi
	savei
	jump _return_next_page

	line 1149
# }
: _297
: _298
: _296
: _294
: _292
: _290
: _288
: _286
: _284
: _282
: _280
: _278
: _276
: _274
: _272
: _270
: _268
: _266
: _264
: _262
: _260
: _258
: _256
: _254
: _252
: _250
: _248
: _246
: _244
: _242
: _240
: _238
: _236
: _234
: _232
: _230
: _228
: _226
: _224
: _222
: _220
: _218
: _216
: _214
: _212
: _210
: _208
: _206
: _204
: _202
: _200
: _198
: _196
: _194
: _192
: _190
: _188
: _186
: _184
	pushi 0
	savei
: _return_next_page
# retract over local var this_page
	popi
	return
: _182
	line 1150
# 
	line 1151
# function void main
	line 1152
# {
	jump _299
: main
	line 1153
# 	instructions();	more();
	pushfp
	call instructions

	pushfp
	call more

	line 1154
# 	character();	more();
	pushfp
	call character

	pushfp
	call more

	line 1155
# 	do {
: _300
	line 1156
# 		page := next_page(page);
	pushfp
	peeki 8
	call next_page
	loadi
	pokei 8

	line 1157
# 	} while (page != 0);
	peeki 8
	pushi 0
	sub
	itb
	beq _300
: _301
	line 1158
# 	more();
	pushfp
	call more

	line 1159
# 	AppExit(0);
	pushi 0
	sys AppExit

	line 1160
# }
: _return_main
	return
: _299
	line 1161
# 
	line 1162
# end;
	pushfp
	call main
	halt
	end

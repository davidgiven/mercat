// Mercat standard library
// (More of an include file, really)
// (C) 1998 David Given

// --- Application control ---------------------------------------------------

inline array string AppGetArguments
{"sys AppGetArguments"}

inline string AppGetErrorString
{"sys AppGetErrorString"}

inline void AppExit
	int exitcode;
{"sys AppExit"}

// --- Number stuff ----------------------------------------------------------

inline int RandomNumber
	int range;
{"sys RandomNumber"}

inline void RandomSetSeed
	int seed;
{"sys RandomSetSeed"}

// --- Basic I/O -------------------------------------------------------------

inline void PrintString
	int stream;
	string message;
{"sys PrintString"}

inline void PrintInt
	int stream;
	int value;
{"sys PrintInt"}

inline void PrintNL
	int stream;
{"sys PrintNL"}

// --- Stream I/O ------------------------------------------------------------

inline int StreamOpenFile
	string filename;
	string flags;
{"sys StreamOpenFile"}

inline void StreamClose
	int stream;
{"sys StreamClose"}

inline void StreamFlush
	int stream;
{"sys StreamFlush"}

inline string StreamReadChar
	int stream;
{"sys StreamReadChar"}

inline void StreamWriteByte
	int stream;
	int value;
{"sys StreamWriteByte"}

inline string StreamReadLine
	int stream;
{"sys StreamReadLine"}

inline void StreamSeek
	int stream;
	int pos;
{"sys StreamSeek"}

inline int StreamTell
	int stream;
{"sys StreamTell"}

inline int StreamLength
	int stream;
{"sys StreamLength"}

inline int StreamEOF
	int stream;
{"sys StreamEOF"}

global int stdin := 0;
global int stdout := 1;
global int stderr := 2;

// --- String identification ------------------------------------------------

inline int IsWhiteSpace
	string s;
{"sys IsWhiteSpace"}

inline int IsDigit
	string s;
{"sys IsDigit"}

inline int IsHexDigit
	string s;
{"sys IsHexDigit"}

inline int IsAlpha
	string s;
{"sys IsAlpha"}

inline int IsAlphaNumeric
	string s;
{"sys IsAlphaNumeric"}

// --- String manipulation ---------------------------------------------------

inline int StringToInt
	string s;
{"pushi 10\n
sys StringToIntRadix"}

inline int StringToIntRadix
	string s;
	int radix;
{"sys StringToIntRadix"}

inline string IntToString
	int l;
{"pushi 10\n
sys IntToStringRadix"}

inline string IntToStringRadix
	int l;
	int radix;
{"sys IntToStringRadix"}

inline string StringMid
	string s;
	int from;
	int to;
{"sys StringMid"}

inline int StringInstr
	string s;
	string target;
	int start;
{"sys StringInstr"}

inline int StringByte
	string s;
{"sys StringByte"}

inline string ByteString
	int c;
{"sys ByteString"}

inline string StringStrip
	string s;
{"sys StringStrip"}

function string StringDup
	int n;
	string s;
{
	string r := "";
	while(n>0)
	{
		r := r + s;
		n := n - 1;
	}
	return r;
}

inline string StringUpper
	string s;
{"sys StringUpper"}

inline string StringLower
	string s;
{"sys StringLower"}

inline array byte StringToByteArray
	string s;
{"sys StringToByteArray"}

inline string ByteArrayToString
	array byte a;
{"sys ByteArrayToString"}

// --- Time stuff -----------------------------------------------------------

inline int TimeNow
{"sys TimeNow"}

inline void TimeSleep
	int delay;
{"sys TimeSleep"}

inline void TimeSleepUntil
	int time;
{"sys TimeSleepUntil"}

// --- Debugging stuff ------------------------------------------------------

inline void DebugPrintDictArrayLong
	dict array int d;
{"sys DebugPrintObj"}

inline void DebugPrintDictLong
	dict int d;
{"sys DebugPrintObj"}

end;

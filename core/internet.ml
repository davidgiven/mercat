// Internet module
// (C) 1998 David Given

// Tests for presence of internet back-end.

inline int HasInternet
{"sys HasInternet"}

// Send a mail message, complex interface

inline void InternetSendMailRaw
	string destination;
	string header;
	string body;
{"sys InternetSendMailRaw"}

// Send a mail message, simple interface

function void InternetSendMail
	string destination;
	dict string header;
	string body;
{
	array string h := list(header);
	string hs;
	int i;

	for(i:=0; i<sizeof(h); i:=i+1)
		hs := hs + h[i] + ": " + header[h[i]] + "\n";

	InternetSendMailRaw(destination, hs, body);
}

end;


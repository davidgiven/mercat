// Extensions to the SCR UI module
// (C) 1998 David Given

// --- Reads in a string ------------------------------------------------------

function string ScrXReadString
	int x;
	int y;
	int length;
	string s;
{
	int offset := 0;
	int cursor := sizeof(s);
	int c;

	if (cursor > length)
		offset := cursor - length - 1;

	do {
		ScrGotoXY(x, y);
		ScrPutStr(StringMid(s, offset, length));
		if (sizeof(s) - offset < length)
			ScrPutStr(StringDup(length - sizeof(s) - offset, " "));
		ScrGotoXY(x + cursor - offset, y);

		c := ScrGetCh();
		if (((c == KEY_LEFT) or (c == 2)) and (cursor > 0))
			cursor := cursor - 1;
		else if (((c == KEY_RIGHT) or (c == 6)) and (cursor < sizeof(s)))
			cursor := cursor + 1;
		else if ((c == KEY_HOME) or (c == 1))
			cursor := 0;
		else if ((c == KEY_END) or (c == 5))
			cursor := sizeof(s);
		else if ((c == KEY_DELETE) or (c == 4))
		{
			if (cursor == 0)
				s := StringMid(s, 1, -1);
			else if (cursor == sizeof(s))
			{
			}
			else
			{
				s := StringMid(s, 0, cursor) +
					StringMid(s, cursor+1, -1);
			}
		}
		else if (c == KEY_BACKSPACE)
		{
			if (cursor == 0)
			{
			}
			else if (cursor == sizeof(s))
			{
				s := StringMid(s, 0, sizeof(s)-1);
				cursor := cursor - 1;
			}
			else
			{
				s := StringMid(s, 0, cursor-1) +
					StringMid(s, cursor, -1);
				cursor := cursor - 1;
			}
		}
		else if ((c >= 32) and (c <= 126))
		{
			if (cursor == 0)
				s := ByteString(c) + s;
			else if (cursor == sizeof(s))
				s := s + ByteString(c);
			else
				s := StringMid(s, 0, cursor) + ByteString(c) +
					StringMid(s, cursor, -1);
			cursor := cursor + 1;
		}
				
		if (cursor < offset)
			offset := cursor;
		if (cursor > (offset+length-1))
			offset := cursor - length - 1;
	} while(c != KEY_ENTER);

	return s;
}

end;


/* inline.h
 * Possibly inline functions (if we can do that)
 */

/* --- Null dereference -------------------------------------------------- */

#ifdef INLINE
INLINE
#endif
void checkNull(Object* o)
{
	if (!o)
		fatalError(FATAL_SYSCALL, "Null object dereference");
}

/* --- Retrieve data off the stack --------------------------------------- */

#ifdef INLINE
INLINE
#endif
void check(int ptr, byte type)
{
	if (ptr < 0)
	{
		fprintf(stderr, "Stack underflow at %X; pc=%X, sp=%X\n", ptr, pc-1, sp);
		exit(6);
	}

#if 0
	if (p > 0xFFFF)
	{
		fprintf(stderr, "Stack overflow at %X; pc=%X, sp=%X\n", ptr, pc-1, sp);
		exit(6);
	}
#endif

	if (stackType[ptr] != type)
	{
		msg(MSG_FATAL, "Illegal stack access at %X; pc=%X, sp=%X\n", ptr, pc-1, sp);
		fatalError(FATAL_STACK, "Illegal stack access");
	}
}

/* --- Peek/poke --------------------------------------------------------- */

#ifdef INLINE
INLINE
#endif
int32 peeki(int ptr)
{
	check(ptr, SP_INT);
	return stack[ptr].i;
}

#ifdef INLINE
INLINE
#endif
Object* peeko(int ptr)
{
	check(ptr, SP_OBJECT);
	return stack[ptr].o;
}

#ifdef INLINE
INLINE
#endif
void pokei(int ptr, int32 value)
{
	check(ptr, SP_INT);
	stack[ptr].i = value;
}

#ifdef INLINE
INLINE
#endif
void pokeo(int ptr, Object* value)
{
	check(ptr, SP_OBJECT);
	stack[ptr].o = value;
}

/* --- Push/pop ---------------------------------------------------------- */

#ifdef INLINE
INLINE
#endif
void pushi(int32 value)
{
	stackType[sp] = SP_INT;
	stack[sp].i = value;
	sp++;
}

#ifdef INLINE
INLINE
#endif
void pusho(Object* value)
{
	stackType[sp] = SP_OBJECT;
	stack[sp].o = value;
	sp++;
}

#ifdef INLINE
INLINE
#endif
int32 popi(void)
{
	sp--;
	check(sp, SP_INT);
	stackType[sp] = SP_EMPTY;
	return stack[sp].i;
}

#ifdef INLINE
INLINE
#endif
Object* popo(void)
{
	sp--;
	check(sp, SP_OBJECT);
	stackType[sp] = SP_EMPTY;
	return stack[sp].o;
}

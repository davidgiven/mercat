/* interp.c
 * Main byte-code interpreter
 */

#include "globals.h"

static void unimplemented(void)
{
	fprintf(stderr, "Unimplemented opcode %02X (`%s'); pc=%X, sp=%X\n", code[pc-1],
		opcodeName(code[pc-1]), pc-1, sp);
	fatalError(FATAL_OPCODE, "Unimplemented opcode");
}

static void badOpcode(void)
{
	fprintf(stderr, "Illegal opcode %02X (`%s'); pc=%X, sp=%X\n", code[pc-1],
		opcodeName(code[pc-1]), pc-1, sp);
	fatalError(FATAL_OPCODE, "Illegal opcode");
}

static void badAMode(byte amode)
{
	fprintf(stderr, "Bad addressing mode %d; pc=%X, sp=%X\n", amode, pc-1, sp);
	fatalError(FATAL_OPCODE, "Bad addressing mode");
}

static void divisionByZero(void)
{
	fprintf(stderr, "Division by zero; pc=%X, sp=%X\n", pc-1, sp);
	fatalError(FATAL_OPCODE, "Division by zero");
}

#define arithop(op) \
	pushi(popi() op l)

#define conditional(op) \
	do {						\
		if (amode == 0)				\
			badAMode(amode);		\
		if (!(popi() op 0))			\
			pc = oldpc + l;			\
	} while(0)

void execute(void)
{
	uint oldpc = pc;
	byte op = code[pc];
	pc++;

#ifdef DEBUG
	msg(MSG_DEBUG, "%04X : %08X %08X {%04X} (%04X) [%04X]: %02X %02X %02X %02X %02X %s",
		pc-1, stack[(sp-2)<0 ? 0 : (sp-2)].i, stack[sp-1].i, sp,
		fp, cs, op, code[pc], code[pc+1], code[pc+2], code[pc+3],
		opcodeName(op));

#endif

	if (op < 200)
	{
		int amode = op & 3;
		int32 l = 0;
		Object* o;

		/* Special case for 00 */

		if (op == 0)
		{
			pushi(0);
			return;
		}

		switch (amode)
		{
			case 0:	/* Immediate parameter passed on stack */
				l = popi();
				break;

			case 1: /* Byte immediate parameter */
			        l = (char)code[pc];
				pc++;
				break;

			case 2: /* Short immediate parameter */
			        l = (int16)RINT16(code+pc);
				// l = (int32)(RINT16(code+pc) << 16 >> 16);
				pc += 2;
				break;

			case 3: /* Long immediate parameter */
			        l = (int32)RINT32(code+pc);
				// l = RINT32(code+pc);
				pc += 4;
				break;
		}

		switch (op >> 2)
		{
			case OP_PUSHI:
				pushi(l);
				break;

			case OP_ADD:	arithop(+);	break;
			case OP_SUB:	arithop(-);	break;
			case OP_MUL:	arithop(*);	break;
			case OP_DIV:	arithop(/);	break;
			case OP_REM:	arithop(%);	break;
			case OP_AND:	arithop(&);	break;
			case OP_OR:	arithop(|);	break;
			case OP_XOR:	arithop(^);	break;
			case OP_SHL:	arithop(<<);	break;
			case OP_SHR:	arithop(>>);	break;

			case OP_BEQ:	conditional(==);	break;
			case OP_BNE:	conditional(!=);	break;
			case OP_BLT:	conditional(<);		break;
			case OP_BLE:	conditional(<=);	break;
			case OP_BGT:	conditional(>);		break;
			case OP_BGE:	conditional(>=);	break;

			case OP_JUMP:
				pc = oldpc + l;
				break;

			case OP_CALL:
				cs--;
				fp = callStack[cs];
				callStack[cs] = pc;
				cs++;
				if (amode == 0)
					pc = l;
				else
					pc = oldpc + l;
				break;

			case OP_SYS:
				syscalltable[l]();
				break;

			case OP_GETA:
				o = popo();
				checkNull(o);
				switch(o->type)
				{
					case OBJ_BYTEARRAY:
						pushi(ArrayGetByte(o, l));
						break;

					case OBJ_INTARRAY:
						pushi(ArrayGetInt(o, l));
						break;

					case OBJ_OBJARRAY:
						pusho(ArrayGetObj(o, l));
						break;
				}
				break;

			case OP_SETA:
				o = popo();
				checkNull(o);
				switch(o->type)
				{
					case OBJ_BYTEARRAY:
						ArraySetByte(o, l, popi());
						break;

					case OBJ_INTARRAY:
						ArraySetInt(o, l, popi());
						break;

					case OBJ_OBJARRAY:
						ArraySetObj(o, l, popo());
						break;
				}
				break;

			case OP_PEEKI:
				if (l <= 0)
					pushi(peeki(fp-l));
				else
					pushi(peeki(l));
				break;

			case OP_POKEI:
				if (l <= 0)
					pokei(fp-l, popi());
				else
					pokei(l, popi());
				break;

			case OP_PEEKO:
				if (l <= 0)
					pusho(peeko(fp-l));
				else
					pusho(peeko(l));
				break;

			case OP_POKEO:
				if (l <= 0)
					pokeo(fp-l, popo());
				else
					pokeo(l, popo());
				break;

			case OP_LINE:
				lineno = l;
				break;

			default:
				badOpcode();
		}
	}
	else
	{
		int32 l;
		Object* o1;
		Object* o2;

		switch (op)
		{
			case OP_PUSHI1:
				pushi(1);
				break;

			case OP_PUSHI_1:
				pushi(-1);
				break;

			case OP_PUSHO:
				pusho(CreateString(strdup(""), 0));
				break;

			case OP_PUSHO+1:
				{
					int32 size = code[pc];
					char* s = (char*)mmalloc(size);
					pc++;
					memcpy(s, code+pc, size);
					pc += size;
					pusho(CreateString(s, size));
				}
				break;

			case OP_PUSHO+2:
				{
					int32 size = RINT16(code+pc);
					char* s = (char*)mmalloc(size);
					pc += 2;
					memcpy(s, code+pc, size);
					pc += size;
					pusho(CreateString(s, size));
				}
				break;

			case OP_NOT:
				pushi(!popi());
				break;

			case OP_ITB:
				pushi(!!popi());
				break;

			case OP_RETURN:
				cs--;
				pc = callStack[cs];
				cs--;
				fp = callStack[cs];
				break;

			case OP_CONCAT:
				o2 = popo();
				o1 = popo();
				pusho(StringConcat(o1, o2));
				break;

			case OP_POPI:
				(void)popi();
				break;

			case OP_POPO:
				(void)popo();
				break;

			case OP_HALT:
				halt = 1;
				break;

			case OP_SAVEI:
				savereg.t = SP_INT;
				savereg.d.i = popi();
				break;

			case OP_LOADI:
				if (savereg.t != SP_INT)
					fatalError(FATAL_OPCODE, "Mismatched LOADI");
				pushi(savereg.d.i);
				break;

			case OP_SAVEO:
				savereg.t = SP_OBJECT;
				savereg.d.o = popo();
				break;

			case OP_LOADO:
				if (savereg.t != SP_OBJECT)
					fatalError(FATAL_OPCODE, "Mismatched LOADO");
				pusho(savereg.d.o);
				break;

			case OP_PUSHFP:
				callStack[cs] = fp;
				cs++;
				callStack[cs] = sp;
				cs++;
				break;

			case OP_STRCMP:
				o2 = popo();
				o1 = popo();
				pushi(StringCompare(o1, o2));
				break;

			case OP_RESIZE:
				l = popi();
				o1 = popo();
				ArrayResize(o1, l);
				break;

			case OP_PUSHABYTE:
				pusho(CreateByteArray());
				break;

			case OP_PUSHAINT:
				pusho(CreateIntArray());
				break;

			case OP_PUSHAOBJ:
				pusho(CreateObjArray());
				break;

			case OP_SIZE:
				o1 = popo();
				if (o1)
					l = o1->size;
				else
					l = 0;
				pushi(l);
				break;

			case OP_NEG:
				pushi(-popi());
				break;

			case OP_PUSHDBYTE:
			case OP_PUSHDINT:
				pusho(CreateIntDict());
				break;

			case OP_PUSHDOBJ:
				pusho(CreateObjDict());
				break;

			case OP_GETD:
				o2 = popo();
				o1 = popo();

				switch(o1->type)
				{
					case OBJ_INTDICT:
						pushi(DictGetInt(o1, o2));
						break;

					case OBJ_OBJDICT:
						pusho(DictGetObj(o1, o2));
						break;
				}
				break;

			case OP_SETD:
				o2 = popo();
				o1 = popo();

				switch(o1->type)
				{
					case OBJ_INTDICT:
						DictSetInt(o1, o2, popi());
						break;

					case OBJ_OBJDICT:
						DictSetObj(o1, o2, popo());
						break;
				}
				break;

			case OP_STATD:
				o2 = popo();
				o1 = popo();
				pushi(DictStat(o1, o2));
				break;

			case OP_ISNIL:
				o1 = popo();
				pushi(o1 == NULL);
				break;
			
			case OP_DUPI:
				l = popi();
				pushi(l);
				pushi(l);
				break;
			
			case OP_DUPO:
				o1 = popo();
				pusho(o1);
				pusho(o1);
				break;

			case OP_I2O:
				pusho(CreateOInt(popi()));
				break;

			case OP_O2I:
				pushi(ExtractOInt(popo()));
				break;
				
			case OP_INSERTARRAY:
				{
					int size = popi();
					int index = popi();
					ArrayInsert(popo(), index, size);
				}
				break;

			case OP_DELETEARRAY:
				{
					int size = popi();
					int index = popi();
					ArrayDelete(popo(), index, size);
				}
				break;

			default:
				badOpcode();
		}
	}
}


/* disasm.c
 * Debugging disassembler
 */

#include "globals.h"

static char b[10];

char* opcodeName(int op)
{
	if (op < 200)
	{
		char *n;

		switch(op >> 2)
		{
			case OP_PUSHI:		n = "pushi";	break;
			case OP_ADD:		n = "add";	break;
			case OP_SUB:		n = "sub";	break;
			case OP_MUL:		n = "mul";	break;
			case OP_DIV:		n = "div";	break;
			case OP_REM:		n = "rem";	break;
			case OP_AND:		n = "and";	break;
			case OP_OR:		n = "or";	break;
			case OP_XOR:		n = "xor";	break;
			case OP_SHL:		n = "shl";	break;
			case OP_SHR:		n = "shr";	break;
			case OP_BEQ:		n = "beq";	break;
			case OP_BNE:		n = "bne";	break;
			case OP_BLT:		n = "blt";	break;
			case OP_BLE:		n = "ble";	break;
			case OP_BGT:		n = "bgt";	break;
			case OP_BGE:		n = "bge";	break;
			case OP_JUMP:		n = "jump";	break;
			case OP_CALL:		n = "call";	break;
			case OP_SYS:		n = "sys";	break;
			case OP_GETA:		n = "geta";	break;
			case OP_SETA:		n = "seta";	break;
			case OP_PEEKI:		n = "peeki";	break;
			case OP_POKEI:		n = "pokei";	break;
			case OP_PEEKO:		n = "peeko";	break;
			case OP_POKEO:		n = "pokeo";	break;
			case OP_LINE:		n = "line";	break;
			default:
				n = "??1";
		}
		sprintf(b, "%s.%d", n, op & 3);
		return b;
	}
	else
	{
		switch(op)
		{
			case OP_PUSHI1:		return "pushi1";
			case OP_PUSHI_1:	return "pushi-1";
			case OP_PUSHO:		return "pusho.s0";
			case OP_PUSHO+1:	return "pusho.s1";
                        case OP_PUSHO+2:	return "pusho.s2";
			case OP_NOT:		return "not";
			case OP_ITB:		return "itb";
			case OP_RETURN:		return "return";
			case OP_CONCAT:		return "concat";
			case OP_POPI:		return "popi";
			case OP_POPO:		return "popo";
			case OP_HALT:		return "halt";
			case OP_SAVEI:		return "savei";
			case OP_SAVEO:		return "saveo";
			case OP_LOADI:		return "loadi";
			case OP_LOADO:		return "loado";
			case OP_PUSHFP:		return "pushfp";
			case OP_STRCMP:		return "strcmp";
			case OP_RESIZE:		return "resize";
			case OP_PUSHNIL:	return "pushnil";
			case OP_PUSHABYTE:	return "pushabyte";
			case OP_PUSHAINT:	return "pushaint";
			case OP_PUSHAOBJ:	return "pushaobj";
			case OP_SIZE:		return "size";
			case OP_NEG:		return "neg";
			case OP_PUSHDBYTE:	return "pushdbyte";
			case OP_PUSHDINT:	return "pushdint";
			case OP_PUSHDOBJ:	return "pushdobj";
			case OP_GETD:		return "getd";
			case OP_SETD:		return "setd";
			case OP_STATD:		return "statd";
			case OP_ISNIL:		return "isnil";

			default:
				return "??2";
		}
	}
}

/* debug.c
 * Various debugging routines
 */

#include "globals.h"

#ifdef DEBUG
static void display_intdict(void* o1)
{
	DictNode* dn = (DictNode*)o1;
	printf("(%X:\"", (int32)dn->key);
	fwrite(dn->key->ptr, dn->key->size, 1, stdout);
	printf("\", %d)", dn->data.i);
}

static void display_stringdict(void* o1)
{
	DictNode* dn = (DictNode*)o1;
	printf("(%X:\"", (int32)dn->key);
	fwrite(dn->key->ptr, dn->key->size, 1, stdout);
	printf("\", %X:\"", (int32)dn->data.o);
	fwrite(dn->data.o->ptr, dn->data.o->size, 1, stdout);
	printf("\")");
}

static void display_nulldict(void* o1)
{
	printf("(%X)", (int32)o1);
}

void DebugPrintObj(void)
{
	Object* o = popo();
	int i;
	int c;
	int32 l;

	fprintf(stderr, "object(0x%" LONGFORMAT "X, ", (int32)o);
	if (!o)
	{
		fprintf(stderr, "?)\n");
		return;
	}

	switch(o->type)
	{
		case OBJ_STRING:
			fprintf(stderr, "string, %d) =\n", o->size);
			fprintf(stderr, "\t\"");
			for(i=0; i<o->size; i++)
			{
				c = ((byte*)o->ptr)[i];
				if ((c < 32) || (c > 126))
					fputc('.', stderr);
				else
					fputc(c, stderr);
			}
			fprintf(stderr, "\"\n");
			break;

		case OBJ_INT:
			fprintf(stderr, "int, %d) =\n", o->size);
			break;

		case OBJ_BYTEARRAY:
			fprintf(stderr, "bytearray, %d) = {", o->size);
			for(i=0; i<o->size; i++)
			{
				c = ((byte*)o->ptr)[i];
				fprintf(stderr, "%d, ", c);
			}
			fprintf(stderr, "}\n");
			break;

		case OBJ_INTARRAY:
			fprintf(stderr, "intarray, %d) = {", o->size);
			for(i=0; i<o->size; i++)
			{
				l = ((int32*)o->ptr)[i];
				fprintf(stderr, "%" LONGFORMAT "d, ", l);
			}
			fprintf(stderr, "}\n");
			break;

		case OBJ_OBJARRAY:
			fprintf(stderr, "objarray, %d) =\n", o->size);
			break;

		case OBJ_INTDICT:
			fprintf(stderr, "intdict) = \n");
			AVLTree_Dump(o->ptr, display_intdict, 0);
			break;

		case OBJ_OBJDICT:
			fprintf(stderr, "objdict) = \n");
			AVLTree_Dump(o->ptr, display_stringdict, 0);
			break;
	}
}

void debug_printobjdict(AVLNode* node)
{
	AVLTree_Dump(node, display_nulldict, 0);
}
#endif

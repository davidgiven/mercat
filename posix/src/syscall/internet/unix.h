/* syscall/internet/unix.h
 * Simple internet access.
 * This is actually an include file included by syscall/internet.c, so we
 * don't need * globals.h. Also, we can make certain assumptions (like that
 * the SCR module is being compiled in).
 */

/* =========================================================================
                                  EMAIL ACCESS
   ========================================================================= */

/* --- Send a mail message ------------------------------------------------- */

void sys_InternetSendMailRaw(void)
{
	Object* body = popo();
	Object* header = popo();
	Object* dest = popo();
	FILE* stream;
	char* cline;

	CheckObjType(body, OBJ_STRING);
	CheckObjType(header, OBJ_STRING);
	CheckObjType(dest, OBJ_STRING);

	cline = malloc(dest->size + sizeof(INTERNET_SENDMAIL) + 5);
	strcpy(cline, INTERNET_SENDMAIL);
	memcpy(cline + sizeof(INTERNET_SENDMAIL) - 1, dest->ptr, dest->size);
	cline[sizeof(INTERNET_SENDMAIL) + dest->size] = '\0';
	stream = popen(cline, "w");
	
	fwrite(header->ptr, header->size, 1, stream);
	fprintf(stream, "\n");
	fputc('\n', stream);
	fwrite(body->ptr, body->size, 1, stream);
	fputc('\n', stream);

	fclose(stream);
	free(cline);
}

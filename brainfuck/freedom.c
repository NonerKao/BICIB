#include<stdio.h>
#include<unistd.h>
#include <fcntl.h>
#include"liberty/simple-object.h"
#include"liberty/simple-object-common.h"

int fdi;
#define TEST()\
	if(err){\
		if(errmsg != NULL) puts(errmsg);\
		return 0; \
	}\
else puts("OK");

static int
find_one_section (void *data, const char *name, off_t offset, off_t length)
{
	 printf("%s %d %d\n", name, offset, length);
	/* Add a section to SIMPLE_OBJECT.  NAME is the name of the new
	   section.  ALIGN is the required alignment expressed as the number
	   of required low-order 0 bits (e.g., 2 for alignment to a 32-bit
	   boundary).  The section is created as containing data, readable,
	   not writable, not executable, not loaded at runtime.  On error this
	   returns NULL, sets *ERRMSG to an error message, and sets *ERR to an
	   errno value or 0 if there isn't one.  */
	char *errmsg;
	int err;

	lseek(fdi, offset, SEEK_SET);
	int newlen = (1+length/64)*64;
	char* buf = malloc(newlen);
	memset(buf, 0, newlen);
	read(fdi, buf, length);

	simple_object_write_section *sows = simple_object_write_create_section( (simple_object_write*)data, name, 3, &errmsg, &err);
	TEST();
	/* Add data BUFFER/SIZE to SECTION in SIMPLE_OBJECT.  If COPY is
	   non-zero, the data will be copied into memory if necessary.  If
	   COPY is zero, BUFFER must persist until SIMPLE_OBJECT is released.
	   On success this returns NULL.  On error this returns an error
	   message, and sets *ERR to an errno value or 0 if there isn't
	   one.  */

	errmsg = simple_object_write_add_data ((simple_object_write*)data, sows, buf, length, 1, &err);
	TEST();

	lseek(fdi, 0 , SEEK_SET);
	return 1;
}



int main(){
	fdi = open("b1", O_RDONLY);
	int fdo = open("b3", O_WRONLY|O_CREAT);
	char* errmsg;
	int err;
	struct simple_object_read *sor = simple_object_start_read(fdi, 0, NULL, &errmsg, &err);
	TEST();
	simple_object_attributes *sof = simple_object_fetch_attributes(sor, &errmsg, &err);
	TEST();
	/*since the second parameter should be non-necessary to ELF format, pass NULL*/
	/*however, original impl. will treat this as a bug, */
	/*customize this later*/
	simple_object_write *sow = simple_object_start_write(sof, NULL, &errmsg, &err);
	TEST();
	simple_object_find_sections(sor, find_one_section, sow, &err);
	TEST();
	errmsg = simple_object_write_to_file(sow, fdo, &err);
	TEST();

	simple_object_release_attributes(sof);
	puts("??");
	simple_object_release_read(sor);
	puts("??");
	simple_object_release_write(sow);
	puts("??");
	close(fdi);
	close(fdo);
	return 0;
}

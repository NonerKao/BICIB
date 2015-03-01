#include<stdio.h>
#include<unistd.h>
#include <fcntl.h>
#include"simple-object.h"
#include"simple-object-common.h"

#define EI_MAG0         0       /* File identification byte 0 index */
#define ELFMAG0            0x7F /* Magic number byte 0 */

#define EI_MAG1         1       /* File identification byte 1 index */
#define ELFMAG1             'E' /* Magic number byte 1 */

#define EI_MAG2         2       /* File identification byte 2 index */
#define ELFMAG2             'L' /* Magic number byte 2 */

#define EI_MAG3         3       /* File identification byte 3 index */
#define ELFMAG3             'F' /* Magic number byte 3 */

#define EI_CLASS        4       /* File class */
#define ELFCLASSNONE          0 /* Invalid class */
#define ELFCLASS32            1 /* 32-bit objects */
#define ELFCLASS64            2 /* 64-bit objects */

#define EI_DATA         5       /* Data encoding */
#define ELFDATANONE           0 /* Invalid data encoding */
#define ELFDATA2LSB           1 /* 2's complement, little endian */
#define ELFDATA2MSB           2 /* 2's complement, big endian */

#define EI_VERSION      6       /* File version */
#define EV_CURRENT      1               /* Current version */

#define EI_OSABI        7       /* Operating System/ABI indication */


int main(){
	int fd = open("b1", O_RDONLY);
	unsigned char header[SIMPLE_OBJECT_MATCH_HEADER_LEN];
	char* errmsg;
	int err;
	header[EI_MAG0] = ELFMAG0;
        header[EI_MAG1] = ELFMAG1;
        header[EI_MAG2] = ELFMAG2;
        header[EI_MAG3] = ELFMAG3;
        header[EI_CLASS] = ELFCLASS64;
        header[EI_VERSION] = EV_CURRENT;
	header[EI_DATA] = ELFDATA2LSB;
	header[EI_OSABI] = 1;
	struct simple_object_elf_read *eor = simple_object_elf_functions.match(header, fd, 0, ".text", &errmsg, &err);
	int i;
	if(!eor){
		printf("how to use this shit?\n");
	puts(errmsg);
		return 0;
	}
	for (i = 0; i< SIMPLE_OBJECT_MATCH_HEADER_LEN; i++)
		printf("%c", header[i]);
	simple_object_elf_functions.release_read(NULL);
	close(fd);
	return 0;
}

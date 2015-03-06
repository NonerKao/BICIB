#include<unistd.h>
#include<stdio.h>
#include<string.h>
#include<stdlib.h>

/*
 * support entry point of the format:
 *
 *   <exe> <file1> <file2> ... <filen>
 *
 * this entry point will load the files accordingly to the tape,
 * separated by '\0' character
 * currently(0.2-dev), only support read file
 */

int main(int argc, char* argv[]){
	int i;
	FILE* farray = NULL;

	for(i = 1; i< argc; i++){
		farray = fopen(argv[i], "r");
		if(farray == NULL){
			printf("%s not found!\n", argv[i]);
			return -1;
		}
		
		fclose(farray[i-1]);
	}

	_bicib();

	return 0;
}

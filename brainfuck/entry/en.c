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
	FILE** farray = NULL;
	if(argc != 1){
		farray = (FILE**)malloc(sizeof(FILE*)*(argc-1));
	}

	for(i = 1; i< argc; i++){
		farray[i-1] = fopen(argv[i], "r");
		if(farray[i-1] == NULL){
			int j;
			for(j = i-2; j >= 0; j--)
				fclose(farray[j]);
			printf("%s not found!\n", argv[i]);
			return -1;
		}
	}

	//asm("callq _bicib");
	_bicib();

	for(i = 1; i< argc; i++){
		fclose(farray[i-1]);
	}

	if(farray != NULL)
		free(farray);
	return 0;
}

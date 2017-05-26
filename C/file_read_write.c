#include <stdio.h>
#include <ctype.h>
#include <stdbool.h>
#include "terminal_user_input.h"

void write_lines(FILE *file_ptr) {
  int i = 0;
  fprintf(file_ptr, "%d", 20);
  fprintf(file_ptr, "%s"," line1");
  while (i=0, i<18, i++) {
    fprintf(file_ptr, "%s", "a");
  }
}

void read_lines_to_terminal(int fileLength, FILE *file_ptr) {
  //my_string string;
  int i, my_int; 
  my_string lineArray[20];
  printf("Number of lines is:%d\n", fileLength);
  while (!feof(file_ptr)) {
    for (i=1;i<fileLength;i++){
      fscanf(file_ptr, "%s", lineArray[i].str);
      printf("Line %d is %s\n", i+1, lineArray[i].str);
    }
 }
}

int main()
{
  FILE *file_ptr;
  int i, fileLength;

// write to the file
  if ((file_ptr = fopen("mytestfile.dat", "w")) == NULL)
    printf("File could not be opened");
  else
    write_lines(file_ptr);

  fclose(file_ptr);

// open the file and read from it

  if ((file_ptr = fopen("mytestfile.dat", "r")) == NULL)
    printf("File could not be opened");
  else
    fscanf(file_ptr, "%d", &fileLength);
    read_lines_to_terminal(fileLength, file_ptr);

 fclose(file_ptr);
}

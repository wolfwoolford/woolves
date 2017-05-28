#include <stdio.h>
#include <ctype.h>
#include <stdbool.h>
#include "file_input_output.h"
#include <string.h>

void read_lines_to_terminal(my_string lineArray[], int numberOfLines) 
{
  my_string string;
  int i,my_int;
  for (i=0; i<numberOfLines; i++)
  {
    printf("Line %d is %s\n", i, lineArray[i].str);
  }
}

void main()
{
  FILE *file_ptr;
  int i, numberOfLines;
  my_string lineArray[20];
  my_string tempString;
  file_ptr = fopen("mytestfile.dat", "r");
  fscanf(file_ptr, "%d", &numberOfLines);
  printf("Number of lines: %d\n", numberOfLines);
  printf("  \n");

  for (i=0; i<numberOfLines; i++)
  {
    fscanf(file_ptr, "%s", lineArray[i].str); 
  }

  printf("Printing lines to terminal... \n");
  read_lines_to_terminal(lineArray, numberOfLines);
  printf("End. \n");
  fclose(file_ptr);
}
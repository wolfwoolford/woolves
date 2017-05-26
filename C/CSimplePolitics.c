#include <stdio.h>
#include <ctype.h>
#include <stdbool.h>
#include <string.h>
#include "terminal_user_input.h"

#define YEAR_TRUMP_ELECTED 2016


// A very basic  read boolean function

bool read_boolean(const char* prompt)
{
  my_string answer;
  bool result;

  answer = read_string(prompt);
  answer.str[0] = (char) tolower(answer.str[0]);

  switch (answer.str[0]) {
  case 'n':
    result = false;
    break;
  case 'y':
    result = true;
    break;
  default:
    result = false;
  }
  return result;
}

int get_name(my_string name)
{
  name = read_string("What is your name? ");
  printf("Your name is: %s\n", name.str);
}
  
int age_when_elected()
{
 int  year_born = read_integer("What year were you born?"); 
 printf("You were born in: %d\n", year_born);
 int age_when_Trump_elected = (YEAR_TRUMP_ELECTED - year_born);
  printf("You were %d", age_when_Trump_elected); 
  printf(" years old when Trump was elected.");

}

int to_exit(char* prompt) 
{
  my_string user_input;
  char* exit_output = "exit";
  
  user_input = read_string(prompt);

  if (strcmp(user_input.str,exit_output) == 0) {
        printf("Goodbye...");
      }
      else {
        printf(prompt);
      } 
}

int main()
{
  my_string name;
  bool brexit_support;
  
  get_name(name);
  age_when_elected();
  brexit_support = read_boolean("\nDo you support Brexit? Write Y/y for yes for N/n for no: " );
  if (brexit_support == true) {
    printf("%s, is a Brexit supporter. \n", name.str);
  }
  else {
    printf("%s, is NOT a Brexit supporter. \n", name.str);
  }
  return 0;

to_exit("Type 'exit' to continue");
}
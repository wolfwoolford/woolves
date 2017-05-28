// ============================
// = User Input Function in C =
// ============================

//
// This header file contains the types and functions/procedures
// in the Terminal User Input code. You can #include "terminal_user_input.h"
// to access these from your project. Remember to compile both your
// program file and the terminal_user_input.c file.
//

//
// The following code makes sure that you cant accidentally
// include this code twice. It is common to see this kind of
// code at the top of a C/C++ header file.
//
#ifndef FILE_INPUT_OUTPUT_H
#define FILE_INPUT_OUTPUT_H
#include <stdio.h>
//
// The my_string type can be used to represent a "string" in C.
// This needs to be a struct so that it can be returned from
// functions.
//
typedef struct my_string
{
  char str[256]; // my string contains an array of 255 characters + null
} my_string;


#endif

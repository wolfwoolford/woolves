#include <stdio.h>
#include <string.h>
#include "terminal_user_input.h"

#define LOOP_COUNT 60
#define GOOD_ONE "Jake"
#define GOOD_TWO "Tahnee"

int main()
{
    my_string name;
    int index;

    name = read_string("What is your name? ");

    if (strcmp(name.str, GOOD_ONE) == 0){
		printf(name.str);
        printf("%s, that's an awesome name!"); 
    }
    else if (strcmp(name.str, GOOD_TWO) == 0) {
        printf(name.str); 
        printf("%s, that's an awesome name!");
    }
    else {
        printf(name.str); 
        printf("%s is a ");
        for (index=0;index<LOOP_COUNT;index++) {
            printf("silly, ");
            }
        printf(" name");
    }
    return 0;
} 
 
    

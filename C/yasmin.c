#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include "terminal_user_input.h"

#define Result1 "Yes"
#define YEAR_TRUMP_ELECTED 2016 

int calculate_age_when_trump_elected()
	{
		int year_born ;
		int age_when_Trump_elected ;

		year_born = read_integer("What year were you born in? "); 
	    printf("You were born in: %d \n", year_born);
	    
	    age_when_Trump_elected = YEAR_TRUMP_ELECTED - year_born ;

		printf("You were %d when Trump was elected \n", age_when_Trump_elected);
		printf("");

	}

int main()
{	
    my_string name;
    int year_born;
    int age_when_Trump_elected;
	my_string result;

    name = read_string("Enter your Name: "); 
    printf("Your name: %s \n \n", name.str);

    calculate_age_when_trump_elected();

	result = read_string("Are you a supporter of Brexit?\n");
	if (strcmp(result.str, Result1) == 0){
		printf("%s, you are a supporter of brexit. \n", name.str); 
	}else {
    	printf("%s, you are not a supporter of brexit. \n", name.str);
  }


	  return 0;
}
 
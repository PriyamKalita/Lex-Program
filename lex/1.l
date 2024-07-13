%{
#include <stdio.h>
int count;
%}

%%
[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]  {count++;}

%%


int main(int argv, char** argc){
	yylex();
	printf("number of 9 digit number : %d", count);
	return 1;
}

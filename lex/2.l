%{
#include <stdio.h>
int count;
%}

%%
int|float|double|char\s+[a-zA-Z][a-zA-Z0-9]*\s*;  {count++;}

%%


int main(int argv, char** argc){
	yylex();
	printf("number of declarative statements : %d", count);
	return 1;
}

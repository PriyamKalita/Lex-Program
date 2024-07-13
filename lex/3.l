%{
#include <stdio.h>
int count=0;
%}

%%
[a-zA-Z0-9]+@[a-zA-Z0-9]+\.com {count++;}

%%


int main(int argv, char** argc){
	yylex();
	printf("number of valid emails : %d", count);
	return 1;
}

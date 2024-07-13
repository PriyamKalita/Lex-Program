%{
#include <stdio.h>
int count;
%}

%%
[^a-zA-Z0-9]+  {count++;}

%%


int main(int argv, char** argc){
	yylex();
	printf("number non alpha numeric cgharacters : %d", count);
	return 1;
}

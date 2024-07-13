%{
#include <stdio.h>
int count;
%}

%%
int|float|char\s+[a-zA-Z][a-zA-Z0-9]*\s*;   { count++; }
.     ;

%%


int main(int argc, char** argv) {
    yylex();
	printf("Number of declarative statement count:%d",count);
    return 0;
}


%{
	#include <stdio.h>
	int c=0;
%}
DIGIT [0-9]

%%
{DIGIT}+ {c +=yyleng;} 
%%

int main(int argc, char* argv[]){
if(argc==2){
		yyin = fopen(argv[1],"r");
	}
yylex();
printf("Number of digits are: %d\n",c);
return 0;
}

int yywrap()
{
return 1;
}

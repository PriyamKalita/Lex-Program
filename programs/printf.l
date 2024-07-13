%{
	#include <stdio.h>
	int s=0;
	int p=0;
%}
%%
"scanf" {s++;}
"printf" {p++;}
.
\n
%%

int main(int argc, char* argv[]){
yyin = fopen("printf.c","r");
yylex();
printf("Number of printf are: %d\n",p);
printf("Number of scanf are: %d\n",s);
return 0;
}

int yywrap()
{
return 1;
}

%{
	#include <stdio.h>
%}

%%
"hi" {printf("bye");}
.* {printf("wrong");}
%%

int main(){
printf("Enter input: ");
yylex();
return 0;
}

int yywrap()
{
return 1;
}

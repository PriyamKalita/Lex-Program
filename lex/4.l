%{
#include <stdio.h>
int vcount=0, ccount=0;
%}

%%
[aeiouAEIOU] {vcount++;}
[^aeiouAEIOU] {ccount++;}


%%


int main(int argv, char** argc){
	printf("enter a string : ");
	yylex();
	printf("vowels : %d\n  consonents : %d\n", vcount,ccount);
	
	return 1;
}

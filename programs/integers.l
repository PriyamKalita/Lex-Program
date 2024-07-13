%{
#include<stdio.h>
int pint=0;
int nint=0;
int pf=0;
int nf=0;
%}

%%
[-][0-9]+ {nint++;}
[+]?[0-9]+ {pint++;}
[+]?[0-9]*\.[0-9]+ {pf++;}
[-][0-9]*\.[0-9]+ {nf++;}
"\n" {
printf("No of positive integers= %d \n No of negative integers= %d \nNo of positive fractions= %d \n No of negative fractions= %d",pint,nint,pf,nf);}
%%
int yywrap(){}
int main(){
printf("Enter the numbers: ");
yylex();

return 0;
}

%{
#include<stdio.h>
int lines=0, words=0, c_letters=0, num=0, spl_chr=0, total=0;
%}

%%
\n {lines++; words++;}
[\t ' '] words++;
[a-zA-Z] c_letters++;
[0-9] num++;
. spl_chr++;
%%

int main()
{
	yyin=fopen("sample.txt","r");
	yylex();
	total=c_letters+spl_chr;
	printf("\n File Contents....\n");
	printf("\n\t%d line",lines);
	printf("\n\t%d words",words);
	printf("\n\t%d Characters",c_letters);
	printf("\n\t%d Digits",num);
	printf("\n\t%d Total %d characters",total);
	return 0;
	
}
int yywrap()
{
	return 1;
}

%{
    #include<stdio.h>
%}

%%
[A-Z]+[ \t\n]        {printf("%s ",yytext);}
.       ;
%%

int main()
{
    printf("Enter: ");
    yylex();
}

int yywrap()
{
    return 1;
}

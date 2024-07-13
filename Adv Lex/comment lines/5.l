%{
    #include<stdio.h>
    int l=0,w=0,s=0,c=0;
%}

%%
[\n]    {l++; c+=yyleng;}
[a-zA-Z]+     {w++; c+=yyleng;}
[ \t]+        {s++; c+=yyleng;}
[0-9]+        {c+=yyleng; printf("%s ",yytext);}
%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter: ");
    yylex();
    printf("Lines: %d, words: %d, space: %d, char: %d",l,w,s,c);
}

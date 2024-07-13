/*to recognize a valid arithmetic expression and to recognize identifers only numbers

%{
    #include<stdio.h>
    #include<string.h>
    int i=0, o=0; k, flag=0;
    char id[10][10], op[10][10];
%}
%%
[0-9]+ {flag++; strcpy(id[i], yytext); i++;}
[+*] {flag--; strcpy(op[o], yytext); o++;}
.|\n {return 0;}
%%
int main()
{
    printf("Enter the expression: \n");
    yylex();
    if(flag!=1)
    {
        printf("\nInvalid expression\n");
    }
    else
    {
        printf("\nValid expression\n");
        printf("\nOperators are:\n");
        for(k=0; k<0; k++)
        {
            printf("%s\t", op[k]);
        }
        printf("\nIdentifiers are:\n");
        for(k=0; k<i; k++)
        {
            printf("%s\t", id[k]);
        }
    }
}
int yywrap()
{
    return 1;
}
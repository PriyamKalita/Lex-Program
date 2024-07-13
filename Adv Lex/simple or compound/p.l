%{
    #include<stdio.h>
    int flag=0;
%}

%%
and|or|but|because|if|then {flag=1;}
.                          ;
\n                         {return 0;}
%%

int main()
{
    printf("Enter: ");
    yylex();
    if (flag==0)
       printf(" Simple");
    else
        printf("Compound");
}

int yywrap()
{
    return 1;
}

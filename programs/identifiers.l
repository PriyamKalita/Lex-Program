%{
#include <stdio.h>
int id = 0;
%}

%%
[a-zA-Z][a-zA-Z0-9_]* { id++; ECHO; printf("\n"); }
. { ; }
\n { ; }
%%

int yywrap()
{
    return 1;
}

int main(int argc, char *argv[])
{
    if (argc != 2)
    {
        printf("Usage: <./a.out> <sourcefile>\n");
        return 0;
    }

    FILE *yyin = fopen(argv[1], "r");
    printf("Valid identifiers are:\n");
    yyrestart(yyin);
    yylex();
    printf("Number of identifiers: %d\n", id);

    fclose(yyin);

    return 0;
}

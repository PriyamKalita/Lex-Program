%{
#include <stdio.h>
#include <string.h>
int count = 0;
%}

%%
int|char|float|double|short|long|void { count++; }
[a-zA-Z_][a-zA-Z0-9_]* { /* Ignore other identifiers */ }
. { /* Ignore all other characters */ }
%%

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: <./a.out> <sourcefile>\n");
        return 0;
    }

    FILE *yyin = fopen(argv[1], "r");
    yyrestart(yyin);
    yylex();

    printf("Number of data types: %d\n", count);

    fclose(yyin);

    return 0;
}

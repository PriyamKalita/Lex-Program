%{
#include <stdio.h>
#include <stdlib.h>
int count = 0;
%}

%%
"pattern" { count++; }
. ; // Ignore other characters
%%



int main(int argc, char* argv[]) {
    if (argc != 2) {
        printf("Usage: <./a.out> <sourcefile>\n");
        exit(0);
    }

    FILE* file = fopen(argv[1], "r");
    if (file == NULL) {
        printf("Unable to open file '%s'\n", argv[1]);
        exit(0);
    }

    yyin = file;
    yylex();

    printf("Number of occurrences of 'pattern': %d\n", count);

    fclose(file);

    return 0;
}

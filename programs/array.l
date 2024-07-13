%{
#include <stdio.h>
int array_count = 0;
int in_declaration = 0;
%}

%%
int|char|float|double   { in_declaration = 1; }
[a-zA-Z_][a-zA-Z0-9_]*  { if (in_declaration) { in_declaration = 0; } }
[a-zA-Z_][a-zA-Z0-9_]*\[[0-9]*\] { array_count++; }
;                       { in_declaration = 0; }
[ \t\n]                 /* Ignore whitespace and newlines */
.                       /* Ignore other characters */
%%

int main(int argc, char **argv) {
    if (argc != 2) {
        printf("Usage: ./array_counter <input_file>\n");
        return 1;
    }

    FILE *file = fopen(argv[1], "r");
    if (!file) {
        printf("Error opening file.\n");
        return 1;
    }

    yyin = file;
    yylex();

    printf("Number of array occurrences: %d\n", array_count);

    fclose(file);
    return 0;
}


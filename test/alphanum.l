/*Write a lex program to count the number of non_alphanumeric characters in a text file*/

%{
#include <stdio.h>
int non_alpha_numeric_count = 0;
%}

%%

[^a-zA-Z0-9\n]   { non_alpha_numeric_count++; }

\n               /* ignore newlines */
.                /* ignore other characters */

%%

int main(int argc, char **argv) {
    if (argc != 2) {
        printf("Usage: ./non_alpha_numeric_counter <input_file>\n");
        return 1;
    }

    FILE *file = fopen(argv[1], "r");
    if (!file) {
        printf("Error opening file.\n");
        return 1;
    }

    yyin = file;
    yylex();

    printf("Number of non-alphanumeric characters: %d\n", non_alpha_numeric_count);

    fclose(file);
    return 0;
}


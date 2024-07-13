/*Write lex program to count he number of 9-digit number in a text file.*/

%{
#include <stdio.h>
int nine_digit_number_count = 0;
%}

%%

[0-9]{9}    { nine_digit_number_count++; }

\n          /* ignore newlines */
.           /* ignore other characters */

%%

int main(int argc, char **argv) {
    if (argc != 2) {
        printf("Usage: ./nine_digit_number_counter <input_file>\n");
        return 1;
    }

    FILE *file = fopen(argv[1], "r");
    if (!file) {
        printf("Error opening file.\n");
        return 1;
    }

    yyin = file;
    yylex();

    printf("Number of 9-digit numbers: %d\n", nine_digit_number_count);

    fclose(file);
    return 0;
}


/*Write a program to count how many valid emails are there in a text file*/

%{
#include <stdio.h>
int email_count = 0;
%}

EMAIL [a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}

%%

{EMAIL}    { email_count++; }

\n         /* ignore newlines */
.          /* ignore other characters */

%%

int main(int argc, char **argv) {
    if (argc != 2) {
        printf("Usage: ./email_counter <input_file>\n");
        return 1;
    }
    
    FILE *file = fopen(argv[1], "r");
    if (!file) {
        printf("Error opening file.\n");
        return 1;
    }
    
    yyin = file;
    yylex();
    
    printf("Number of valid emails: %d\n", email_count);
    
    fclose(file);
    return 0;
}




%{
#include <stdio.h>
#include <stdlib.h>

int pc = 0, sc = 0;
%}

%%
"printf" { fprintf(yyout, "writef"); pc++; }
"scanf" { fprintf(yyout, "readf"); sc++; }
%%

int yywrap() {
    return 1;
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        printf("Usage: <./a.out> <sourcefile> <destinationfile>\n");
        exit(0);
    }

    FILE *inputFile = fopen(argv[1], "r");
    if (inputFile == NULL) {
        printf("Error opening input file.\n");
        exit(1);
    }

    FILE *outputFile = fopen(argv[2], "w");
    if (outputFile == NULL) {
        printf("Error opening output file.\n");
        fclose(inputFile);
        exit(1);
    }

    yyin = inputFile;
    yyout = outputFile;
    yylex();

    printf("No of printf statements = %d\nNo of scanf statements = %d\n", pc, sc);

    fclose(inputFile);
    fclose(outputFile);
    return 0;
}

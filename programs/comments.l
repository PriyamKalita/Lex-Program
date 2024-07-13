%{
#include <stdio.h>
#include <stdlib.h>

int com = 0;
%}

%s COMMENT

%%
"/*"               { BEGIN(COMMENT); }
<COMMENT>"*/"      { BEGIN(0); com++; }
<COMMENT>\n        { com++; }
<COMMENT>.         { }
.|\n               { fprintf(yyout, "%s", yytext); }
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

    printf("No of comment lines = %d\n", com);

    fclose(inputFile);
    fclose(outputFile);
    return 0;
}

%{
#include <stdio.h>
#include <stdlib.h>
extern FILE* yyin;  // Declare yyin as an external variable
int declarative_count = 0;
%}

%union {
    char* data_type;
}

%token <data_type> DATA_TYPE
%token IDENTIFIER SEMICOLON

%%
program:
    /* Empty production */
    | program statement
    ;

statement:
    declaration SEMICOLON
    {
        declarative_count++;
    }
    ;

declaration:
    DATA_TYPE IDENTIFIER
    ;

%%

int main(int argc, char** argv) {
    if (argc != 2) {
        printf("Usage: ./declarative_counter <input_file>\n");
        return 1;
    }
    
    FILE* file = fopen(argv[1], "r");
    if (!file) {
        printf("Error opening file.\n");
        return 1;
    }
    
    yyin = file;
    yyparse();
    
    printf("Number of declarative statements: %d\n", declarative_count);
    
    fclose(file);
    return 0;
}

int yyerror(const char* msg) {
    printf("Error: %s\n", msg);
    return 0;
}


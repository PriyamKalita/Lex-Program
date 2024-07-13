%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
void yyerror(char *);
%}

%token INTEGER

%left '+' '-'
%left '*' '/'

%%

expr: INTEGER
    | expr '+' expr
    | expr '-' expr
    | expr '*' expr
    | expr '/' expr
    | '(' expr ')'
    ;

%%

void yyerror(char *s) {
    printf("Error: %s\n", s);
}

int main() {
    yyparse();
    return 0;
}

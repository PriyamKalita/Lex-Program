%{
#include <stdio.h>

int functionCount = 0;
int insideFunction = 0;
%}

%%
"{"     { if (insideFunction) { insideFunction++; } }
"}"     { if (insideFunction) { insideFunction--; } }
        
^[\t ]*([a-zA-Z_][a-zA-Z0-9_]*[\t ]+){0,2}[a-zA-Z_][a-zA-Z0-9_]*[\t ]*\([^;]*\)[\t ]*(\{|;)   { insideFunction = 1; functionCount++; }

.       ;
%%

int main() {
    yylex();
    printf("Number of functions: %d\n", functionCount);
    return 0;
}

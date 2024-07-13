%{
#include <stdio.h>
int c = 0, w = 0, s = 0, l = 0;
%}

WORD [^ \t\n,\.:]+
EOL [\n]
BLANK [ ]
%%
{WORD} { w++; c += yyleng; }
{BLANK} { s++; }
{EOL} { l++; }
. { c++; }
%%
int yywrap()
{
    return 1;
}

int main(int argc, char *argv[])
{
    if (argc != 2)
    {
        printf("Usage: <./a.out> <sourcefile>\n");
        exit(0);
    }

    FILE *yyin = fopen(argv[1], "r");
    yyrestart(yyin);
    yylex();

    if (c > 0)
        l++; // Increment line count if there is at least one character

    printf("Number of characters: %d\nNumber of words: %d\nNumber of spaces: %d\nNumber of lines: %d\n", c, w, s, l);

    fclose(yyin);

    return 0;
}

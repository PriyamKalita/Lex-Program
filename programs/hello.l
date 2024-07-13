%{
#include <stdio.h>
int count = 0;
%}
%%
hello   {count++;}
.       {}
%%
int main()
{
    yylex();
    printf("Number of occurrences of 'hello': %d\n", count);
    return 0;
}

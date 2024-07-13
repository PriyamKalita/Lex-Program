%{
#include <stdio.h>
%}

%option noyywrap

%%
[-+]?[1-9][0-9]{0,2}      { /* Integer between -1000 and 1000 */
                              int num = atoi(yytext);
                              if (num > 0)
                                  printf("Positive Integer: %d\n", num);
                              else
                                  printf("Negative Integer: %d\n", num);
                            }
[-+]?0                     { /* Integer 0 */
                              printf("Zero: %s\n", yytext);
                            }
[-+]?[1-9][0-9]{0,2}\.[0-9]+ { /* Fraction between -1000 and 1000 */
                                double fraction = atof(yytext);
                                if (fraction > 0)
                                    printf("Positive Fraction: %f\n", fraction);
                                else
                                    printf("Negative Fraction: %f\n", fraction);
                              }
.                           {}

%%
int main() {
    yylex();
    return 0;
}

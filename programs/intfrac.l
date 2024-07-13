%{
#include <stdio.h>
int pos_int_count = 0;
int neg_int_count = 0;
int pos_frac_count = 0;
int neg_frac_count = 0;
%}
%%
[-+]?[1-9][0-9]{0,2}\b    { /* Match positive/negative integers */
                                int num = atoi(yytext);
                                if (num > 0) pos_int_count++;
                                else if (num < 0) neg_int_count++;
                            }
[-+]?0\.[0-9]*\b           { /* Match positive/negative fractions */
                                float num = atof(yytext);
                                if (num > 0) pos_frac_count++;
                                else if (num < 0) neg_frac_count++;
                            }
%%
int main()
{
    yylex();
    printf("Positive integers: %d\n", pos_int_count);
    printf("Negative integers: %d\n", neg_int_count);
    printf("Positive fractions: %d\n", pos_frac_count);
    printf("Negative fractions: %d\n", neg_frac_count);
    return 0;
}

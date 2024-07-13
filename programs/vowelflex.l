%{
#include <stdio.h>
int vowel_count = 0;
int consonant_count = 0;
int number_count = 0;
%}
%%
[aeiou][aeiou]   {vowel_count++;}
[bcdfghjklmnpqrstvwxyz][bcdfghjklmnpqrstvwxyz]   {consonant_count++;}
[0-9]            {number_count++;}
.                {}
%%
int main()
{
    yylex();
    printf("Total number of vowels followed by another vowel: %d\n", vowel_count);
    printf("Total number of consonants followed by another consonant: %d\n", consonant_count);
    printf("Total number of numbers: %d\n", number_count);
    return 0;
}

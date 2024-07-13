%{
#include <stdio.h>
%}

%option noyywrap

%%
[aeiouAEIOU]([aeiouAEIOU]) { printf("Vowels followed by another vowel: %s\n", yytext); }
[bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ]([bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ]) { printf("Consonants followed by another consonant: %s\n", yytext); }
[0-9]+ { printf("Number: %s\n", yytext); }
. {}

%%
int main() {
    yylex();
    return 0;
}

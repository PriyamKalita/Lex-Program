%{
    #include<stdio.h>
    int v=0,c=0;
%}

%%
[aeiouAEIOU]    {v++;}
[^aeiouAEIOU]   {c++;}
%%

int main()
{
    printf("Enter string: ");
    yylex();
    printf("Number of vowels: %d, consonants: %d",v,c);
}

int yywrap()
{
    return 1;
} 

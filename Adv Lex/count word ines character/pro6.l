/* count no of comment lines in a C program */

%{
    #include<stdio.h>
    int nc=0;
%}
%%
"/*"[a-zA-Z0-9 \t\n]*"*/" {nc++;}
"//"[a-zA-Z0-9 \t]*"\n" {nc++;}
%%
int main(int argc, char*argv[])
{
    if(argc==2)
    {
        yyin=fopen(argv[1], "r");
    }
    else
    {
        printf("Enter the input:\n");
        yyin=stdin;
    }
    yylex();
    printf("No of comment lines are:%d", nc);
}
int yywrap()
{
    return 1;
}
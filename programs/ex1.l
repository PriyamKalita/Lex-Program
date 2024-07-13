%%
"+" {printf("PLUS");}
[0-9]* {printf("Number");}
%%
main(int argc, char** argv)
{
	yylex();
}

%{

#include <stdio.h>
#include "calc.tab.h"

%}

%option yylineno

%%

"print"     {  return(TOK_PRINT);}

[0-9]+		{
				yylval.float_val = atof(yytext);	
				//printf("value is %s\n",yytext);
				return TOK_FLOAT;
			}

[0-9]+\.[0-9]+ 	{	

					yylval.float_val = atof(yytext);
					//printf("decimal value is %s\n",yytext);
					return TOK_FLOAT;
				}

";"	{	return(TOK_SEMICOLON);	}
"+"	{	return(TOK_ADD);	}
"-"	{	return(TOK_SUB);	}
[ \t\n] 	{ 
			}
.		{ printf("Lexical analysis error: %s \n", yytext); }

%%

int yywrap(void){
	return 1;
}

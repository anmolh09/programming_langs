%{

#include <stdio.h>
extern int yylineno;

%}

%token TOK_SEMICOLON TOK_ADD TOK_SUB TOK_NUM TOK_PRINT TOK_FLOAT

%start stmt
/*%type <int_val> expr TOK_NUM*/

%union {
	float float_val;
}

%type <float_val> expr TOK_FLOAT

%left TOK_ADD TOK_SUB
%left TOK_MUL TOK_DIV

%%

stmt:  
		| stmt expr_stmt ;

expr_stmt:
	   		 TOK_PRINT expr TOK_SEMICOLON 
	   			{
					printf("%.6f  \n", $2);
				} 
;

expr: 	 
	expr expr TOK_ADD
	  {
		$$ = $1 + $2;
	  }
	| expr  expr TOK_SUB
	  {
		$$ = $1 - $2;
	  }
	| TOK_FLOAT
		{
		$$ = $1;	
		}

;


%%

int yyerror(char *s)
{
	printf("Parsing error: line %d \n",yylineno);
	return 0;
}

int main()
{
   yyparse();
   return 0;
}

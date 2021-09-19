
calc.exe :  lex.yy.c calc.tab.c
	gcc -o calc calc.tab.c lex.yy.c -lfl

lex.yy.c : calc.l
	flex -l calc.l

calc.tab.c : calc.y
	bison -dv calc.y
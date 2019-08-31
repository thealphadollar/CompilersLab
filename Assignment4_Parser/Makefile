
a.out: lex.yy.o y.tab.o ass3_17CS30033.o
	gcc lex.yy.o y.tab.o ass3_17CS30033.o -lfl

ass3_17CS30033.o: ass3_17CS30033.c
	gcc -c ass3_17CS30033.c

lex.yy.o: lex.yy.c
	gcc -c lex.yy.c

y.tab.o: y.tab.c
	gcc -c y.tab.c

lex.yy.c: ass3_17CS30033.l y.tab.h
	flex ass3_17CS30033.l

y.tab.c: ass3_17CS30033.y
	yacc -dtv ass3_17CS30033.y -W

y.tab.h: ass3_17CS30033.y
	yacc -dtv ass3_17CS30033.y -W

clean:
	rm lex.yy.c y.tab.c y.tab.h lex.yy.o y.tab.o ass3_17CS30033.o y.output a.out

test: 
	./a.out < ass3_17CS30033_test.c
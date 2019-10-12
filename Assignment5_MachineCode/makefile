a.out: y.tab.o lex.yy.o asgn4_17CS10045.o 
	gcc asgn4_17CS10045.o lex.yy.o y.tab.o -lfl

lex.yy.c: asgn4_17CS10045.l y.tab.h
	flex asgn4_17CS10045.l

y.tab.c: asgn4_17CS10045.y
	yacc -dtv asgn4_17CS10045.y

asgn4_17CS10045.o: asgn4_17CS10045.c y.tab.h
	gcc -c asgn4_17CS10045.c

y.tab.h: asgn4_17CS10045.y
	yacc -dtv asgn4_17CS10045.y

lex.yy.o: lex.yy.c
	gcc -c lex.yy.c

y.tab.o:    y.tab.c y.tab.h
	gcc -c y.tab.c

clean:
	rm a.out lex.yy.o asgn4_17CS10045.o lex.yy.c y.tab.c y.tab.h y.tab.o y.output
	
test:
	./a.out < asgn4_17CS10045_test.c
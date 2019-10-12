test: a.out
	./a.out < asgn5_17CS10045_test1.c > asgn5_17CS10045_quads1.out
	./a.out < asgn5_17CS10045_test2.c > asgn5_17CS10045_quads2.out
	./a.out < asgn5_17CS10045_test3.c > asgn5_17CS10045_quads3.out
	./a.out < asgn5_17CS10045_test4.c > asgn5_17CS10045_quads4.out
	./a.out < asgn5_17CS10045_test5.c > asgn5_17CS10045_quads5.out


a.out: lex.yy.o y.tab.o asgn5_17CS10045_translator.o
	g++ lex.yy.o y.tab.o asgn5_17CS10045_translator.o -lfl

asgn5_17CS10045_translator.o: asgn5_17CS10045_translator.cxx asgn5_17CS10045_translator.h
	g++ -c asgn5_17CS10045_translator.h
	g++ -c asgn5_17CS10045_translator.cxx

lex.yy.o: lex.yy.c
	g++ -c lex.yy.c

y.tab.o: y.tab.c
	g++ -c y.tab.c

lex.yy.c: asgn5_17CS10045.l y.tab.h asgn5_17CS10045_translator.h
	flex asgn5_17CS10045.l

y.tab.c: asgn5_17CS10045.y
	yacc -dtv asgn5_17CS10045.y -W

y.tab.h: asgn5_17CS10045.y
	yacc -dtv asgn5_17CS10045.y -W
	
clean:
	rm lex.yy.c y.tab.c y.tab.h lex.yy.o y.tab.o asgn5_17CS10045_translator.o y.output a.out
asmGenerate: asmGenerator
	./asmGenerator 1 > asgn5_17CS10045_quads1.out
	./asmGenerator 2 > asgn5_17CS10045_quads2.out
	./asmGenerator 3 > asgn5_17CS10045_quads3.out
	./asmGenerator 4 > asgn5_17CS10045_quads4.out
	./asmGenerator 5 > asgn5_17CS10045_quads5.out

asmGenerator: lex.yy.o y.tab.o asgn5_17CS10045_translator.o ass6_17CS30033_target_translator.o
	g++ lex.yy.o y.tab.o asgn5_17CS10045_translator.o \
	ass6_17CS30033_target_translator.o -lfl -o asmGenerator

ass6_17CS30033_target_translator.o: ass6_17CS30033_target_translator.cxx
	g++ -c ass6_17CS30033_target_translator.cxx

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
	rm lex.yy.c y.tab.c y.tab.h lex.yy.o y.tab.o asgn5_17CS10045_translator.o test1 test2 test3 test4 test5 y.output asmGenerator ass6_17CS30033_target_translator.o libass3_17CS30033.a asgn5_17CS10045_1.o ass3_17CS30033.o asgn5_17CS10045_2.o asgn5_17CS10045_3.o asgn5_17CS10045_4.o asgn5_17CS10045_5.o *.asm *.out *.gch

#Test files
test1: asgn5_17CS10045_1.o libass3_17CS30033.a
	gcc asgn5_17CS10045_1.o -o test1 -L. -lass3_17CS30033
asgn5_17CS10045_1.o: myl.h
	gcc -c asgn5_17CS10045_1.asm

test2: asgn5_17CS10045_2.o libass3_17CS30033.a
	gcc asgn5_17CS10045_2.o -o test2 -L. -lass3_17CS30033
asgn5_17CS10045_2.o: myl.h
	gcc -Wall -c asgn5_17CS10045_2.asm

test3: asgn5_17CS10045_3.o libass3_17CS30033.a
	gcc asgn5_17CS10045_3.o -o test3 -L. -lass3_17CS30033
asgn5_17CS10045_3.o: myl.h
	gcc -Wall -c asgn5_17CS10045_3.asm

test4: asgn5_17CS10045_4.o libass3_17CS30033.a
	gcc asgn5_17CS10045_4.o -o test4 -L. -lass3_17CS30033
asgn5_17CS10045_4.o: myl.h
	gcc -Wall -c asgn5_17CS10045_4.asm

test5: asgn5_17CS10045_5.o libass3_17CS30033.a
	gcc asgn5_17CS10045_5.o -o test5 -L. -lass3_17CS30033
asgn5_17CS10045_5.o: myl.h
	gcc -Wall -c asgn5_17CS10045_5.asm


libass3_17CS30033.a: ass3_17CS30033.o
	ar -rcs libass3_17CS30033.a ass3_17CS30033.o

ass3_17CS30033.o: ass3_17CS30033.c myl.h
	gcc -Wall -c ass3_17CS30033.c
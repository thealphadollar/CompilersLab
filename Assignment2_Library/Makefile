a.out: main.o ass2_17CS30033.a
	gcc main.o -L. -l ass2_17CS30033

main.o: main.c myl.h
	gcc -Wall -c main.c

ass2_17CS30033.a: ass2_17CS30033.o
	ar -rcs ass2_17CS30033.a ass2_17CS30033.o

ass2_17CS30033.o: ass2_17CS30033.c myl.h
	gcc -Wall -c ass2_17CS30033.c

clean:
	rm a.out main.o ass2_17CS30033.a ass2_17CS30033.o
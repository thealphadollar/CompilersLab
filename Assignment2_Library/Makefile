a.out: main.o libass2_17CS30033.a
	cc main.o -L. -lass2_17CS30033

main.o: main.c myl.h
	cc -Wall -c main.c

libass2_17CS30033.a: ass2_17CS30033.o
	ar -rcs libass2_17CS30033.a ass2_17CS30033.o

ass2_17CS30033.o: ass2_17CS30033.c myl.h
	cc -Wall -c ass2_17CS30033.c

clean:
	rm a.out main.o libass2_17CS30033.a ass2_17CS30033.o
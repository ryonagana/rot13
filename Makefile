CC=cc
CFLAGS=-Wall -Wextra -pedantic -Ofast -Werror


all: rot13.o
	$(CC) $(CFLAGS) -o rot13 $^



rot13.o : rot13.c
	$(CC) $(CFLAGS) -c $^

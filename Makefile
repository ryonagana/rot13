CC=cc
CFLAGS=-Wall -Wextra -pedantic -O2 -Werror


all:
	$(CC) $(CFLAGS) -o rot13 rot13.c

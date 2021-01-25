CC=cc
CFLAGS=-Wall -Wextra -pedantic -Os


all:
	$(CC) $(CFLAGS) -o rot13 rot13.cc

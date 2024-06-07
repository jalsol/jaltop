CC=g++
CFLAGS=-std=c++20 -Wall -Wextra -g -O2

all:
	$(CC) $(CFLAGS) -o build/jaltop src/main.cpp

clean:
	rm build/*

CC=g++
CFLAGS=-std=c++20 -Wall -Wextra -g
INCLUDE=-I external/cpp-httplib -I external/libjaltop/include

all:
	$(CC) $(CFLAGS) $(INCLUDE) -o build/jaltop src/main.cpp -ljaltop

clean:
	rm build/*

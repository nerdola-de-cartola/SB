CC = clang
CFLAGS = -Wall -Wextra -no-pie

all: copy.s copy.c main.c
	$(CC) $^ -o main.exe $(CFLAGS)

run: main.exe
	./main.exe my_file.txt
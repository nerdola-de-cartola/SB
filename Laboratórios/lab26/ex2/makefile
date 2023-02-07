CFLAGS = -Wall -Wextra -g3 -no-pie
CC = clang
OUTPUT = main.exe

c: process.c
	$(CC) $^ -o $(OUTPUT) $(CFLAGS)

assembly: process.s
	$(CC) $^ -o $(OUTPUT) $(CFLAGS)

run: $(OUTPUT)
	./$(OUTPUT)
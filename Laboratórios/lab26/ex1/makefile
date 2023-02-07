CFLAGS = -Wall -Wextra -g3 -no-pie

c: main.c collect.c
	clang main.c collect.c -o main.exe $(CFLAGS)

assembly: main.c collect.s
	clang main.c collect.s -o main.exe $(CFLAGS)

run: main.exe
	./main.exe
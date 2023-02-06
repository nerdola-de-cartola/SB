c: main.c sum.c
	clang main.c sum.c -o main.exe -Wall -Wextra -g3 -no-pie

assembly: main.c sum.s
	clang main.c sum.s -o main.exe -Wall -Wextra -g3 -no-pie

run: main.exe
	./main.exe


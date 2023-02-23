CC = clang
CFLAGS = -Wall -Wextra

main.exe: calc.o main.o
	$(CC) $^ -o $@ $(CFLAGS) -no-pie

calc.o: calc.c
	$(CC) $^ -o $@ $(CFLAGS) -c

main.o: main.c
	$(CC) $^ -o $@ $(CFLAGS) -c

run: main.exe
	./main.exe

clear:
	rm *.o
	rm *.exe
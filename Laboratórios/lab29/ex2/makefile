CC = clang
CFLAGS = -Wall -Wextra

main.exe: opcode.o
	$(CC) $^ -o $@ $(CFLAGS) -no-pie

add.o: add.c
	$(CC) $^ -o $@ $(CFLAGS) -c

opcode.o: opcode.c
	$(CC) $^ -o $@ $(CFLAGS) -c

run: main.exe
	./main.exe

clear:
	rm *.o
	rm *.exe
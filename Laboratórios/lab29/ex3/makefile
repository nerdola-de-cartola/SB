CC = clang
CFLAGS = -Wall -Wextra

main.exe: displace.o
	$(CC) $^ -o $@ $(CFLAGS) -no-pie

process.o: process.c
	$(CC) $^ -o $@ $(CFLAGS) -c

displace.o: displace.c
	$(CC) $^ -o $@ $(CFLAGS) -c

run: main.exe
	./main.exe

clear:
	rm *.o
	rm *.exe
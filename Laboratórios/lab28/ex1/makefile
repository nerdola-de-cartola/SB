CC = gcc
CFLAGS = -Wall -Wextra
EXE = main4.exe

all: $(EXE)

temp1.o: temp1.c
	$(CC) $^ -o $@ $(CFLAGS) -c

temp2.o: temp2.c
	$(CC) $^ -o $@ $(CFLAGS) -c

$(EXE): temp1.o temp2.o
	$(CC) $^ -o $@ $(CFLAGS)

run: $(EXE)
	./$(EXE)
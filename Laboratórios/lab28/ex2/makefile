CC = clang
CFLAGS = -Wall -Wextra
EXE = main2.exe

all: $(EXE)

vetor.o: vetor.c
	$(CC) $^ -o $@ $(CFLAGS) -c

$(EXE): vetor.o
	$(CC) $^ -o $@ $(CFLAGS)

run: $(EXE)
	./$(EXE)
#include <stdlib.h>

#include <stdio.h>

#include <fcntl.h>

#include <unistd.h>


#include "copy.h"


//----------------------------------------------------------------------------

// Considere:

//   * size_t  -> unsigned long

//   * ssize_t -> long


#define TAM 128


int main (int argc, char** argv)

{

  char buf[TAM];

  ssize_t len;


  handler_t input;

  handler_t output;


  // Input será do arquivo

  input.buffer = buf;

  input.size = TAM;


  // Output é para a tela

  // Compartilha o buffer com a entrada

  output.fd = STDOUT_FILENO;

  output.buffer = buf;

  output.size = TAM;


  if (argc != 2) {

    fprintf(stderr, "Usage: %s <nome_arquivo>\n", argv[0]);

    return 1;

  }


  // Abre o arquivo

  myopen(&input, argv[1], O_RDONLY);

  if (input.fd < 0) {

    perror("[ERRO] Falha na abertura do arquivo: ");

    return 1;

  }


  // Exibe o conteúdo do arquivo na tela

  while ((len = myread(&input)) > 0) {

    if (mywrite(&output, len) != len) {

      perror("[ERRO] Falha na escrita do arquivo: ");

      return 1;

    }

  }


  myclose(&input);


  return 0;

}
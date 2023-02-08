#include <stdlib.h>

#include <stdio.h>

#include <fcntl.h>

#include <unistd.h>


#include "copy.h"


//----------------------------------------------------------------------------

// Considere:

//   * size_t  -> unsigned long

//   * ssize_t -> long

/*
void myopen(handler_t *h, const char *filename, int flags)

{

 h->fd = open(filename, flags);

}


ssize_t myread(handler_t *h)

{

 return read(h->fd, h->buffer, h->size);

}


ssize_t mywrite(handler_t *h, size_t count)

{

 return write(h->fd, h->buffer, count);

}


int myclose(handler_t *h)

{

 return close(h->fd);

}
*/
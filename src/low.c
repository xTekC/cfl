#include <stdio.h>

int hello_from_c(void) {
  printf("Hello from C!\n");
  fflush(stdout); // Flush stdout to ensure immediate output
  return 0;
}

int main(void) // keep main for testing
{
  hello_from_c();
  return 0;
}

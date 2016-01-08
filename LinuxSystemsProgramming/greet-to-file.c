#include <fcntl.h>
#include <error.h>
#include <stdlib.h>

int main(void)
{
  int fd;
  fd = open("foo", O_WRONLY | O_CREAT, 0644);
  if (fd < 0) {
    perror("Error");
    exit(1);
  }
  write(fd, "Hahaha\n", 7);
  close(fd);

  return 0;
}


#include <stdio.h>
#define samples 20000

int main(void)
{
  int numbers[samples] = {'\0'};
  int i = 0;
  FILE *file;

  if (file = fopen("test.txt", "r"))
  {
    while (fscanf(file, "%d", &numbers[i]) != EOF)
    {
      i++;
    }
    fclose(file);

    numbers[i] = '\0';

    for (i = 0; numbers[i] != '\0'; i++){
      printf("%d\n", numbers[i]);
  }

  return 0;
}
}

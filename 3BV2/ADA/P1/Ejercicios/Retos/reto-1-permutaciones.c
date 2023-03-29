#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void swap(char *x, char *y)
{
    char temp = *x;
    *x = *y;
    *y = temp;
}

void permutaciones(char *str, int inicio, int fin)
{
    if (inicio == fin)
    {
        printf("%s\n", str);
    }
    else
    {
        for (int i = inicio; i <= fin; i++)
        {
            swap((str + i), (str + inicio));
            permutaciones(str, inicio + 1, fin);
            swap((str + i), (str + inicio)); // backtrack
        }
    }
}

int main()
{
    char input[100];
    printf("Introduce una cadena de caracteres: ");
    scanf("%s", input);

    int n = strlen(input);

    printf("Las permutaciones posibles de '%s' son:\n", input);
    permutaciones(input, 0, n - 1);

    return 0;
}
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/**
 * @brief Escribir un programa en C que encuentra una subcadena dentro de otra usando recursividad,
la primera cadena es de tamaño n y la segunda es de tamaño m, donde

ejemplo:
mamemi
mimamamemima

particular:
ooohaaa
ooooooooohaoohaaoooooooooooohaaaa

Encontrar una expresion (funcion que relacione a n y m) aritmetica

Hacer el programa y encontrar la complejidad
de modo tal de que se construya un arbol de llamadas recursivas

 *
 */

/**
 * @brief Función recursiva que busca una subcadena dentro de una cadena
 *
 * @param str
 * @param substr
 * @param n
 * @param m
 * @return int
 */
int findSubstring(char *str, char *substr, int n, int m)
{
    printf("\n(n: %d, m: %d) ", n, m);
    if (m == 0)
    {
        return 1;
    }
    else if (n == 0)
    {
        return 0;
    }
    else if (str[n - 1] == substr[m - 1])
    {
        return findSubstring(str, substr, n - 1, m - 1);
    }
    else
    {
        return findSubstring(str, substr, n - 1, m);
    }
}

/**
 * @brief Función principal
 *
 * @return int
 */
int main()
{
    char str[100], substr[100];
    printf("Ingrese la cadena principal: ");
    scanf("%s", str);
    printf("Ingrese la subcadena: ");
    scanf("%s", substr);
    int n = strlen(str);
    int m = strlen(substr);
    int result = findSubstring(str, substr, n, m);
    if (result)
    {
        printf("La subcadena \"%s\" se encuentra dentro de \"%s\"\n", substr, str);
    }
    else
    {
        printf("La subcadena \"%s\" no se encuentra dentro de \"%s\"\n", substr, str);
    }
    return 0;
}

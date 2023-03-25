#include <stdio.h>

void recursivo(int);

int main()
{
    int i;
    puts("Introduce un numero entero para la variable i: ");
    // obtenemos el valor de i
    scanf("%i", &i);
    recursivo(i);

    return 0;
}

/**
 * @brief funcion recursiva que imprime los numeros de i a 1 de manera descendente y de 1 a i de manera ascendente
 *
 * @param i
 */
void recursivo(int i)
{
    if (i > 0)
    {
        printf("%d ", i);
        recursivo(i - 1);
        printf("%d ", i);
    }
}

/**
 * Analisis de la funcion recursiva
 * tomando i como 3
 * 3 r(2) 3 => 321123
 * 2 r(1) 2 => 2112
 * 1 r(0) 1 => 11
 *
 * Para saber el numero de veces que se ejecuta la funcion recursiva
 * en este caso al hcaer el arbol de llamadas obtenemos que la complejidad es de
 * 3n+1
 *
 */
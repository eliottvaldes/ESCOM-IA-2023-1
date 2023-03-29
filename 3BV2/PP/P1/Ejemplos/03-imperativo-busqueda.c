#include <stdio.h>

/**
 * @brief Este programa tiene como objetivo verificar si un elemento se encuentra en un array
 *
 */

// declaramos el prototipo de la funcion buscar
int buscar(int[], int);

// funcion principal
int main()
{
    // declaramos el array
    int array[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    // declaramos el elemento a buscar
    int elemento;

    // mostramos el array
    printf("El array es: ");
    for (int i = 0; i < 10; i++)
    {
        printf("%d ", array[i]);
    }

    // pedimos el elemento a buscar
    printf("\nIngrese el elemento a buscar: ");
    scanf("%d", &elemento);
    // declaramos la variable que almacena el resultado de la busqueda
    // verificamos que el elemento se encuentre en el array
    int resultado = buscar(array, elemento);
    // imprimimos el resultado

    // si el resultado es -1, el elemento no se encuentra en el array
    // si el resultado es mayor o igual a 0, el elemento se encuentra en el array y mostramos la posicion
    resultado == -1
        ? printf("El elemento %d no se encuentra en el array", elemento)
        : printf("El elemento %d se encuentra en la posicion %d", elemento, resultado);

    return 0;
}

/**
 * @brief Funcion que busca un elemento en un array -> usa busqueda secuencial
 *
 * @param array
 * @param elemento
 * @return int
 */
int buscar(int array[], int elemento)
{
    int i;
    for (i = 0; i < 10; i++)
    {
        if (array[i] == elemento)
        {
            return i;
        }
    }
    return -1;
}
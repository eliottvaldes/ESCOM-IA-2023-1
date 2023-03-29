/**
 * @file 02-bubbleSort.c
 * @author eliottvaldes
 * @brief Ordenar un array de menor a mayor con el algoritmo bubble sort
 * @version 0.1
 * @date 2023-03-22
 *
 * @copyright Copyright (c) 2023
 *
 */

#include <stdio.h>

// prototipos de funciones
void bubbleSort(int array[], int n);
void imprimirArray(int array[], int n);

// funcion principal
int main()
{
    // declaramos el array
    int array[] = {10, 5, 3, 7, 2, 1, 9, 8, 4, 6};
    // declaramos el tamaño del array
    int n = sizeof(array) / sizeof(array[0]);

    // mostramos el array
    printf("El array es: ");
    imprimirArray(array, n);

    // ordenamos el array
    bubbleSort(array, n);

    // mostramos el array ordenado
    printf("\nEl array ordenado es: ");
    imprimirArray(array, n);

    return 0;
}

/**
 * @brief Funcion que ordena un array de menor a mayor
 *
 * @param array
 * @param n
 */
void bubbleSort(int array[], int n)
{
    int i, j, aux;
    for (i = 0; i < n; i++)
    {
        for (j = 0; j < n - 1; j++)
        {
            if (array[j] > array[j + 1])
            {
                aux = array[j];
                array[j] = array[j + 1];
                array[j + 1] = aux;
            }
        }
    }
}

/**
 * @brief Funcion que imprime un array
 *
 * @param array
 * @param n
 */
void imprimirArray(int array[], int n)
{
    int i;
    for (i = 0; i < n; i++)
    {
        printf("%d ", array[i]);
    }
}
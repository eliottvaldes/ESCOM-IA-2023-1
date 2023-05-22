/**
 * @file revertArray.c
 * @author @eliottvaldes
 * @brief Examen - Codigo que contiene una funcion recursiva que invierte el orden de los elementos de un array excepto el ultimo elemento
 * @version 0.1
 * @date 2023-05-22
 *
 * @copyright Copyright (c) 2023
 *
 */
#include <stdio.h>

/**
 * @brief Intercambia el valor de dos variables enteras
 *
 * @param a
 * @param b
 */
void swap(int *a, int *b)
{
    int temp = *a;
    *a = *b;
    *b = temp;
}

/**
 * @brief Invierte el orden de los elementos de un array excepto el ultimo elemento
 *
 * @param arr -> Array a invertir
 * @param start -> Indice del primer elemento
 * @param end -> Indice del ultimo elemento
 */
void invertir(int arr[], int start, int end)
{
    // Caso base (array de 1 elemento)
    if (start >= end - 1)
    {
        return;
    }
    // hacemos swap de los dos elementos extremos
    swap(&arr[start], &arr[end - 2]);
    // llamamos recursivamente a la funcion
    invertir(arr, start + 1, end - 1);
}

/**
 * @brief Imprime un array
 *
 * @param arr
 * @param n
 */
void printArray(int arr[], int n)
{
    int i;
    for (i = 0; i < n; i++)
        printf("%d ", arr[i]);
    printf("\n");
}

/**
 * @brief Función principal
 *
 * @return int
 */
int main()
{
    // definimos el array por defecto para centrarnos en la funcion invertir
    int arr[] = {4, 2, 5, 7, 3, -1};
    int n = sizeof(arr) / sizeof(arr[0]);

    printf("Array original: ");
    printArray(arr, n);

    invertir(arr, 0, n);

    printf("Array invertido: ");
    printArray(arr, n); // El array invertido essperado es: {3, 7, 5, 2, 4, -1}

    return 0;
}

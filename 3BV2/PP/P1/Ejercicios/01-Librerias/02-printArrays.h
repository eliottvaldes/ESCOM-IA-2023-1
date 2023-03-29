/**
 * @file 02-printArrays.c
 * @author your name (you@domain.com)
 * @brief Archivo que contiene una unica funcion exclusiva para imprimir un arreglo de tamaño n de datos tipo int
 * @version 0.1
 * @date 2023-03-24
 *
 * @copyright Copyright (c) 2023
 *
 */


/**
 * @brief Funcion que imprime un arreglo de tamaño n de datos tipo int
 *
 * @param arr
 * @param n
 */
void printArray(int *arr, int n) {
    printf("[");
    for (int i = 0; i < n; i++) {
        printf("%d", arr[i]);
        if (i < n - 1) {
            printf(", ");
        }
    }
    printf("]\n");
}
/**
 * @file 01-generateArrays.c
 * @author Eliottvaldes@hotmail.com
 * @brief Este archivo tiene una unica funcion exclusiva para crear un arreglo de tamaño n dado por el usuario
 * @version 0.1
 * @date 2023-03-24
 *
 * @copyright Copyright (c) 2023
 *
 */

/**
 * @brief Funcion que genera un arreglo (coleeccion) de tamaño de numeros entre 0 - 999 y lo retorna
 *
 * @param n
 * @return int*
 */
int* generateArray(int n) {
    int *arr = (int *) malloc(n * sizeof(int));

    for (int i = 0; i < n; i++) {
        arr[i] = rand() % 1000; // Generar números aleatorios entre 0 y 999
    }

    return arr;
}

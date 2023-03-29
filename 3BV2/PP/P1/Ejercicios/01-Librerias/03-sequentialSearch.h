/**
 * @file 03-sequentialSearch.c
 * @author your name (you@domain.com)
 * @brief Archivo que contiene una unica funcion exclusiva para buscar un elemento en un arreglo de tamaño n de datos tipo int
 * @version 0.1
 * @date 2023-03-24
 *
 * @copyright Copyright (c) 2023
 *
 */

/**
 * @brief Funcion que busca un elemento en un arreglo de tamaño n de datos tipo int
 *
 * @param arr  -> arreglo de tamaño n
 * @param x  -> elemento a buscar
 * @return int -> posicion del elemento en el arreglo
 */

int sequentialSearch(int *arr, int n, int valor) {
    for (int i = 0; i < n; i++) {
        if (arr[i] == valor) {
            return i;
        }
    }
    return -1;
}

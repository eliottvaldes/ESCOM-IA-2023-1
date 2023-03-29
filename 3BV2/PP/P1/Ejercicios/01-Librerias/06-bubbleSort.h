/**
 * @file 06-bubbleSort.h
 * @author your name (you@domain.com)
 * @brief  Archivo que contiene una unica funcion exclusiva para buscar un elemento en un arreglo de tamaño n de datos tipo int
 * @version 0.1
 * @date 2023-03-28
 * 
 * @copyright Copyright (c) 2023
 * 
 */

/**
 * @brief Función que ordena un arreglo de tamanio n de datos tipo int
 * Ordenamiento burbuja
 * 
 * @param arr 
 * @param n 
 */
void bubbleSort(int *arr, int n) {
    for (int i = 0; i < n - 1; i++) {
        for (int j = 0; j < n - i - 1; j++) {
            if (arr[j] > arr[j + 1]) {
                int temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
            }
        }
    }
}

/**
 * @file 04-sortArray.c
 * @author your name (you@domain.com)
 * @brief Archivo que contiene una unica funcion exclusiva para ordenar un arreglo de tamaño n de datos tipo int
 * @version 0.1
 * @date 2023-03-28
 *
 * @copyright Copyright (c) 2023
 *
 */

// craemos el prototipo de la funcion par ordenamiento por quicksort
void quicksort(int *arr, int n);

/**
 * @brief Funcion que ordena un arreglo de tamaño n de datos tipo int
 * ordenamiento por quicksort
 *
 * @param arr  -> arreglo de tamaño n
 * @param n -> tamaño del arreglo
 */
void quicksort(int *arr, int n)
{
    int i, j, pivot, temp;
    // si el arreglo tiene menos de 2 elementos no se ordena
    if (n < 2)
    {
        return;
    }
    // definimos el pivote
    pivot = arr[n / 2];
    // iteramos sobre el arreglo
    for (i = 0, j = n - 1;; i++, j--)
    {
        // buscamos un elemento mayor al pivote
        while (arr[i] < pivot)
        {
            i++;
        }
        // buscamos un elemento menor al pivote
        while (arr[j] > pivot)
        {
            j--;
        }
        // si i es mayor o igual a j, significa que ya se ordeno el arreglo
        if (i >= j)
        {
            break;
        }
        // intercambiamos los elementos
        temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
    }
    // llamamos recursivamente a la funcion para ordenar los subarreglos
    quicksort(arr, i);
    quicksort(arr + i, n - i);
}
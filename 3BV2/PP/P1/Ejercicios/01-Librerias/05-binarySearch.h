/**
 * @file 05-binarySearch.c
 * @author your name (you@domain.com)
 * @brief  Archivo que contiene una unica funcion exclusiva para buscar un elemento en un arreglo de tamaño n de datos tipo int
 * @version 0.1
 * @date 2023-03-28
 * 
 * @copyright Copyright (c) 2023
 * 
 */

/**
 * @brief Funcion que busca un elemento en un arreglo ordenado de tamaño n de datos tipo int
 * busqueda binaria
 * 
 * @param arr  -> arreglo de tamaño n
 * @param n -> tamaño del arreglo
 * @param elemento -> elemento a buscar
 * @return int -> posicion del elemento en el arreglo
 */

int binarySearch(int *arr, int n, int elemento)
{
    int inicio = 0;
    int fin = n - 1;
    int medio;
    while (inicio <= fin)
    {
        medio = (inicio + fin) / 2;
        if (arr[medio] == elemento)
        {
            return medio;
        }
        else if (arr[medio] < elemento)
        {
            inicio = medio + 1;
        }
        else
        {
            fin = medio - 1;
        }
    }
    return -1;
}
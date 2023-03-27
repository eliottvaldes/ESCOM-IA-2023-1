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

// creamos el prototipo de la funcion
int *generar_arreglo(int n);

/**
 * @brief Funcion que genera un arreglo (coleeccion) de tamaño de numeros entre 0 - 999 y lo retorna
 *
 * @param n
 * @return int*
 */
int *generar_arreglo(int n)
{
    // creamos el arreglo de longitud n dada por el usuario
    int *arr = (int *)malloc(n * sizeof(int));

    // llenamos el arreglo con datos aleatorios
    for (int i = 0; i < n; i++)
    {        
        arr[i] = rand() % 1000; // Generar números aleatorios entre 0-999 y lo guardamos en la posicion actual del arreglo
    }

    // regresesa el arreglo
    return arr;
}
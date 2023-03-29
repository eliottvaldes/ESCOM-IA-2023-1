/**
 * @file main.c
 * @author your name (you@domain.com)
 * @brief Archivo que contiene la llamada a las funcioens predefinidas
 * @version 0.1
 * @date 2023-03-28
 *
 * @copyright Copyright (c) 2023
 *
 */

// Librerias
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

// librerias propias
#include "01-generateArrays.h"
#include "02-printArrays.h"
#include "03-sequentialSearch.h"
#include "04-quickSort.h"
#include "05-binarySearch.h"
#include "06-bubbleSort.h"

/**
 * @brief Función principal que llama a las funciones predefinidas en las librerias
 *
 * @return int
 */

int main()
{
    clock_t inicio, fin; // Variables para medir el tiempo de ejecución
    int n, valor, resultado;

    inicio = clock(); // Inicio del tiempo de ejecución

    // Pedir el tamanio del arreglo
    printf("\n\tIngrese el tamanio del arreglo: ");
    scanf("%d", &n);

    // Generar el arreglo
    int *arr = generateArray(n);

    // Imprimir el arreglo generado
    printf("\nArreglo generado: ");
    printArray(arr, n);

    // Ordenar el arreglo
    bubbleSort(arr, n);
    printf("\nArreglo ordenado: ");
    printArray(arr, n);

    // Pedir el valor a buscar
    printf("\n\tIngrese el valor a buscar: ");
    scanf("%d", &valor);

    // Buscar el valor en el arreglo
    resultado = sequentialSearch(arr, n, valor);
    if (resultado != -1)
    {
        printf("\nEl valor %d fue encontrado en la posición %d.\n", valor, resultado);
    }
    else
    {
        printf("\nEl valor %d no se encuentra en el arreglo.\n", valor);
    }

    fin = clock(); // Fin del tiempo de ejecución

    printf("Tiempo total de ejecución: %f segundos\n", (double)(fin - inicio) / CLOCKS_PER_SEC);
    free(arr); // Liberar la memoria del arreglo

    return 0;
}
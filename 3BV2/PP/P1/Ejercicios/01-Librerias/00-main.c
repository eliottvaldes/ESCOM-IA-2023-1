/**
 * @file main.c
 * @author your name eliottvaldes@hotmail.com
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
#include <stdbool.h>

// librerias propias
#include "01-generateArrays.h"
#include "02-printArrays.h"
#include "03-sequentialSearch.h"
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
    // definir un boolean tamanioValido como false
    bool tamnioValido = false;

    inicio = clock(); // Inicio del tiempo de ejecución


    // validaciones para el tamanio del arreglo
    while (!tamnioValido)
    {
        // Pedir el tamanio del arreglo
        printf("\n\tIngrese el tamanio del arreglo: ");
        scanf("%d", &n);

        // validar que el numero ingresado no sea negavo o cero o mayor a 100,000
        if (n >= 1 && n < 100000)
        {
            tamnioValido = true;
        }
        else
        {
            printf("El numero ingresado %d no es valido. Verifica que sea una cantidad mayor a 0 y menor que 100,000 e intente de nuevo \n", n);
        }
    }

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
        printf("\nEl valor %d fue encontrado en la posicion %d.\n", valor, resultado);
    }
    else
    {
        printf("\nEl valor %d no se encuentra en el arreglo.\n", valor);
    }

    fin = clock(); // Fin del tiempo de ejecución

    printf("\n***Tiempo total de ejecucion: %f segundos\n", (double)(fin - inicio) / CLOCKS_PER_SEC);
    free(arr); // Liberar la memoria del arreglo

    return 0;
}
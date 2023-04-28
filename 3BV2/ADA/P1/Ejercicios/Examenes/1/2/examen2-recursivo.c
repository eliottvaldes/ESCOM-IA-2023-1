/**
 * @file examen2.c
 * @author Eliot Valdes
 * @brief Codigo que cuenta la incidencia de cada caracter de una cadena de texto ingresada por el usuario
 * @version 0.1
 * @date 2023-04-27
 *
 * @copyright Copyright (c) 2023
 *
 */

#include <stdio.h>

// definimos el prorotipo de funciones
void countIncidences(char userString[], int incidences[], int i);
void printIncidences(int incidences[], int i);

// definimos la funcion principal
void main()
{
    // declaramos la cedena de caracteres con tamaño definido
    char userString[100];
    // declaramos un arreglo de 256 posiciones para guardar la incidencia de cada caracter y lo inicializamos en 0
    // usamos 256 porque es el numero de caracteres que puede tener una cadena de texto en codigo ASCII
    int incidences[256] = {0};
    // declaramos variable axiliar para la recursividad
    int aux = 0;

    // solicitamos la cadena al usuario y la obtenemos usando gets
    puts("\nIngrese una cadena de texto: ");
    gets(userString);

    // agrupamos las incidencias de los caracteres de la cadena usando una funcion recursiva countIncidences
    countIncidences(userString, incidences, aux);

    // mostramos las incidencias de cada caracter de la cadena usando la funcion recursiva printIncidences
    puts("\n\nLas incidencias de cada caracter son: ");
    puts("\nCaracter\tIncidencia");
    printIncidences(incidences, aux);
}

/**
 * @brief Funcion recursiva que agrupa las incidencias de cada caracter de una cadena de texto
 * 
 * @param userString -> direccion de memoria de la cadena de texto en formato de arreglo de caracteres
 * @param incidences -> direccion de memoria del arreglo de incidencias en formato de arreglo de enteros 
 * @param i -> variable auxiliar para detener la recursividad
 */
void countIncidences(char userString[], int incidences[], int i)
{
    // verificamos que el el caracter en la posicion i sea el caracter nulo (fin de la cadena) para deneter la recursion
    if (userString[i] == '\0')
    {
        return;
    }
    // obtenemos el valor del caracter en codigo ASCII (entero) y lo usamos como indice para el arreglo de incidencias
    incidences[userString[i]]++;
    // llamamos a la funcion recursivamente pero eliminando la cabeza de la cadena
    countIncidences(userString, incidences, i + 1);
}

/**
 * @brief Funcion recursiva que muestra en pantalla las incidencias de cada caracter de una cadena de texto
 * 
 * @param incidences -> direccion de memoria del arreglo de incidencias en formato de arreglo de enteros
 * @param i -> variable auxiliar para detener la recursividad
 */
void printIncidences(int incidences[], int i)
{
    // detener la recursion cuando el caracter sea 256. o sea, cuando se acaben los caracteres del codigo ASCII
    if (i == 256)
    {
        return;
    }
    // verificamos que el valor del caracter en la posicion i sea mayor a 0 para mostrarlo en pantalla 
    // (ya que hay caracteres que no aparecen en la cadena)
    if (incidences[i] > 0)
    {
        // mostramos el caracter y su incidencia
        // usamos %c para mostrar el caracter de la tabla ASCII y %d para mostrar el contador entero de la incidencia en ese indice
        printf("\nEl caracter: '%c'\taparece: %d veces", i, incidences[i]);
    }
    // llamamos a la funcion recursivamente
    printIncidences(incidences, i + 1);
}
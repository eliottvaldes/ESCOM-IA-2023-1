/**
 * @file 01-subcadena.c
 * @author eliottvaldes@hotmail.com
 * @brief Programa en C que encuentra una subcadena dentro de otra usando recursividad,
 * la primera cadena es de tamaño n y la segunda es de tamaño m, donde
 * - ejemplo:
 * cadena principal -> mimamamemima
 * subvadena a buscar -> mamemi
 *
 * - ejemplo particular:
 * cadena principal -> ooooooooohaoohaaoooooooooooohaaaa
 * subcaden a buscar -> ooohaaa
 *
 * Encontrar una expresion (funcion que relacione a n y m) aritmetica
 * Hacer el programa y encontrar la complejidad
 * de modo tal de que se construya un arbol de llamadas recursivas

 * @version 0.1
 * @date 2023-03-28
 *
 * @copyright Copyright (c) 2023
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// definimos el prototipo de la función recursiva findSubstring
int findSubstring(char *cadenaPrincipal, char *subcadenaABuscar, int n, int m);

/**
 * @brief Función principal
 *
 * @return int 0
 */
int main()
{
    char cadenaPrincipal[100], subcadenaABuscar[100];
    printf("Ingrese la cadena principal: ");
    scanf("%s", cadenaPrincipal);
    printf("Ingrese la subcadena: ");
    scanf("%s", subcadenaABuscar);
    int longitudPrincipal = strlen(cadenaPrincipal);
    int longitudCadenaBuscar = strlen(subcadenaABuscar);

    // si la longitud de la subcadena es mayor que la longitud de la cadena principal, la subcadena no se puede encontrar dentro de la cadena principal
    if (longitudCadenaBuscar > longitudPrincipal)
    {
        printf("La subcadena \"%s\" es mas grande que la cadena principal \"%s\", por lo tanto no se encuentra\n", subcadenaABuscar, cadenaPrincipal);
        // terminar el programa
        return 0;
    }

    // llamar a la función recursiva findSubstring
    int result = findSubstring(cadenaPrincipal, subcadenaABuscar, longitudPrincipal, longitudCadenaBuscar);
    if (result)
    {
        printf("La subcadena \"%s\" se encuentra dentro de \"%s\"\n", subcadenaABuscar, cadenaPrincipal);
    }
    else
    {
        printf("La subcadena \"%s\" no se encuentra dentro de \"%s\"\n", subcadenaABuscar, cadenaPrincipal);
    }
    return 0;
}

/**
 * @brief Función recursiva que busca una subcadena dentro de una cadena
 *
 * @param cadenaPrincipal -> cadena principal en la que se va a buscar la subcadena
 * @param subcadenaABuscar -> subcadena a buscar dentro de la cadena principal
 * @param n -> tamaño de la cadena principal
 * @param m -> tamaño de la subcadena
 * @return int 1 si la subcadena se encuentra dentro de la cadena, 0 en caso contrario
 */

int findSubstring(char *cadenaPrincipal, char *subcadenaABuscar, int n, int m)
{
    // mostrar el caracter actual de la cadena principal y la subcadena y la longitud de la cadena principal y la subcadena
    printf("Comparando \"%c\" con \"%c\". Longitud de la cadena principal: %d, longitud de la subcadena: %d \n", cadenaPrincipal[n - 1], subcadenaABuscar[m - 1], n, m);

    // si la longitud de la subcadena es igual a cero, significa que se ha encontrado la subcadena dentro de la cadena
    if (m == 0)
    {
        return 1;
    }
    // si la longitud de la cadena principal es igual a cero, significa que se ha llegado al final de la cadena y la subcadena no se ha encontrado
    else if (n == 0)
    {
        return 0;
    }
    // si el caracter actual de la cadena principal es igual al caracter actual de la subcadena
    else if (cadenaPrincipal[n - 1] == subcadenaABuscar[m - 1])
    {
        // comparar el siguiente caracter de la cadena principal con el siguiente caracter de la subcadena
        return findSubstring(cadenaPrincipal, subcadenaABuscar, n - 1, m - 1);
    }
    // si el caracter actual de la cadena principal no es igual al caracter actual de la subcadena
    else
    {
        // comparar el siguiente caracter de la cadena principal con el primer caracter de la subcadena
        return findSubstring(cadenaPrincipal, subcadenaABuscar, n - 1, m);
    }
}

/**
 * FUNCIONAMIENTO DESGLOSADO DE LA FUNCIÓN findSubstring
 * La función escrita en C es una función recursiva llamada findSubstring que busca una subcadena dentro de una cadena.
 * La función toma cuatro parámetros: un puntero a una cadena de caracteres cadenaPrincipal, un puntero a una cadena de caracteres subcadenaABuscar, y dos enteros n y m.
 *
 * La función comienza imprimiendo en pantalla los valores comparados y la longitud de la cadena principal y la subcadena.
 *
 * Luego, la función comprueba si m es igual a cero.
 *     - Si lo es, esto significa que se ha encontrado la subcadena dentro de la cadena y la función devuelve 1.
 *     - En caso contrario, si n es igual a cero, esto significa que se ha llegado al final de la cadena y la subcadena no se ha encontrado, por lo que la función devuelve 0.
 *
 * * Si ninguna de las condiciones anteriores se cumple,
 * la función comprueba si el carácter actual de la cadena cadenaPrincipal es igual al carácter actual de la subcadena subcadenaABuscar.
 *     - Si lo es, la función llama a sí misma con los parámetros n - 1 y m - 1, lo que significa que se están comparando los siguientes caracteres en la cadena y la subcadena.
 *     - Si los caracteres no son iguales, la función llama a sí misma con los parámetros n - 1 y m, lo que significa que la subcadena aún no se ha encontrado y se sigue comparando la cadena con la subcadena.
 *
 * En resumen, la función findSubstring utiliza la técnica de recursividad para comparar cada carácter de la cadena cadenaPrincipal con los caracteres de la subcadena subcadenaABuscar, de manera que si todos los caracteres de subcadenaABuscar coinciden con una subcadena de cadenaPrincipal, la función devuelve 1, de lo contrario devuelve 0.
 *
 *
 * La expresion aritmetica que relaciona a n y m es: n*m
 * La complejidad de la función findSubstring es O(n*m) ya que se realiza una comparación de cada caracter de la cadena principal con cada caracter de la subcadena, por lo que la complejidad es O(n*m) donde n es el tamaño de la cadena principal y m es el tamaño de la subcadena.
 */

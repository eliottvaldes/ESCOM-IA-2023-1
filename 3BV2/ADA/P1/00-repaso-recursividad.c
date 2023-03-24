#include <stdio.h>

// definimos el prototipo de la función que es de tipo void y recibe un int
void recursivo(int);
void recursivo2(int);

/**
 * @brief funcion principal que ejecuta el programa
 *
 */
void main()
{
    int i;
    puts("Introduce un numero entero para la variable i: ");
    // obtenemos el valor de i
    scanf("%i", &i);
    recursivo(i);
}



/**
 * @brief funcion recursiva que imprime los numeros de i a 1 de manera descendente
 * Tomar en cuenta que toda funcion recurisa debe tener una condicion de salida IF
 * Siempre definir un valor limite al que se quiere alcanzar IF(CONDICION LIMITE)
 * 
 * TRUCO -> utiliza un debugger para ver como se ejecuta la funcion recursiva como printf
 * @param i 
 */
void recursivo(int i)
{
    // verificamos si i es mayor a 0
    if (i > 0)
    {
        // imprimimos el valor de i
        printf("%d ", i);
        // llamamos a la funcion recursiva
        recursivo(i - 1);
    }
}


/**
 * @brief funcion recursiva que imprime los numeros de 1 a i de manera ascendente
 * 
 * @param i 
 */
void recursivo2(int i)
{
    // verificamos si i es mayor a 0
    if (i > 0)
    {
        // llamamos a la funcion recursiva
        recursivo(i - 1);
        // imprimimos el valor de i
        printf("%d ", i);
    }
}


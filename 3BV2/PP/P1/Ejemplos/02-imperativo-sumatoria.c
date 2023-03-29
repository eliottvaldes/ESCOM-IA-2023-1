#include <stdio.h>

// declaramos el prototipo de la funcion
int suma(int[]);
// declaramos la resta
int resta(int[]);


// funcion principal
int main()
{
    // declaramos el array
    int array[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

    // la suma
    printf("La suma es: %d \r ", suma(array));
    // la resta
    printf("La resta es: %d \r ", resta(array));
}

/**
 * @brief Funcion que suma los elementos de un array
 * 
 * @param array 
 * @return int 
 */
int suma(int array[])
{
    int i, suma = 0;
    for (i = 0; i < 10; i++)
    {
        suma += array[i];
    }
    return suma;
}

/**
 * @brief Funcion que resta los elementos de un array
 * 
 * @param array 
 * @return int 
 */
int resta(int array[])
{
    int i, resta = 0;
    for (i = 0; i < 10; i++)
    {
        resta -= array[i];
    }
    return resta;
}
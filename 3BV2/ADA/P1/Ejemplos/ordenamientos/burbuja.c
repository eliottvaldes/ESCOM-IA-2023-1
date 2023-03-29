/**
 * @file burbuja.c
 * @author your name (you@domain.com)
 * @brief programa que contiene las funciones para realizar un ordenamiento por burbuja
 * @version 0.1
 * @date 2023-03-27
 *
 * @copyright Copyright (c) 2023
 *
 */

// crear la funcion de ordenamiento por burbuja
// recibe un arreglo de enteros y el tamaño del arreglo
// retorna el arreglo ordenado
int *burbuja(int arreglo[], int tamano)
{
    int i, j, aux;
    for (i = 0; i < tamano; i++)
    {
        for (j = 0; j < tamano - 1; j++)
        {
            if (arreglo[j] > arreglo[j + 1])
            {
                aux = arreglo[j];
                arreglo[j] = arreglo[j + 1];
                arreglo[j + 1] = aux;
            }
        }
    }
    return arreglo;
}

// funcion para leer un arreglo de enteros
void leerArreglo(char vec[])
{
    if (vec[0] == '\0')
    {
        vec[0] = '\0';
    }
    else
    {
        printf("%c", vec[0]);
        leerArreglo(vec + 1);
    }
}

// funcion para imprirmir un arreglo de enteros
void imprimirArreglo(int arreglo[], int tamano)
{
    int i;
    for (i = 0; i < tamano; i++)
    {
        printf("%d ", arreglo[i]);
    }
    printf("\n ");
}

// function para crear un arreglo de enteros de tamaño n entre 0 y 100
int *crearArreglo(int tamano)
{
    int i;
    int *arreglo = (int *)malloc(tamano * sizeof(int));
    for (i = 0; i < tamano; i++)
    {
        arreglo[i] = rand() % 100;
    }
    return arreglo;
}

// funcion principal
void main()
{
    int tamano = 10;
    int *arreglo = crearArreglo(tamano);
    printf("Arreglo original: ");
    imprimirArreglo(arreglo, tamano);
    arreglo = burbuja(arreglo, tamano);
    printf("Arreglo ordenado: ");
    imprimirArreglo(arreglo, tamano);
}
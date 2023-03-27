/**
 * @file 01-busqueda-binaria.c
 * @author your name (you@domain.com)
 * @brief Programa que contiene las funciones para realizar una busqueda binaria
 * @version 0.1
 * @date 2023-03-27
 *
 * @copyright Copyright (c) 2023
 *
 */

void main()
{
}

// craer la funcion de busqueda binaria
// recibe un arreglo de enteros y el tamaño del arreglo
// retorna la posicion del elemento buscado
// si no lo encuentra retorna -1
int busquedaBinaria(int arreglo[], int tamano, int elemento)
{
    int inicio = 0;
    int fin = tamano - 1;
    int mitad = 0;
    while (inicio <= fin)
    {
        mitad = (inicio + fin) / 2;
        if (arreglo[mitad] == elemento)
        {
            return mitad;
        }
        else if (arreglo[mitad] < elemento)
        {
            inicio = mitad + 1;
        }
        else
        {
            fin = mitad - 1;
        }
    }
    return -1;
}
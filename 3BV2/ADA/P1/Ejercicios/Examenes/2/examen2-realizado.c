/**
 * @file examen2-realizado.c
 * @author eliottvaldes@hotmail.com
 * @brief Código del examen realizado en clase.
 * El programa debe de recibir un arreglo de enteros hasta el el usuario ingrese un -1
 * El programa debe crear un arreglo donde se encuentre la sumatoria de los elementos del arreglo original.
 * para obtener la sumatoria se debe obtener el elemento i, y recorrer todo el arreglo para unicamente sumar lo valores dela rreglo que sean igual a i
 * ejemplo:
 * arregloUsuario=  [1,2,3,1,2,3,3,-1]
 * arregloSUmatoria=[2,4,9,2,4,9,9,-1]
 * @version 0.1
 * @date 2023-05-04
 *
 * @copyright Copyright (c) 2023
 *
 */

#include <stdio.h>

// definimos nuestros prototipos de funciones
void leerArreglo(int arregloUsuario[], int i);
void imprimirArreglo(int arregloUsuario[], int i);
void mapeoPrincipal(int arregloUsuario[], int i, int arregloSumatoria[], int aux);
void sumarTerminos(int arregloUsuario[], int i, int valorActual, int arregloSumatoria[], int aux);

// definimos nuestra funcion main
int main()
{
    // declaramos un arreglo de enteros de 100 elementos
    int arregloUsuario[100];
    // declaramos un arreglo de enteros de 100 elementos para la sumatoria
    int arregloSumatoria[100] = {0};
    // declaramos un par de variables auxiliares
    int aux = 0;
    int i = 0;

    // solicitamos al usuario que ingrese numeros enteros y detenemos cuando el usuario ingrese un -1
    puts("Ingresa numeros enteros, para detener la captura ingresa -1");
    // mandamos a llamar a la funcion recursiva lleerArreglo que guarda los datos del usuario en el arregloUsuario
    leerArreglo(arregloUsuario, i);

    // imprimimos el arregloUsuario
    puts("Arreglo usuario");
    imprimirArreglo(arregloUsuario, i);

    // mandamos a llamar a la funcio que mapea el arreglo usuario
    mapeoPrincipal(arregloUsuario, i, arregloSumatoria, aux);

    // imprimimos el arregloSumatoria
    puts("\nArreglo sumatoria");
    imprimirArreglo(arregloSumatoria, i);
}

// definimos nuestra funcion recursiva leerArreglo
void leerArreglo(int arregloUsuario[], int i)
{
    // declaramos una variable para guardar el valor que ingrese el usuario
    int valor;
    // leemos el valor que ingresa el usuario
    scanf("%d", &valor);
    // si el valor es igual a -1 detenemos la funcion
    if (valor == -1)
    {
        // guardamos un -1 en el arregloUsuario
        arregloUsuario[i] = -1;
        return;
    }
    // si el valor es diferente de -1 guardamos el valor en el arregloUsuario
    arregloUsuario[i] = valor;
    // mandamos a llamar a la funcion recursiva leerArreglo
    leerArreglo(arregloUsuario, i + 1);
}

// definimos una funcion recursiva imprimirArreglo
void imprimirArreglo(int arregloUsuario[], int i)
{
    // si el valor es igual a -1 detemos la recursion
    if (arregloUsuario[i] == -1)
    {
        return;
    }

    // imprimimos el valor del arregloUsuario en la posicion i
    printf("%d ", arregloUsuario[i]);

    // mandamos a llamar a la funcion recursiva imprimirArreglo
    imprimirArreglo(arregloUsuario, i + 1);
}

/**
 * @brief funcion recursiva que mapea el arregloUsuario
 * Internamente recorre el arregloUsuario y manda a llamar a la funcion recursiva sumarTerminos
 *
 * @param arregloUsuario
 * @param i
 * @param arregloSumatoria
 * @param aux
 */
void mapeoPrincipal(int arregloUsuario[], int i, int arregloSumatoria[], int aux)
{
    // definimos el fin de la funcion recursiva
    if (arregloUsuario[i] == -1)
    {
        return;
    }
    else
    {
        // mandamos a llamar a la funcion recursiva sumarTerminos
        sumarTerminos(arregloUsuario, i, arregloUsuario[i], arregloSumatoria, aux);

        // mandamos a llamar a la funcion recursiva mapeoPrincipal
        mapeoPrincipal(arregloUsuario, i + 1, arregloSumatoria, aux);
    }
}

/**
 * @brief funcion recursiva que mapea el arregloUsuario
 * Internamente recorre el arregloUsuario y suma los valores que sean iguales a valorActual para guardarlos en el arregloSumatoria
 *
 * @param arregloUsuario
 * @param i
 * @param valorActual
 * @param arregloSumatoria
 * @param aux
 */
void sumarTerminos(int arregloUsuario[], int i, int valorActual, int arregloSumatoria[], int aux)
{

    if (arregloUsuario[aux] == -1)
    {
        arregloSumatoria[aux] = -1;
        return;
    }
    else
    {
        if (arregloUsuario[aux] == valorActual)
        {
            // agregamos el valor del arregloUsuario en la posicion i al arregloSumatoria en la posicion
            arregloSumatoria[i] += valorActual;
        }
        sumarTerminos(arregloUsuario, i, valorActual, arregloSumatoria, aux + 1);
    }
}
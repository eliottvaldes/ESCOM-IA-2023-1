/**
 * @file examen2.c
 * @author Eliot Valdes (you@domain.com)
 * @brief Codigo que cuenta la incidencia de cada caracter de una cadena de texto ingresada por el usuario
 * @version 0.1
 * @date 2023-04-27
 * 
 * @copyright Copyright (c) 2023
 * 
 */

#include <stdio.h>

void main(){
    // declaramos las variables, en este caso el arreglo de caracteres
    // declaramos la cedena de caracteres
    char cadena[100];
    // declaramos un arreglo de 256 posiciones para guardar la incidencia de cada caracter y lo inicializamos en 0
    int incidencia[256] = {0};



    // solicitamos la cadena al usuario usando gets
    puts("\nIngrese una cadena de texto: ");
    gets(cadena);
    
    // recorremos con un for la cadena de caracteres
    for (int i = 0; i < 100; i++){
        incidencia[cadena[i]]++;
    }


    // mostramos las incidencias de cada caracter
    puts("\n\n\tLas incidencias de cada caracter son: ");
    puts("\n\t\tCaracter\t\tIncidencia");
    // recorremos el arreglo de incidencias
    for(int i = 0; i < 256; i++){
        // si la incidencia es mayor a 0, mostramos el caracter y la incidencia
        if(incidencia[i] > 0){
            printf("\n\t\tEl caracter: %c\t\t\t aparece: %d veces", i, incidencia[i]);
        }
    }

}
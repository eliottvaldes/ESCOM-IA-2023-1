#include <stdio.h>

// declaracion de prototipo de funcion
char menor(char *);

// llamada a la funcion inicial
/**
 * @brief Funcion principal
 *
 */
void main()
{
    // definimos un arre
    char palab[256];
    puts("Teclea una palabra: ");
    // habilita el buffer de entrada hasta encontrar un salto de linea con el enter
    // sustituye el enter por caracter nulo '\0'
    gets(palab);
    // imprime el caracter mas pequeno de la cadena llamando a la funcion menor
    printf("\n\n\tEl caracter mas pequenio es: %c", menor(palab));
}

/**
 * @brief Funcion recursiva que regresa el caracter mas pequeno de una cadena
 *
 * @param pal
 * @return char
 */
char menor(char *pal)
{
    // imprime la cadena que se esta procesando
    // m(s) sirve para ver el proceso de la funcion
    printf("\nm(%s) \t", pal);
    // accede al contenido de la direccion de memoria a la que apunta pal
    // si es el ultimo caracter de la cadena regresa el caracter
    if (*(pal + 1) == '\0')
    {
        return (*pal);
    }
    else
    {

        // compara el caracter actual con el siguiente usando el codigo ASCII
        // si el caracter actual es menor que el siguiente regresa el caracter actual
        if (*pal < menor(pal + 1))
        {
            return (*pal);
        }
        else
        {
            return (menor(pal + 1));
        }
    }
}

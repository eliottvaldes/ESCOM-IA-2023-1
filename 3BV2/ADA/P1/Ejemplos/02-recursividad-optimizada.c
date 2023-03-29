#include <stdio.h>

// Declaración del prototipo de función
char menor(char *);

// Función principal
int main()
{
    char palabra[256];
    printf("Introduce una palabra:");
    // Obtiene la cadena ingresada por el usuario y la guarda en la variable "palabra"
    gets(palabra);

    // Imprime el carácter más pequeño de la cadena llamando a la función "menor"
    printf("\nEl caracter mas pequenio es: %c", menor(palabra));
    return 0;
}

/**

    @brief Función recursiva que encuentra el carácter más pequeño de una cadena

    @param cadena La cadena de caracteres a evaluar

    @return char El carácter más pequeño en la cadena
    */
// Función optimizada
char menor(char *pal) {

    printf("\nm(%s) \t", pal);

    // Caso base: si se encuentra el último carácter de la cadena, regresa dicho carácter
    if (*(pal + 1) == '\0') {
        return *pal;
    }
    
    // Obtiene el carácter más pequeño del resto de la cadena, excluyendo el primer carácter
    char siguiente_menor = menor(pal + 1);
    
    // Compara el carácter actual con el carácter más pequeño del resto de la cadena
    // usando el código ASCII, y regresa el más pequeño de los dos
    return (*pal < siguiente_menor) ? *pal : siguiente_menor;
}
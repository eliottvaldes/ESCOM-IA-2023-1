#include <stdio.h>

// definimos el prototipo de la función que es de tipo in y recibe un apuntador
// secesor recibe una direccion de memoria y devuelve un entero
int sucesor(int *);

/**
 * @brief funcion principal que ejecuta el programa
 * 
 */
void main()
{

    // declaramos neustras variables
    int i, *apu;
    apu = &i;

    puts("Introduce un numero entero para la variable i: ");

    // guardamos usando el apuntador que apunta a la direccion de memoria de i
    scanf("%i", apu);
    // linea equivalente a la anterior
    // scanf("%i", &i);

    i = sucesor(&i);
    // mostramos el resultado
    printf("El sucesor de i es: %d", i);

    // ahora usamos el apundaor para llamar a la funcion sucesor
    i = sucesor(apu);
    // mostramos el resultado
    printf("El sucesor del sucesor de i es: %d", i);
}

// definimos nuestra funcion sucesor
/**
 * @brief funcion que recibe una direccion de memoria y devuelve un entero
 *
 * @param direccion -> almacena la direccion de memoria de una variable (pueder ser el &i o apu)
 * @return int ->
 */
int sucesor(int *direccion)
{
    // incrementamos el valor de la direccion de memoria que apunta el apuntador en un elemrno
    // obtiene el valor en forma normal de lado derecho y lo guardamos al lado izquierdo
    // de lado derecho -> obtenemos el contenido del lugar al que apunta la variable y le suma uno (ejemplo 7+1=8)
    // de lado izquiero -> guarda el valor de lado derecho en la direccion de memoria que apunta el apuntador
    *direccion = *direccion + 1;

    // regresamos el contenido de la direccion de memoria que apunta el apuntador
    return *direccion;
}
#include <stdio.h>

void main()
{

    // definimos nuestras variables
    // sabemos que es una declaracion de variable por el tipo de dato al inicio de la linea
    int i, *apu;
    // apuntamos nuestro apundador a la dirección de memoria de i
    apu = &i;

    // solicitamos un numero enter
    puts("Introduce un numero entero: ");
    // leemos el valor y lo guardamos en la dirección de memoria de i
    scanf("%i", apu);
    // otra forma de asignar el valor es directamente asignalo a i
    // scanf("%i", &i);

    // mostramos el valor del numero

    // primero usamos la variable i
    // como usualmente lo hacemos
    printf("\nEl valor del numero usando la variable i es: %d", i);

    // mostramos el valor de i usando el apuntador
    // el puntero apunta a la dirección de memoria de i y obtiene el contenido de esa dirección y lo trasnforma en un valor %d
    printf("\nEl valor del numero usando el apuntador es: %d", *apu);

    // msotramos la direcciond memoria usando el apuntador
    // mostramos directamente la direccion de memoria de apu
    printf("\nLa direccion de memoria de i es: %p", apu);

    // mostramos la dirección de memoria de i
    // usamos el operador & para obtener la dirección de memoria de i
    printf("\nLa direccion de memoria de i es: %p", &i);
}
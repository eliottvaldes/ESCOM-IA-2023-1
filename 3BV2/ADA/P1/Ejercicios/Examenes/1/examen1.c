//
#include <stdio.h>

// definimos los prototipos
void mapeoPrincipal(char *, char *); // funcion primera
void buscarIgual(char, char *); // funcion segunda
void moverPosicion(char *); // funcion tercera

// definir la funcion main()
void main()
{
    // definir las variables que vamos a utilizar
    char cadenaCorta[256], cadenaPrincipal[256];

    // solicitar la cadena principal
    printf("Ingrese la cadena principal: ");
    gets(cadenaPrincipal);

    // solicitar la cadena corta
    printf("Ingrese la cadena corta: ");
    gets(cadenaCorta);

    // llamar a la funcion mapeoPrincipal
    mapeoPrincipal(cadenaCorta, cadenaPrincipal);
}

/**
 * @brief Visita cade elemento de la cadenaCorta y lo manda junto con la cadenaPrincipal a la funcion buscarIgual
 *
 * @param cadenaCorta
 * @param cadenaPrincipal
 */
void mapeoPrincipal(char *cadenaCorta, char *cadenaPrincipal)
{

    // verificar si de la cadena corta es el ultimo elemtno
    if (*cadenaCorta == '\0')
    {
        return;
    }
    else
    {
        // llamanos a la funcion buscarIgual para que busque en la cadenaPrincipal
        // mandamos el caracter de la cadena corta y el apuntador de la cadenaPrincipal
        buscarIgual(*cadenaCorta, cadenaPrincipal);

        // volvemos a llamar a la funcion mapeoPrincipal pero quitando la primer posicion de la cadena corta
        // y mandamos la cadena principal
        mapeoPrincipal(cadenaCorta + 1, cadenaPrincipal);
    }
}

/**
 * @brief Busca el caracter recibido en la cedenaPrincipal y si lo encuentra llama a la funcion moverPosicion
 *
 * @param caracter a buscar en la cadena principal
 * @param cadenaPrincipal de caracteres
 */
void buscarIgual(char caracter, char *cadenaPrincipal)
{

    // definimos el freno de la recursion
    // caso 1: cuando se ha recorrido la cadenaPrincipal y no hay coincidencias
    // caso 2: cuando se ha encontrado una coincidencia y llamamos a la funcion moverPosicion
    if (*cadenaPrincipal == '\0')
    {
        return;
    }
    else
    {
        if (caracter = *cadenaPrincipal)
        {
            // llamamos a la funcion moverPosicion
            moverPosicion(cadenaPrincipal);
        }
        else
        {
            // volvemos a llamar a la funcion buscarIgual pero quitando la primer posicion de la cadena principal
            buscarIgual(caracter, cadenaPrincipal + 1);
        }
    }
}

/**
 * @brief Recorre cada ekemento de la cadenaPrincipal hacia la izquierda desde la posicion recibida
 *
 */
void moverPosicion(char *cadenaPrincipal)
{
    // definimos el freno de la recursion
    if (*cadenaPrincipal == '\0')
    {
        return;
    }
    else
    {
        // movemos el caracter de la posicion actual a la izquierda
        *cadenaPrincipal = *(cadenaPrincipal + 1);
        // volvemos a llamar a la funcion moverPosicion pero quitando la primer posicion de la cadena principal
        moverPosicion(cadenaPrincipal + 1);
    }
}
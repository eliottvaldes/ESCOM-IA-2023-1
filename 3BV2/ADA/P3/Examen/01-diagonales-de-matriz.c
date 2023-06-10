#include <stdio.h>

/**
 * @brief Funcion que calcula la diagonal derecha del tablero de ajedrez
 *
 * @param columna
 * @param renglon
 * @return int
 */
int diagonalDerecha(int columna, int renglon)
{
    return (columna + renglon - 1);
}

/**
 * @brief Funcion que calcula la diagonal izquierda del tablero de ajedrez
 *
 * @param columna
 * @param renglon
 * @return int -> regresa la cantidad de diagonales existentes
 */
int diagonalIzquierda(int columna, int renglon)
{
    // verificacion de que la columna sea mayor que el renglon
    // la verificacion es para que no nos de un numero negativo o que sobrepase el tablero    
    if (renglon < columna)
    {
        // regresamos la columna menos el renglon mas 8
        return (renglon - columna + 8);
    }
    else
    {
        // regresamos la columna menos el renglon mas 8
        return (columna - renglon + 8);
    }
}

// probamos la funcion
int main()
{
    int columna = 1;
    int renglon = 1;
    int di = diagonalIzquierda(columna, renglon);
    int dd = diagonalDerecha(columna, renglon);

    printf("La diagonal derecha de la columna %d y renglon %d es %d\n", columna, renglon, dd);
    printf("La diagonal izquierda de la columna %d y renglon %d es %d\n", columna, renglon, di);
    return 0;
}
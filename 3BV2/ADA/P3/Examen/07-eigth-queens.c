#include <stdio.h>

#define N 8

void imprimirTablero(int tablero[N][N]) {
    int i, j;
    for (i = 0; i < N; i++) {
        for (j = 0; j < N; j++) {
            printf("%2d ", tablero[i][j]);
        }
        printf("\n");
    }
}

int esSeguro(int tablero[N][N], int fila, int columna) {
    int i, j;

    // Verificar si hay una reina en la misma columna
    for (i = 0; i < fila; i++) {
        if (tablero[i][columna] == 1) {
            return 0;
        }
    }

    // Verificar si hay una reina en la diagonal superior izquierda
    for (i = fila, j = columna; i >= 0 && j >= 0; i--, j--) {
        if (tablero[i][j] == 1) {
            return 0;
        }
    }

    // Verificar si hay una reina en la diagonal superior derecha
    for (i = fila, j = columna; i >= 0 && j < N; i--, j++) {
        if (tablero[i][j] == 1) {
            return 0;
        }
    }

    return 1;
}

int resolverTablero(int tablero[N][N], int fila) {
    if (fila >= N) {
        return 1; // Todas las reinas se han colocado correctamente
    }

    int columna;
    for (columna = 0; columna < N; columna++) {
        if (esSeguro(tablero, fila, columna)) {
            tablero[fila][columna] = 1; // Colocar una reina en la posición

            if (resolverTablero(tablero, fila + 1)) {
                return 1; // Solución encontrada
            }

            tablero[fila][columna] = 0; // No es una solución, retroceder (vuelta atrás)
        }
    }

    return 0; // No se pudo colocar una reina en ninguna posición de esta fila
}

int main() {
    int tablero[N][N] = {0}; // Inicializar el tablero con 0

    if (resolverTablero(tablero, 0)) {
        printf("Solución encontrada:\n");
        imprimirTablero(tablero);
    } else {
        printf("No se encontró ninguna solución.\n");
    }

    return 0;
}

#include <stdio.h>
#include <stdlib.h>

#define MAX_ROWS 150
#define MAX_COLS 5

int main()
{
    FILE *fp;
    char filename[] = "bezdekIris.data";
    float data[MAX_ROWS][MAX_COLS];
    int row = 0, col = 0;

    // Abrir el archivo en modo de lectura
    fp = fopen(filename, "r");

    // Leer los datos del archivo y almacenarlos en la matriz
    while (fscanf(fp, "%f, %f, %f, %f, %*s", &data[row][0], &data[row][1], &data[row][2], &data[row][3]) != EOF)
    {
        row++;
    }

    // Cerrar el archivo
    fclose(fp);

    // Imprimir los datos almacenados en la matriz
    for (row = 0; row < MAX_ROWS; row++)
    {
        for (col = 0; col < MAX_COLS; col++)
        {
            // Imprimir el valor de la matriz en la fila y columna actual
            // imprime la ultima columna de la fila como un caracter
            printf("%f ", data[row][col]);                        
            
        }
        printf("\n");
    }

    return 0;
}

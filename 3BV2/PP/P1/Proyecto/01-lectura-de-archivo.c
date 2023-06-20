#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_ROWS 150       // Asume que hay un máximo de 150 filas en el archivo
#define MAX_NAME_LENGTH 20 // Asume que el nombre de la especie tiene una longitud máxima de 20 caracteres

// define una estructura para almacenar los datos de una fila
typedef struct
{
    float val1;
    float val2;
    float val3;
    float val4;
    char name[MAX_NAME_LENGTH];
} Iris;

int main()
{
    // Abre el archivo en modo de lectura
    FILE *file = fopen("bezdekIris.data", "r");
    // verifica si el archivo se abrió correctamente
    if (file == NULL)
    {
        // Imprime un mensaje de error y termina el programa
        printf("No se pudo abrir el archivo.\n");
        return 1;
    }

    // Crea un arreglo de estructuras para almacenar los datos
    Iris irisData[MAX_ROWS];
    int i = 0;

    // Utiliza un bucle while para leer los datos del archivo
    while (fscanf(file, "%f,%f,%f,%f,%19s", &irisData[i].val1, &irisData[i].val2, &irisData[i].val3, &irisData[i].val4, irisData[i].name) != EOF && i < MAX_ROWS)
    {
        i++;
    }

    // Cierra el archivo
    fclose(file);

    // Imprime los datos leídos para verificar
    for (int j = 0; j < i; j++)
    {
        printf("%.1f, %.1f, %.1f, %.1f, %s\n", irisData[j].val1, irisData[j].val2, irisData[j].val3, irisData[j].val4, irisData[j].name);
    }

    // finaliza el programa
    return 0;
}

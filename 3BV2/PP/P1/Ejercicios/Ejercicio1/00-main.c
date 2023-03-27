#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Prototipos de funciones
int* generar_arreglo(int n);
void imprimir_arreglo(int *arr, int n);
int busqueda_secuencial(int *arr, int n, int valor);
void ordenar_arreglo(int *arr, int n);

int main() {
    srand(time(NULL)); // Semilla para números aleatorios
    clock_t inicio, fin; // Variables para medir el tiempo de ejecución
    int n, valor, resultado;

    printf("Ingrese el tamaño del arreglo: ");
    scanf("%d", &n);

    int *arr = generar_arreglo(n);
    
    printf("Arreglo generado: ");
    imprimir_arreglo(arr, n);

    inicio = clock(); // Inicio del tiempo de ejecución

    printf("Ingrese el valor a buscar: ");
    scanf("%d", &valor);

    resultado = busqueda_secuencial(arr, n, valor);
    if (resultado != -1) {
        printf("El valor %d fue encontrado en la posición %d.\n", valor, resultado);
    } else {
        printf("El valor %d no se encuentra en el arreglo.\n", valor);
    }

    ordenar_arreglo(arr, n);

    printf("Arreglo ordenado: ");
    imprimir_arreglo(arr, n);

    fin = clock(); // Fin del tiempo de ejecución

    printf("Tiempo total de ejecución: %f segundos\n", (double)(fin - inicio) / CLOCKS_PER_SEC);
    free(arr); // Liberar la memoria del arreglo

    return 0;
}

int* generar_arreglo(int n) {
    int *arr = (int *) malloc(n * sizeof(int));

    for (int i = 0; i < n; i++) {
        arr[i] = rand() % 100; // Generar números aleatorios entre 0 y 99
    }

    return arr;
}

void imprimir_arreglo(int *arr, int n) {
    printf("[");
    for (int i = 0; i < n; i++) {
        printf("%d", arr[i]);
        if (i < n - 1) {
            printf(", ");
        }
    }
    printf("]\n");
}

int busqueda_secuencial(int *arr, int n, int valor) {
    for (int i = 0; i < n; i++) {
        if (arr[i] == valor) {
            return i;
        }
    }
    return -1;
}

void ordenar_arreglo(int *arr, int n) {
    for (int i = 0; i < n - 1; i++) {
        for (int j = 0; j < n - i - 1; j++) {
            if (arr[j] > arr[j + 1]) {
                int temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
            }
        }
    }
}

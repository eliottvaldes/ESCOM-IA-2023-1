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

    inicio = clock(); // Inicio del tiempo de ejecución

    // Pedir el tamanio del arreglo
    printf("\n\tIngrese el tamanio del arreglo: ");
    scanf("%d", &n);

    // Generar el arreglo
    int *arr = generar_arreglo(n);
    
    // Imprimir el arreglo generado
    printf("\nArreglo generado: ");
    imprimir_arreglo(arr, n);

    // Ordenar el arreglo
    ordenar_arreglo(arr, n);
    printf("\nArreglo ordenado: ");
    imprimir_arreglo(arr, n);

    // Pedir el valor a buscar
    printf("\n\tIngrese el valor a buscar: ");
    scanf("%d", &valor);

    // Buscar el valor en el arreglo
    resultado = busqueda_secuencial(arr, n, valor);
    if (resultado != -1) {
        printf("\nEl valor %d fue encontrado en la posición %d.\n", valor, resultado);
    } else {
        printf("\nEl valor %d no se encuentra en el arreglo.\n", valor);
    }


    fin = clock(); // Fin del tiempo de ejecución

    printf("Tiempo total de ejecución: %f segundos\n", (double)(fin - inicio) / CLOCKS_PER_SEC);
    free(arr); // Liberar la memoria del arreglo

    return 0;
}

/**
 * @brief Función que genera un arreglo de tamanio n con números aleatorios entre 0 y 999
 * 
 * @param n 
 * @return int* 
 */
int* generar_arreglo(int n) {
    int *arr = (int *) malloc(n * sizeof(int));

    for (int i = 0; i < n; i++) {
        arr[i] = rand() % 1000; // Generar números aleatorios entre 0 y 999
    }

    return arr;
}

/**
 * @brief Función que imprime un arreglo de tamanio n
 * 
 * @param arr 
 * @param n 
 */
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

/**
 * @brief Función que busca un elemento en un arreglo de tamanio n de datos tipo int
 * Busqueda secuencial
 * 
 * @param arr 
 * @param n 
 * @param valor 
 * @return int 
 */
int busqueda_secuencial(int *arr, int n, int valor) {
    for (int i = 0; i < n; i++) {
        if (arr[i] == valor) {
            return i;
        }
    }
    return -1;
}


/**
 * @brief Función que ordena un arreglo de tamanio n de datos tipo int
 * Ordenamiento burbuja
 * 
 * @param arr 
 * @param n 
 */
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

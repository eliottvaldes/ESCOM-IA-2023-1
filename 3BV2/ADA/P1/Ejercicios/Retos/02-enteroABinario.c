#include <stdio.h>

/**
 * Función: decimal_a_binario_recursivo
 * -----------------------------------
 * Convierte un número decimal a binario y lo imprime en pantalla con un formato
 * de 8 dígitos, utilizando recursividad.
 *
 * @param n       Número decimal a convertir a binario.
 * @param digitos Cantidad de dígitos binarios restantes por imprimir.
 */
void decimal_a_binario_recursivo(int numeroEntero, int digitos) {

    // mostar avance
    printf("numero(%d) -> modulo2(%d) -> digitos(%d)\n", numeroEntero, numeroEntero % 2, digitos);

    // Caso base: si no quedan dígitos por imprimir, retornar.
    if (digitos == 0) {
        return;
    }

    // Llamada recursiva, dividiendo el número entre 2 y disminuyendo la cantidad
    // de dígitos restantes por imprimir.
    decimal_a_binario_recursivo(numeroEntero / 2, digitos - 1);

    // Imprimir el dígito binario actual (n % 2).
    printf("%d", numeroEntero % 2);
}

int main() {
    int numero;
    int digitos = 8; // Cantidad de dígitos en formato binario

    // Solicitar al usuario un número entero
    printf("Introduce un numero entero: ");
    scanf("%d", &numero);

    // Imprimir el número decimal en formato binario de 8 dígitos
    printf("El numero %d en binario de 8 digitos es: \n", numero);
    decimal_a_binario_recursivo(numero, digitos);

    printf("\n");
    return 0;
}
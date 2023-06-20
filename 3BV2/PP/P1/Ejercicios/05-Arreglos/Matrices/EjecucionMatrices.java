// Clase principal para ejecutar el programa
public class EjecucionMatrices {
    public static void main(String[] args) {
// Crea un objeto de la clase EjercicioMatrices
        EjercicioMatrices em1 = new EjercicioMatrices();
        EjercicioMatrices em2 = new EjercicioMatrices();

        // Imprime la matriz
        System.out.println("Matriz 1:");
        em1.imprimirMatriz();

        // Obtener el elemento máximo
        System.out.println("Elemento máximo de la matriz 1: " + em1.maximo());

        // Obtener el elemento mínimo
        System.out.println("Elemento mínimo de la matriz 1: " + em1.minimo());

        // Devolver el atributo matriz
        double[][] matriz = em1.getMatriz();
        System.out.println("Elemento en la posición (0,0) de la matriz 1: " + matriz[0][0]);

        // Sumar dos matrices
        System.out.println("Suma de matrices:");
        double[][] sumaMatrices = em1.sumarMatrices(em2);
        for (double[] fila : sumaMatrices) {
            for (double elemento : fila) {
                System.out.print(elemento + " ");
            }
            System.out.println();
        }

        // Restar dos matrices
        System.out.println("Resta de matrices:");
        double[][] restaMatrices = em1.restarMatrices(em2);
        for (double[] fila : restaMatrices) {
            for (double elemento : fila) {
                System.out.print(elemento + " ");
            }
            System.out.println();
        }

        // Multiplicar dos matrices
        System.out.println("Multiplicación de matrices:");
        double[][] multiplicacionMatrices = em1.multiplicarMatrices(em2);
        for (double[] fila : multiplicacionMatrices) {
            for (double elemento : fila) {
                System.out.print(elemento + " ");
            }
            System.out.println();
        }        
    }
}


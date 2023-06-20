import java.util.Random;
import java.util.Scanner;

public class EjercicioMatrices {
    private double[][] matriz;

    public EjercicioMatrices() {
        // Crea un escáner para leer la entrada del usuario
        Scanner scanner = new Scanner(System.in);

        // Solicita al usuario que ingrese el número de filas
        System.out.print("Ingrese el número de filas: ");
        int filas = scanner.nextInt();

        // Solicita al usuario que ingrese el número de columnas
        System.out.print("Ingrese el número de columnas: ");
        int columnas = scanner.nextInt();

        // Inicializa la matriz con las dimensiones especificadas por el usuario
        this.matriz = new double[filas][columnas];

        // Crea un objeto Random para generar números aleatorios
        Random random = new Random();

        // Llena la matriz con números aleatorios
        for (int i = 0; i < filas; i++) {
            for (int j = 0; j < columnas; j++) {
                matriz[i][j] = random.nextDouble();
            }
        }
    }

    public void imprimirMatriz() {
        // Imprime todos los elementos de la matriz
        for (double[] fila : matriz) {
            for (double elemento : fila) {
                System.out.print(elemento + " ");
            }
            System.out.println();
        }
    }

    public double maximo() {
        // Encuentra y retorna el valor máximo en la matriz
        double max = matriz[0][0];
        for (double[] fila : matriz) {
            for (double elemento : fila) {
                if (elemento > max) {
                    max = elemento;
                }
            }
        }
        return max;
    }

    public double minimo() {
        // Encuentra y retorna el valor mínimo en la matriz
        double min = matriz[0][0];
        for (double[] fila : matriz) {
            for (double elemento : fila) {
                if (elemento < min) {
                    min = elemento;
                }
            }
        }
        return min;
    }

    public double[][] getMatriz() {
        // Retorna la matriz
        return this.matriz;
    }

    public double[][] sumarMatrices(EjercicioMatrices otraMatriz) {
        // Suma esta matriz con otra matriz y retorna el resultado
        int filas = this.matriz.length;
        int columnas = this.matriz[0].length;
        double[][] nuevaMatriz = new double[filas][columnas];

        for (int i = 0; i < filas; i++) {
            for (int j = 0; j < columnas; j++) {
                nuevaMatriz[i][j] = this.matriz[i][j] + otraMatriz.getMatriz()[i][j];
            }
        }
        return nuevaMatriz;
    }

    public double[][] restarMatrices(EjercicioMatrices otraMatriz) {
        // Resta esta matriz con otra matriz y retorna el resultado
        int filas = this.matriz.length;
        int columnas = this.matriz[0].length;
        double[][] nuevaMatriz = new double[filas][columnas];

        for (int i = 0; i < filas; i++) {
            for (int j = 0; j < columnas; j++) {
                nuevaMatriz[i][j] = this.matriz[i][j] - otraMatriz.getMatriz()[i][j];
            }
        }
        return nuevaMatriz;
    }

    public double[][] multiplicarMatrices(EjercicioMatrices otraMatriz) {
        // Multiplica esta matriz con otra matriz y retorna el resultado
        int filas = this.matriz.length;
        int columnas = otraMatriz.getMatriz()[0].length;
        double[][] nuevaMatriz = new double[filas][columnas];

        for (int i = 0; i < filas; i++) {
            for (int j = 0; j < columnas; j++) {
                for (int k = 0; k < this.matriz[0].length; k++) {
                    nuevaMatriz[i][j] += this.matriz[i][k] * otraMatriz.getMatriz()[k][j];
                }
            }
        }
        return nuevaMatriz;
    }
}

import java.util.Random;
import java.util.Scanner;

public class EjercicioMatrices {
    private double[][] matriz;

    public EjercicioMatrices() {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Ingrese el número de filas: ");
        int filas = scanner.nextInt();
        System.out.print("Ingrese el número de columnas: ");
        int columnas = scanner.nextInt();

        this.matriz = new double[filas][columnas];
        Random random = new Random();

        for (int i = 0; i < filas; i++) {
            for (int j = 0; j < columnas; j++) {
                matriz[i][j] = random.nextDouble();
            }
        }
    }

    public void imprimirMatriz() {
        for (double[] fila : matriz) {
            for (double elemento : fila) {
                System.out.print(elemento + " ");
            }
            System.out.println();
        }
    }

    public double maximo() {
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
        return this.matriz;
    }

    public double[][] sumarMatrices(EjercicioMatrices otraMatriz) {
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

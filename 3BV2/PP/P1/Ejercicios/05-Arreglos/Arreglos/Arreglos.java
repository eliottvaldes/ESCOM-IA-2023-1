import java.util.Arrays;
import java.util.Random;

public class Arreglos {
    // Atributo privado que almacena un arreglo de números en punto flotante
    private double[] arreglo;

    // Constructor de la clase que inicializa el arreglo con un tamaño especificado
    public Arreglos(int size) {
        this.arreglo = new double[size];
    }

    // Método para llenar el arreglo con números aleatorios entre 0 y 100
    public void llenarArreglo() {
        Random r = new Random();
        for(int i = 0; i < arreglo.length; i++) {
            arreglo[i] = r.nextDouble() * 100;
        }
    }

    // Método para imprimir el arreglo en la consola
    public void imprimirArreglo() {
        for(double x : arreglo) {
            System.out.print(x + " ");
        }
        System.out.println();
    }

    // Método para encontrar y devolver el valor máximo en el arreglo
    public double maximo() {
        double max = arreglo[0];
        for(double x : arreglo) {
            if(x > max) {
                max = x;
            }
        }
        return max;
    }

    // Método para encontrar y devolver el valor mínimo en el arreglo
    public double minimo() {
        double min = arreglo[0];
        for(double x : arreglo) {
            if(x < min) {
                min = x;
            }
        }
        return min;
    }

    // Método para sumar y devolver todos los elementos en el arreglo
    public double sumarElementos() {
        double suma = 0;
        for(double x : arreglo) {
            suma += x;
        }
        return suma;
    }

    // Método para sumar este arreglo y otro arreglo, elemento por elemento, y devolver un nuevo arreglo con el resultado
    public double[] sumarArreglos(Arreglos otro) {
        double[] suma = new double[this.arreglo.length];
        for(int i = 0; i < arreglo.length; i++) {
            suma[i] = this.arreglo[i] + otro.arreglo[i];
        }
        return suma;
    }

    // Método para calcular el producto punto de este arreglo y otro arreglo
    public double productoPunto(Arreglos otro) {
        double producto = 0;
        for(int i = 0; i < arreglo.length; i++) {
            producto += this.arreglo[i] * otro.arreglo[i];
        }
        return producto;
    }

    // Método para ordenar el arreglo en orden ascendente
    public void ordenarArreglo() {
        Arrays.sort(this.arreglo);
    }

    // Método para calcular y devolver la media de los elementos en el arreglo
    public double calcularMedia() {
        return this.sumarElementos() / this.arreglo.length;
    }

    // Método para devolver el arreglo
    public double[] devolverArreglo() {
        return this.arreglo;
    }
}

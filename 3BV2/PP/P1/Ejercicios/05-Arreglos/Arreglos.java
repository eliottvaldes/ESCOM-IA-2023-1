import java.util.Arrays;
import java.util.Random;

public class Arreglos {
    private double[] arreglo;

    public Arreglos(int size) {
        this.arreglo = new double[size];
    }

    public void llenarArreglo() {
        Random r = new Random();
        for(int i = 0; i < arreglo.length; i++) {
            arreglo[i] = r.nextDouble() * 100; // Genera números aleatorios entre 0 y 100
        }
    }

    public void imprimirArreglo() {
        for(double x : arreglo) {
            System.out.print(x + " ");
        }
        System.out.println();
    }

    public double maximo() {
        double max = arreglo[0];
        for(double x : arreglo) {
            if(x > max) {
                max = x;
            }
        }
        return max;
    }

    public double minimo() {
        double min = arreglo[0];
        for(double x : arreglo) {
            if(x < min) {
                min = x;
            }
        }
        return min;
    }

    public double sumarElementos() {
        double suma = 0;
        for(double x : arreglo) {
            suma += x;
        }
        return suma;
    }

    public double[] sumarArreglos(Arreglos otro) {
        double[] suma = new double[this.arreglo.length];
        for(int i = 0; i < arreglo.length; i++) {
            suma[i] = this.arreglo[i] + otro.arreglo[i];
        }
        return suma;
    }

    public double productoPunto(Arreglos otro) {
        double producto = 0;
        for(int i = 0; i < arreglo.length; i++) {
            producto += this.arreglo[i] * otro.arreglo[i];
        }
        return producto;
    }

    public void ordenarArreglo() {
        Arrays.sort(this.arreglo);
    }

    public double calcularMedia() {
        return this.sumarElementos() / this.arreglo.length;
    }

    public double[] devolverArreglo() {
        return this.arreglo;
    }
}

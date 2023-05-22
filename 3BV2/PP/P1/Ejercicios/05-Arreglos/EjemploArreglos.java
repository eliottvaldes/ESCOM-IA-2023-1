public class EjemploArreglos {

    public static void main(String[] args) {
        Arreglos arre = new Arreglos(5);
        arre.imprimirArreglo();
        arre.llenarArreglo();
        System.out.println("");
        arre.imprimirArreglo();

        double[] array = arre.devolverArreglo();
        System.out.println("");

        for(double x : array) {
            System.out.println("Elem -> "+x);
        }

        System.out.println("Máximo: " + arre.maximo());
        System.out.println("Mínimo: " + arre.minimo());
        System.out.println("Suma de elementos: " + arre.sumarElementos());

        Arreglos arre2 = new Arreglos(5);
        arre2.llenarArreglo();
        arre2.imprimirArreglo();

        double[] suma = arre.sumarArreglos(arre2);
        System.out.println("Suma de arreglos: " + Arrays.toString(suma));

        System.out.println("Producto punto: " + arre.productoPunto(arre2));

        arre.ordenarArreglo();
        System.out.println("Arreglo ordenado: ");
        arre.imprimirArreglo();

        System.out.println("Media del arreglo: " + arre.calcularMedia());
    }
}

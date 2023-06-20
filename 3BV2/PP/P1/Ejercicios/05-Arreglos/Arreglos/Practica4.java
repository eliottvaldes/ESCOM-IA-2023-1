public class Practica4 {

    public static void main(String[] args) {
        // Se crea un objeto de la clase Arreglos de tamaño 5
        Arreglos arre = new Arreglos(5);

        // Se imprime el arreglo inicial (vacío)
        arre.imprimirArreglo();

        // Se llena el arreglo con números aleatorios
        arre.llenarArreglo();
        
        // Salto de línea
        System.out.println("");
        
        // Se imprime el arreglo después de llenarlo
        arre.imprimirArreglo();

        // Se obtiene el arreglo y se guarda en una variable
        double[] array = arre.devolverArreglo();

        // Salto de línea
        System.out.println("");

        // Se imprime cada elemento del arreglo con un mensaje
        for(double x : array) {
            System.out.println("Elem -> "+x);
        }

        // Se imprime el máximo valor del arreglo
        System.out.println("Máximo: " + arre.maximo());

        // Se imprime el mínimo valor del arreglo
        System.out.println("Mínimo: " + arre.minimo());

        // Se imprime la suma de todos los elementos del arreglo
        System.out.println("Suma de elementos: " + arre.sumarElementos());

        // Se crea otro objeto de la clase Arreglos de tamaño 5
        Arreglos arre2 = new Arreglos(5);

        // Se llena el segundo arreglo con números aleatorios
        arre2.llenarArreglo();

        // Se imprime el segundo arreglo
        arre2.imprimirArreglo();

        // Se suman los dos arreglos y se guarda el resultado en una nueva variable
        double[] suma = arre.sumarArreglos(arre2);

        // Se imprime el arreglo resultado de la suma de los dos arreglos
        System.out.println("Suma de arreglos: " + Arrays.toString(suma));

        // Se calcula el producto punto de los dos arreglos y se imprime
        System.out.println("Producto punto: " + arre.productoPunto(arre2));

        // Se ordena el primer arreglo
        arre.ordenarArreglo();

        // Se imprime el mensaje de arreglo ordenado
        System.out.println("Arreglo ordenado: ");

        // Se imprime el primer arreglo ya ordenado
        arre.imprimirArreglo();

        // Se calcula y se imprime la media de los elementos del primer arreglo
        System.out.println("Media del arreglo: " + arre.calcularMedia());
    }
}

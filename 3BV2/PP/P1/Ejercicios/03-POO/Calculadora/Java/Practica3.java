public class Practica3 {
     public static void main(String[] args) {
        // Crea una instancia de la clase Calculadora utilizando el constructor sin argumentos
        Calculadora calculadora1 = new Calculadora();

        // Crea una instancia de la clase Calculadora utilizando el constructor con argumentos
        Calculadora calculadora2 = new Calculadora(20, 6.28f, 10.46912);

        // Utiliza los métodos de la clase Calculadora para realizar cálculos
        int suma = calculadora1.sumar(5);
        float resta = calculadora1.restar(2.56f);
        double multiplicacion = calculadora1.multiplicar(3.76);
        int division = calculadora1.dividir(5);
        int modulo = calculadora1.modulo(3);

        // Imprime los resultados
         System.out.println("\n=========\nCalculadora sin argumentos:");
        System.out.println("Suma: " + suma);
        System.out.println("Resta: " + resta);
        System.out.println("Multiplicación: " + multiplicacion);
        System.out.println("División: " + division);
        System.out.println("Módulo: " + modulo);
        
        // Utiliza los métodos de la clase Calculadora para realizar cálculos
        int suma2 = calculadora2.sumar(5);
        float resta2 = calculadora2.restar(2.56f);
        double multiplicacion2 = calculadora2.multiplicar(3.76);
        int division2 = calculadora2.dividir(5);
        int modulo2 = calculadora2.modulo(3);
        
        System.out.println("\n=========\nCalculadora con argumentos:");
        System.out.println("Suma: " + suma2);
        System.out.println("Resta: " + resta2);
        System.out.println("Multiplicación: " + multiplicacion2);
        System.out.println("División: " + division2);
        System.out.println("Módulo: " + modulo2);
    }
}

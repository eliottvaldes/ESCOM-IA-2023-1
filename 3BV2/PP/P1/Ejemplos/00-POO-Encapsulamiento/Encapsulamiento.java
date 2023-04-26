// Crea una clase main que obtenga dos numeros como entrada y que a partir de eso cree un objeto de tipo calculadora y que imprima la suma de los dos numeros

import java.util.Scanner;

public class Encapsulamiento {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Ingresa el primer numero: ");
        int num1 = sc.nextInt();
        System.out.println("Ingresa el segundo numero: ");
        int num2 = sc.nextInt();

        
        Calculadora calc = new Calculadora(num1, num2);
        System.out.println("La suma de los numeros es: " + calc.suma());
    }
}
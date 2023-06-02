import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        System.out.println("Seleccione la figura:\n1. Triángulo\n2. Círculo\n3. Rectángulo\n4. Hexágono");
        int seleccion = input.nextInt();

        Figura figura;
        double dimension1, dimension2;
        
        switch (seleccion) {
            case 1:
                System.out.println("Ingrese la base del triángulo:");
                dimension1 = input.nextDouble();
                System.out.println("Ingrese la altura del triángulo:");
                dimension2 = input.nextDouble();
                figura = new Triangulo(dimension1, dimension2);
                break;
            case 2:
                System.out.println("Ingrese el radio del círculo:");
                dimension1 = input.nextDouble();
                figura = new Circulo(dimension1);
                break;
            case 3:
                System.out.println("Ingrese el largo del rectángulo:");
                dimension1 = input.nextDouble();
                System.out.println("Ingrese el ancho del rectángulo:");
                dimension2 = input.nextDouble();
                figura = new Rectangulo(dimension1, dimension2);
                break;
            case 4:
                System.out.println("Ingrese el lado del hexágono:");
                dimension1 = input.nextDouble();
                figura = new Hexagono(dimension1);
                break;
            default:
                System.out.println("Selección inválida");
                return;
        }
        
        System.out.println("Área: " + figura.calcularArea());
        System.out.println("Perímetro: " + figura.calcularPerimetro());
    }
}

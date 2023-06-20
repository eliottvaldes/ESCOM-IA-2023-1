import java.util.Scanner;

public class Practica6 {

    public static void main(String[] args) {
        // Crea un objeto Scanner para recibir la entrada del usuario
        Scanner input = new Scanner(System.in);

        // Inicia el ciclo do-while
        do {
            // Imprime el menú de selección de figura y una opción para salir
            System.out.println("\n\n=====================================================================");
            System.out.println("Seleccione la figura:\n1. Triángulo\n2. Círculo\n3. Rectángulo\n4. Hexágono\n5. Salir");
            // Recibe la selección del usuario
            int seleccion = input.nextInt();

            // Declaración de la variable 'figura' que será instanciada más tarde
            Figura figura;
            // Declaración de las variables para las dimensiones
            double dimension1, dimension2;

            // Realiza una acción diferente según la selección del usuario
            switch (seleccion) {
                case 1:
                    // Solicita las dimensiones del triángulo
                    System.out.println("\n-------------------");
                    System.out.println("Ingrese la base del triángulo:");
                    dimension1 = input.nextDouble();
                    System.out.println("\n-------------------");
                    System.out.println("Ingrese la altura del triángulo:");
                    dimension2 = input.nextDouble();
                    // Crea una nueva instancia de Triangulo con las dimensiones ingresadas
                    figura = new Triangulo(dimension1, dimension2);
                    // Imprime el área y el perímetro de la figura
                    System.out.println("\n-------------------");
                    System.out.println("Área: " + figura.calcularArea());
                    System.out.println("Perímetro: " + figura.calcularPerimetro());
                    break;
                case 2:
                    // Solicita la dimensión del círculo
                    System.out.println("\n-------------------");
                    System.out.println("Ingrese el radio del círculo:");
                    dimension1 = input.nextDouble();
                    // Crea una nueva instancia de Circulo con la dimensión ingresada
                    figura = new Circulo(dimension1);
                    // Imprime el área y el perímetro de la figura
                    System.out.println("\n-------------------");
                    System.out.println("Área: " + figura.calcularArea());
                    System.out.println("Perímetro: " + figura.calcularPerimetro());
                    break;
                case 3:
                    // Solicita las dimensiones del rectángulo
                    System.out.println("\n-------------------");
                    System.out.println("Ingrese el largo del rectángulo:");
                    dimension1 = input.nextDouble();
                    System.out.println("\n-------------------");
                    System.out.println("Ingrese el ancho del rectángulo:");
                    dimension2 = input.nextDouble();
                    // Crea una nueva instancia de Rectangulo con las dimensiones ingresadas
                    figura = new Rectangulo(dimension1, dimension2);
                    // Imprime el área y el perímetro de la figura
                    System.out.println("\n-------------------");
                    System.out.println("Área: " + figura.calcularArea());
                    System.out.println("Perímetro: " + figura.calcularPerimetro());
                    break;
                case 4:
                    // Solicita la dimensión del hexágono
                    System.out.println("\n-------------------");
                    System.out.println("Ingrese el lado del hexágono:");
                    dimension1 = input.nextDouble();
                    // Crea una nueva instancia de Hexagono con la dimensión ingresada
                    figura = new Hexagono(dimension1);
                    // Imprime el área y el perímetro de la figura
                    System.out.println("\n-------------------");
                    System.out.println("Área: " + figura.calcularArea());
                    System.out.println("Perímetro: " + figura.calcularPerimetro());
                    break;
                case 5:
                    // Si el usuario elige 5, el programa finaliza
                    System.out.println("Saliendo...");
                    System.exit(0);
                default:
                    // Si el usuario no eligió una opción válida, imprime un mensaje de error
                    System.out.println("Selección inválida");
                    break;
            }
        } while (true); // El ciclo se repite hasta que el usuario elija salir
    }
}

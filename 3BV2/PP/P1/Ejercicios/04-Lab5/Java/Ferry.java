import java.util.*;

public class Main {
    // Define la capacidad máxima de los ferris
    static final int CAPACITY = 10;
    // Crea una pila (Stack) para el ferris Portos
    static Stack<String> portos = new Stack<>();
    // Crea una cola (Queue) para el ferris Celebrian
    static Queue<String> celebrian = new LinkedList<>();

    public static void main(String[] args) {
        // Crea un objeto Scanner para leer la entrada del usuario
        Scanner scanner = new Scanner(System.in);

        // Bucle infinito hasta que el programa se cierre manualmente
        while (true) {
            // Solicita al usuario la matrícula del auto
            System.out.println("Introduce la matrícula del auto:");
            String licensePlate = scanner.nextLine();

            // Solicita al usuario en qué ferris irá el auto
            System.out.println("¿En qué ferris irá el auto? (P o C)");
            String ferry = scanner.nextLine();

            // Si el usuario eligió Portos y hay espacio, agrega el auto a Portos
            if (ferry.equalsIgnoreCase("P")) {
                if (portos.size() < CAPACITY) {
                    portos.push(licensePlate);
                    System.out.println("Auto agregado a Portos.");
                } else {
                    System.out.println("Lo sentimos, Portos está lleno.");
                }
            // Si el usuario eligió Celebrian y hay espacio, agrega el auto a Celebrian
            } else if (ferry.equalsIgnoreCase("C")) {
                if (celebrian.size() < CAPACITY) {
                    celebrian.add(licensePlate);
                    System.out.println("Auto agregado a Celebrian.");
                } else {
                    System.out.println("Lo sentimos, Celebrian está lleno.");
                }
            // Si el usuario no eligió P ni C, muestra un mensaje de error
            } else {
                System.out.println("Opción no válida.");
            }

            // Muestra el contenido de ambos ferris
            printContents();

           // Si ambos ferris están llenos, muestra un mensaje y vacía ambos ferris
            if (portos.size() >= CAPACITY && celebrian.size() >= CAPACITY) {                
                System.out.println("\n=====================================================================");
                System.out.println("Los ferris han partido. Los autos no pueden ingresar.");
                System.out.println("Los ferris han completado su viaje. Los autos comenzarán a salir.");
                System.out.println("=====================================================================\n");
                unloadFerries();
                return;
            }
        }
    }

    // Método que imprime el contenido de ambos ferris
    public static void printContents() {
        System.out.println("Contenido de Portos: " + portos);
        System.out.println("Contenido de Celebrian: " + celebrian);
    }

    // Método que simula un viaje vaciando ambos ferris
    public static void unloadFerries() {
        // Vacia el ferris Portos
        while (!portos.isEmpty()) {
            String pop = portos.pop();
            System.out.println("Auto " + pop + " ha salido de Portos.");
            printContents();
        }
        
        // Vacia el ferris Celebrian
        while (!celebrian.isEmpty()) {
             String remove = celebrian.remove();
            System.out.println("Auto " + remove + " ha salido de Celebrian.");
            printContents();
        }
    }
}
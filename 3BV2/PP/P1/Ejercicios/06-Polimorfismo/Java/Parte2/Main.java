import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        // Crear instancias de las personas (Estudiante, Docente, PAAE)
        Estudiante estudiante = new Estudiante("1", "Eliot", "CURPELIOT1234", "Calle 123");
        Docente docente = new Docente("2", "Jaime", "CURPJIMMY5678", "Calle 456");
        PAAE paae = new PAAE("3", "Itzel", "CURPITZEL9012", "Calle 789");

        // Crear un objeto Scanner para recibir la entrada del usuario
        Scanner scanner = new Scanner(System.in);
        int opcion = 0; // Variable para almacenar la opción seleccionada por el usuario

        // Bucle while para permitir al usuario elegir personas repetidamente hasta que ingrese la opción 4 para salir
        while (opcion != 4) {
            System.out.println("Por favor, selecciona una opción:");
            System.out.println("1. Estudiante");
            System.out.println("2. Docente");
            System.out.println("3. PAAE");
            System.out.println("4. Salir");

            opcion = scanner.nextInt(); // Leer la opción seleccionada por el usuario
            scanner.nextLine(); // Consumir el salto de línea después de leer la opción

            // Utilizar un switch para ejecutar el código correspondiente a la opción seleccionada
            switch (opcion) {
                case 1:
                    mostrarInformacion(estudiante); // Mostrar información del Estudiante
                    break;
                case 2:
                    mostrarInformacion(docente); // Mostrar información del Docente
                    break;
                case 3:
                    mostrarInformacion(paae); // Mostrar información del PAAE
                    break;
                case 4:
                    System.out.println("Saliendo del programa..."); // Mostrar mensaje de salida
                    break;
                default:
                    System.out.println("Opción inválida"); // Mostrar mensaje de opción inválida
                    break;
            }
        }

        scanner.close(); // Cerrar el objeto Scanner
    }

    // Método para mostrar la información de una persona en la consola
    public static void mostrarInformacion(Persona persona) {
        System.out.println("ID: " + persona.getID());
        System.out.println("Nombre: " + persona.getNombre());
        System.out.println("CURP: " + persona.getCURP());
        System.out.println("Domicilio: " + persona.getDomicilio());
        System.out.println();
    }
}

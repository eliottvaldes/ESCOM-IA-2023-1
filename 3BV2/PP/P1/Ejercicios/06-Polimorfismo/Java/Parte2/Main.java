import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Estudiante estudiante = new Estudiante("1", "Juan", "CURPJUAN1234", "Calle 123");
        Docente docente = new Docente("2", "Maria", "CURPMARIA5678", "Calle 456");
        PAAE paae = new PAAE("3", "Carlos", "CURPCARLOS9012", "Calle 789");

        Scanner scanner = new Scanner(System.in);

        System.out.println("Por favor, selecciona una opción:");
        System.out.println("1. Estudiante");
        System.out.println("2. Docente");
        System.out.println("3. PAAE");

        int opcion = scanner.nextInt();
        Persona personaSeleccionada = null;

        switch (opcion) {
            case 1:
                personaSeleccionada = estudiante;
                break;
            case 2:
                personaSeleccionada = docente;
                break;
            case 3:
                personaSeleccionada = paae;
                break;
            default:
                System.out.println("Opción inválida");
                System.exit(1);
        }

        System.out.println("ID: " + personaSeleccionada.getID());
        System.out.println("Nombre: " + personaSeleccionada.getNombre());
        System.out.println("CURP: " + personaSeleccionada.getCURP());
        System.out.println("Domicilio: " + personaSeleccionada.getDomicilio());

        scanner.close();
    }
}

import java.util.*;

public class Ferry {
    String name;
    String structure;
    Deque<String> cars;

    public Ferry(String name, String structure) {
        this.name = name;
        this.structure = structure;
        this.cars = structure.equals("P") ? new ArrayDeque<String>() : new LinkedList<String>();
    }

    public void addCar(String car) {
        if (cars.size() < 10) {
            cars.add(car);
            System.out.println("Car " + car + " added to " + name);
            System.out.println(name + " contains: " + cars.toString());
        } else {
            System.out.println(name + " is full");
        }
    }

    public void releaseCars() {
        System.out.println(name + " starts its journey.");
        while (!cars.isEmpty()) {
            if (structure.equals("P")) {
                System.out.println("Car " + cars.removeLast() + " left from " + name);
            } else {
                System.out.println("Car " + cars.removeFirst() + " left from " + name);
            }
            System.out.println(name + " contains: " + cars.toString());
        }
    }

    public static void main(String[] args) {
        Ferry Portos = new Ferry("Portos", "P");
        Ferry Celebrian = new Ferry("Celebrian", "C");

        // Simulate reading car plates and which ferry it will go
        String[][] cars = {{"A123BC", "P"}, {"B234CD", "P"}, {"C345DE", "C"}, {"D456EF", "C"}};
        for (String[] car : cars) {
            if (car[1].equals("P")) {
                Portos.addCar(car[0]);
            } else {
                Celebrian.addCar(car[0]);
            }
        }

        Portos.releaseCars();
        Celebrian.releaseCars();
    }
}

public class Calculadora {
    // Atributos de la clase
    private int entero1;
    private float flotante1;
    private double doble1;

    // Constructor sin argumentos que inicializa los atributos con valores fijos
    public Calculadora() {
        entero1 = 10;
        flotante1 = 3.14f;
        doble1 = 5.23456;
    }

    // Constructor con argumentos para permitir la inicialización personalizada de los atributos
    public Calculadora(int entero1, float flotante1, double doble1) {
        this.entero1 = entero1;
        this.flotante1 = flotante1;
        this.doble1 = doble1;
    }

    // Métodos sobrecargados para realizar la operación de suma para valores enteros, flotantes y dobles
    public int sumar(int entero2) {
        return entero1 + entero2;
    }

    public float sumar(float flotante2) {
        return flotante1 + flotante2;
    }

    public double sumar(double doble2) {
        return doble1 + doble2;
    }

    // Métodos sobrecargados para realizar la operación de resta para valores enteros, flotantes y dobles
    public int restar(int entero2) {
        return entero1 - entero2;
    }

    public float restar(float flotante2) {
        return flotante1 - flotante2;
    }

    public double restar(double doble2) {
        return doble1 - doble2;
    }

    // Método para multiplicar valores enteros utilizando el algoritmo de las sumas sucesivas
    public int multiplicar(int entero2) {
        int resultado = 0;
        for (int i = 0; i < entero2; i++) {
            resultado += entero1;
        }
        return resultado;
    }

    // Métodos sobrecargados para realizar la operación de multiplicación para valores flotantes y dobles
    public float multiplicar(float flotante2) {
        return flotante1 * flotante2;
    }

    public double multiplicar(double doble2) {
        return doble1 * doble2;
    }

    // Método para dividir valores enteros utilizando el algoritmo de las restas sucesivas
    public int dividir(int entero2) {
        int resultado = 0;
        while (entero1 >= entero2) {
            entero1 -= entero2;
            resultado++;
        }
        return resultado;
    }

    // Métodos sobrecargados para realizar la operación de división para valores flotantes y dobles
    public float dividir(float flotante2) {
        return flotante1 / flotante2;
    }

    public double dividir(double doble2) {
        return doble1 / doble2;
    }

    // Método para calcular el módulo utilizando valores enteros
    public int modulo(int entero2) {
        return entero1 % entero2;
    }
}

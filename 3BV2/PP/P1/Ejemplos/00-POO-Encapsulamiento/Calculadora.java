// Crear una clase calculadora que tenga los siguientes atributos:
// - numero1
// - numero2
// Que tenga getters y setters para cada atributo

Class Calculadora {
    private int numero1;
    private int numero2;

    public int getNumero1() {
        return numero1;
    }

    public int getNumero2() {
        return numero2;
    }

    public void setNumero1(int numero1) {
        this.numero1 = numero1;
    }

    public void setNumero2(int numero2) {
        this.numero2 = numero2;
    }


    // Metodos
    public int sumar() {
        return numero1 + numero2;
    }

}
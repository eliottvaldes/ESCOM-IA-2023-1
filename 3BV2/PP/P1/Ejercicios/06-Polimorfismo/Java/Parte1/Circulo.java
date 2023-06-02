public class Circulo extends Figura {
    public Circulo(double radio) {
        super(radio);
    }

    @Override
    public double calcularArea() {
        return Math.PI * Math.pow(dimension1, 2);
    }

    @Override
    public double calcularPerimetro() {
        return 2 * Math.PI * dimension1;
    }
}

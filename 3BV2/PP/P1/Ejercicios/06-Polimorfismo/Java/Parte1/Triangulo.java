public class Triangulo extends Figura {
    private double dimension2;

    public Triangulo(double base, double altura) {
        super(base);
        this.dimension2 = altura;
    }

    @Override
    public double calcularArea() {
        return 0.5 * dimension1 * dimension2;
    }

    @Override
    public double calcularPerimetro() {
        return dimension1 * 3;
    }
}

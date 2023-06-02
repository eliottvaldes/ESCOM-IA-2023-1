public class Rectangulo extends Figura {
    private double dimension2;

    public Rectangulo(double largo, double ancho) {
        super(largo);
        this.dimension2 = ancho;
    }

    @Override
    public double calcularArea() {
        return dimension1 * dimension2;
    }

    @Override
    public double calcularPerimetro() {
        return 2 * (dimension1 + dimension2);
    }
}

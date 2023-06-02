public abstract class Figura {
    protected double dimension1;

    public Figura(double dimension1) {
        this.dimension1 = dimension1;
    }

    public abstract double calcularArea();
    public abstract double calcularPerimetro();
}

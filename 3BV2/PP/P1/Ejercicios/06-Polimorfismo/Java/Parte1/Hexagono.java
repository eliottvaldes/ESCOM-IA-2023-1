public class Hexagono extends Figura {
    public Hexagono(double lado) {
        super(lado);
    }

    @Override
    public double calcularArea() {
        return (3 * Math.sqrt(3) * Math.pow(dimension1, 2)) / 2;
    }

    @Override
    public double calcularPerimetro() {
        return 6 * dimension1;
    }
}

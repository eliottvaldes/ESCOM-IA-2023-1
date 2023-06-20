public abstract class Figura {

    protected double dimension1;

    /**
     * Constructor de la clase Figura.
     *
     * @param dimension1 La dimensión de la figura.
     */
    public Figura(double dimension1) {
        this.dimension1 = dimension1;
    }

    /**
     * Método abstracto para calcular el área de la figura.
     *
     * @return El área de la figura.
     */
    public abstract double calcularArea();

    /**
     * Método abstracto para calcular el perímetro de la figura.
     *
     * @return El perímetro de la figura.
     */
    public abstract double calcularPerimetro();
}

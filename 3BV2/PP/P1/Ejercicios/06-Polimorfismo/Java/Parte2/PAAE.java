public class PAAE implements Persona {
    private String id;
    private String nombre;
    private String CURP;
    private String domicilio;

    public PAAE(String id, String nombre, String CURP, String domicilio) {
        this.id = id;
        this.nombre = nombre;
        this.CURP = CURP;
        this.domicilio = domicilio;
    }

    @Override
    public String getID() {
        return this.id;
    }

    @Override
    public String getNombre() {
        return this.nombre;
    }

    @Override
    public String getCURP() {
        return this.CURP;
    }

    @Override
    public String getDomicilio() {
        return this.domicilio;
    }
}

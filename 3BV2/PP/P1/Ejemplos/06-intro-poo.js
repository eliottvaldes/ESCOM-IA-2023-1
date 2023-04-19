class HolaMundo {
    constructor() {
        this.saludo = 'Hola Mundo';
    }
    saludar() {
        console.log(this.saludo);
    }
}


// ejecutamos el código
let hola = new HolaMundo();
hola.saludar();
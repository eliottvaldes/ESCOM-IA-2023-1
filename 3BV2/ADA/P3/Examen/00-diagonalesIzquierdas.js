const obtenerDiagonalesDerechas = (columna, fila) => {
    return (columna + fila - 1)
}


const obtenerDiagonalesIzquierdas = (columna, fila) => {
    return (fila < columna) ? (fila - columna + 8) : (columna - fila + 8)
}




const columna = 6;
const fila = 4;

console.log('\n\n', { columna, fila });
console.log(`\n*Diagonales Derechas: ${obtenerDiagonalesDerechas(columna, fila)}`);
console.log(`\n*Diagonales Izquierdas: ${obtenerDiagonalesIzquierdas(columna, fila)}`);
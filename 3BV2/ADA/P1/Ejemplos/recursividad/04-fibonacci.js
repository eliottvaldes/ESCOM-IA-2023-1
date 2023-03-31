// declaramos la funcion fibp

const fibo = (valor) => {
    console.log('fibo()');
    if (valor == 2 || valor == 1) return 1;
    return fibo(valor - 2) + fibo(valor - 1);
}


// ejecutar fibo con valor 
const valor = 5;
console.log(fibo(valor));
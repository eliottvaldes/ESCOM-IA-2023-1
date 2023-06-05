/**
 * Funcion que determina si un numero es primo o no
 * @param {*} num 
 * @param {*} seed 
 * @returns 1 si es primo, 0 si no es primo
 */
const isPrime = (num, seed) => {
    // definimos caso base para el numero 1
    if ((seed * seed) > num) {
        return 1;
    }
    // usamos el modulo para saber si es divisible y retornamos 0 si es divisible
    if (num % seed == 0) {
        return 0;
    }
    // llamamos de manera recursiva
    return isPrime(num, seed + 1);
}


// test the code
const num = 48;
const seed = 2;
console.log(`El numero ${num} es primo? ${isPrime(num, seed) === 0 ? 'No' : 'Si'}`);
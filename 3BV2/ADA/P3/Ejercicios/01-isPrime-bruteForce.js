/**
 * Function that determines if a number is prime or not
 * @param {*} num 
 * @param {*} seed 
 * @returns 1 if it is prime, 0 if it is not prime
 */
const isPrime = (num, seed) => {
    // define base case for number 1
    if ((seed * seed) > num) {
        return 1;
    }
    // use the module to know if it is divisible and return 0 if it is divisible
    if (num % seed == 0) {
        return 0;
    }
    // call recursively
    return isPrime(num, seed + 1);
}


// test the code
const num = 137;
const seed = 2;
console.log(`El numero ${num} es primo? ${isPrime(num, seed) === 0 ? 'No' : 'Si'}`);
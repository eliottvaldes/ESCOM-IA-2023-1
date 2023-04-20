const factorial = (num) => num == 0 ? 1 : num * factorial(num - 1);

const factorialExtendido = () => {
    if (num == 0) {
        return 1;
    }

    return num * factorial(num - 1);
}

const num = 5;
console.log("\nFactorial de " + num);
console.log(factorial(num));

console.log("\nFactorial extendido de " + num);
console.log(factorialExtendido(num));
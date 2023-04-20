// 1. Get a string from the user
// const cadena = prompt("Ingrese una cadena de texto");
const cadena = "Mi mama me mima";

// 2. Count the number of times each letter appears in the string
const contarLetras = (cadena) => {
    const letras = cadena.split("");

    // transform all lleters to lowercase
    const letrasMinusculas = letras.map((letra) => letra.toLowerCase());
    // use reduce to count the number of times each letter appears
    const contador = letrasMinusculas.reduce((contador, letra) => {
        // if the letter is not in the accumulator, add it with a count of 1
        if (!contador[letra]) {
            contador[letra] = 1;
        } else {
            // otherwise, increment the count
            contador[letra]++;
        }
        return contador;
    }, {});

    return contador;
}

// 3. show the results
console.log("\La cadena de texto es: " + cadena);
console.log(contarLetras(cadena));
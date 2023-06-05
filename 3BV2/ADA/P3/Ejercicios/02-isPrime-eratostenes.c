#include <stdio.h>

// define the prototype of the function
void printPrime(int, int *, int);
// (numToCheck, vecOfPrimes, indexToSaveInVec )
int isPrime(int, int *);
// (numToCheck, vecOfPrimes)

// define the main function
void main()
{
    // define a vector of 200 elements to save the array of uniques primes
    int vec[200];
    vec[0] = 2;
    vec[1] = -1; // the end of the vector

    // call the function to print the primes
    printPrime(2, vec, 1); // (numToCheck, vecOfPrimes, indexToSaveInVec )
}

void printPrime(int num, int *vec, int indexVec)
{

    // define the base case
    if (num > 1000)
    {
        return;
    }

    // check if the number is prime
    if (isPrime(num, vec))
    {
        // if the number is prime, print it
        printf("%d\n", num);
        // save the number in the vector
        *(vec + indexVec) = num; 
        // the line above is the same as vec[indexVec] = num;

        // increase the index
        indexVec++;

        // save the -1 in the last position of the vector
        *(vec + indexVec) = -1;
        // the line above is the same as vec[indexVec] = -1;
    }

    printPrime(num + 1, vec, indexVec);
}

int isPrime(int num, int *vec)
{
    // define the base case if the value of the vector*vector
    if((*vec)*(*vec) > num)
    {
        return 1;
    }

    // use modulo to check if the number is prime
    if(num % *vec == 0)
    {
        return 0;
    }

    // call the function recursively
    isPrime(num, vec+1);

}




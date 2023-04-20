#include <stdio.h>

// define prototypes functions
void recorre(int, int);

// define main function
int main()
{
    // define variables
    int a, b;

    // input data
    puts("Introduce dos numeros enteros: ");
    scanf("%d%d", &a, &b);

    // call function recorre in order to have the first number smaller than the second
    if (a > b)
    {
        recorre(b, a);
    }
    else
    {
        // call function recorre
        recorre(a, b);
    }

    return 0;
}

// define the function recorre
void recorre(int a, int b)
{
    if (b> a)
    {
        return;
    }
    
    if ((a % 2) == 0)
    {
        printf("\n %d es par", a);
    }
    else
    {
        printf("\n%d es impar", a);
    }
    recorre(a + 1, b);
}
#include <stdio.h>

// define prototypes functions
void recorre(int, int);

// define main function
int main()
{
    // define variables
    int a, b, c;

    // input data
    puts("Introduce dos numeros enteros: ");
    scanf("%d%d", &a, &b);

    // switch in order to have the first number smaller than the second
    if (a > b)
    {
        c = a;
        a = b;
        b = c;
    }

    // call function recorre
    recorre(a, b);

    return 0;
}

// define the function recorre
void recorre(int a, int b)
{
    if (b > a)
    {
        printf("\n%d ", a);
        recorre(a + 1, b);
    }
}
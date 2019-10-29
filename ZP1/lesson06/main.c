#include <stdio.h>
#include <stdbool.h>

int modulo(int a, int b)
{
    //printf("f ok \n");
    int result = a % b;
    //printf("modulo ok \n");
    return result;
}

void findStrangeNumbers()
{
    for (int i = 1000; i < 10000; i++)
    {
        int a = i / 100;
        int b = i - (a * 100);
        //int tmp = a + b;

        if (modulo(i, (a + b)) == 0)
        {
            printf("%d\n", i);
        }//*/
    }
}

int findPrime(int n)
{
    if (n < 2)
    {
        return 2;
    }

    bool found = false;
    int number = n;
    while (!found)
    {
        number++;
        found = true;
        for (int i = 2; i <= n; i++)
        {
            if ((number % i) == 0)
            {
                found = false;
                break;
            }
        }

    }
    return number;
}

int nextPrimeDistance(int a)
{
    return findPrime(a) - a;
}

bool isPrime(int n)
{
    for (int i = 2; i < n; i++)
    {
        if ((n % i) == 0)
        {
            return false;
        }
    }
    return true;
}

int sumOfCiphers(int n)
{
    int result = 0;
    while (n)
    {
        result += n % 10;
        n /= 10;
    }
    return result;
}

void strangePrimes(int n)
{
    for (int i = 2; i < n; i++)
    {
        if ((isPrime(i)) && (isPrime(sumOfCiphers(i))))
            printf("%d\n", i);
    }
}
unsigned int factorial(int n)
{
    unsigned int result = 1;
    for (int i = 1; i <= n; i++)
    {
        result *= i;
    }
    return result;
}

int sumOfnumbers(int n)
{
    int result = 0;
    for (int i = 1; i <= n; i++)
    {
        result += i;
    }
    return result;
}

unsigned int sumOfFacts(int n)
{
    unsigned int result = 0;
    for (int i = 1; i <= n; i++)
    {
        result += factorial(sumOfnumbers(i));
    }
    return result;
}

int main()
{
    // 2
    //findStrangeNumbers();

    // 3
    //printf("%d\n", nextPrimeDistance(5));

    // 4
    //strangePrimes(1000);

    //5
    printf("%d\n", sumOfFacts(2));

    return 0;
}

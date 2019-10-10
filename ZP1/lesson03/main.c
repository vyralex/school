#include <stdio.h>
#include <stdbool.h> // important for using boolean values

void ar_sequence(int a, int b){
    for (int i = 1; i < a; i++)
    {
        printf("%d, ", b * i);
    }
    printf("%d\n", a * b);
}

int power(int a, int n)
{
    int result = 1;
    for (int i = 0; i < n; i++)
    {
        result *= a;
    }
    return result;
}

int fib_numbe_no(unsigned int n)
{
    if (n == 1)
    {
        return 0;
    }
    if (n == 2)
    {
        return 1;
    }
    int a = 0;
    int b = 1;
    for (int i = 2; i < n; i++)
    {
        int tmp = b;
        b += a;
        a = tmp;
    }
    return b;
}

int count_cifr(int a)
{
    int i = 0;
    if (a > 0)
    {
        i = 1;
        while (a > 10)
        {
            a /= 10;
            i++;
        }
    }
    return i;
}

int sum_numbers(int a, int b)
{
    int result = 0;
    for (int i = a + 1; i < b; i++)
    {
        result += i;
    }
    return result;
}

int sum_odd(int a, int b)
{
    int result = 0;
    for (int i = a; i <= b; i += 2)
    {
        result += i;
    }
    return result;
}

int sum_ciphers(int a)
{
    int result = 0;
    while (a)
    {
        result += a % 10;
        a /= 10;
    }
    return result;
}

void divide_by_seven()
{
    for (int i = 1000; i < 10000; i++)
    {
        if (!(sum_ciphers(i) % 7))
        {
            printf("%d  ", i);
        }
    }
}

bool is_polindrom(int a)
{
    int new_no = 0;
    int old_no = a;
    while (a)
    {
        new_no *= 10;
        new_no += a % 10;
        a /= 10;
    }
    return new_no == old_no;
}

void print_pal(int a, int b)
{
    for (int i = a; i < b; i++)
    {
        if (is_polindrom(i))
            printf("%d ", i);
    }
}

void find_primes(int a)
{
    int i = 2;
    while (i <= a)
    {
        if (!(a % i))
        {
            printf("%d\n", i);
            a /= i;
        }
        else i++;
    }
}

void print_tree_a(int n)
{
    for (int i = 1; i <= n; i++)
    {
        for (int j = 1; j <= i; j++)
        {
            printf("%d", j);
        }
        printf("\n");
    }
    printf("\n");
}

void print_tree_b(int n)
{
    int pr = 1;
    for (int i = 1; i <= n; i++)
    {
        for (int j = 1; j <= i; j++)
        {
            printf("%d ", pr);
            pr++;
        }
        printf("\n");
    }
    printf("\n");
}

void print_tree_c(int n, char c)
{
    for (int i = 0; i < n; i++)
    {
        for (int space = 1; space < c - i; space++)
        {
            printf(" ");
        }
        //
        for (int j = 0; j <= i; j++)
        {
            printf("%c ", c);
        }
        printf("\n");
    }
    printf("\n");
}

int main()
{
    //ar_sequence(20, 3);
    //printf("%d\n" ,power(5, 5));
    //printf("%d\n", fib_numbe_no(5));
    //printf("%d\n", count_cifr(298457238));
    //printf("%d\n", sum_numbers(0, 11));
    //printf("%d\n", sum_odd(10, 100));
    //divide_by_seven();
    //print_pal(0, 1000);
    //find_primes(1000);

    print_tree_a(5);
    print_tree_b(5);
    print_tree_c(5, '*');

    return 0;
}

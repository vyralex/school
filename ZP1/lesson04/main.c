#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

double arrayAverage(int *a, int n)
{
    double average = 0.0;
    for (int i = 0; i < n; i++)
    {
        average += a[i];
    }
    return average / n;
}

int findNode(int c, int *a, int n)
{
    for (int i = 0; i < n; i++)
    {
        if (a[i] == c)
            return i;
        else if (a[i] > c)
            return -1;
    }
    return -1;
}

bool identicalArrays(int *a, int *b, int n)
{
    for (int i = 0; i < n; i++)
    {
        if (a[i] != b[i])
            return false;
    }
    return true;
}

bool identicalNodeInArray(int *a, int *b, int n)
{
    bool usedIndexes[n];
    for (int i = 0; i < n; i++)
    {
        usedIndexes[i] = false;
    }
    bool found;
    for (int i = 0; i < n; i++)
    {
        found = false;
        for (int j = 0; j < n; j++)
        {
            if ((a[i] == b[j]) && !(usedIndexes[j]))
            {
                found = true;
                usedIndexes[j] = true;
            }
            if (found) break;
        }
        if (!found)
            return false;
    }
    return true;
}

void invertArray(int *a, int n)
{
    int m = n / 2;
    int tmp;
    for (int i = 0; i < m; i++)
    {
        tmp = a[i];
        a[i] = a[n - i - 1];
        a[n - i - 1] = tmp;
    }
}

bool isOdd(int n)
{
    return n % 2;
}

int sumOdd(int *a, int n)
{
    int result = 0;
    for (int i = 0; i < n; i++)
    {
        if (isOdd(a[i]))
            result += a[i];
    }
    return result;
}

int isOrdered(int *a, int n)
{
    if (n < 2)
        return 1;
    bool up = true;
    bool down = true;
    int tmp = a[0];
    for (int i = 1; i < n; i++)
    {
        if (a[i] > tmp)
            down = false;
        if (a[i] < tmp)
            up = false;
        tmp = a[i];
    }
    if (up)
        return 1;
    if (down)
        return -1;
    return 0;
}

void replace(int *a, int n, int x, int y)
{
    for (int i = 0; i < n; i++)
    {
        if (a[i] == x)
            a[i] = y;
    }
}

void printAllArray(int *a, int n)
{
    for (int i = 0; i < n; i++)
    {
        printf("%d, ", a[i]);
    }
}
int main()
{
    int a[9] = {1, 2, 3, 4, 5, 6, 7, 8, 9};
    int b[9] = {1, 2, 3, 4, 5, 6, 7, 7, 9};
    int n = 9;
    int c = 5;

    //printf("%d", a[-1]);

    // 1
    //printf("Average of the array is: %f", arrayAverage(a, n));

    // 2
    //printf("Node is on pissition: %d", findNode(c, a, n));

    // 3
    //printf("%d, %d", identicalArrays(a, a, n), identicalArrays(a, b, n));

    // 4  identicalNodeInArray
    //printf("%d, %d", identicalNodeInArray(a, a, n), identicalNodeInArray(a, b, n));

    // 5
    //invertArray(a, n)
    //printAllArray(a, n);

    // 6
    //printf("%d", sumOdd(a, n));

    // 7
    //printf("%d", isOrdered(a, n));

    // 8
    replace(a, n, 5, 6);
    printAllArray(a, n);

    printf("\n");
    return 0;
}
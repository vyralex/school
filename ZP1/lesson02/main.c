#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

void convertFarToCel()
{
    float fahrenheit;
    printf("Enter temperature in fahrenheit: ");
    scanf("%f", &fahrenheit);
    while (fahrenheit > 400.0)
    {
        printf("Temperature in fahrenheit is too high, please enter lower number than 400: ");
        scanf("%f", &fahrenheit);
    }
    printf("Temperature in celsius is: %fC\n", (5 * (fahrenheit - 32)) / 9);
}

int findMinimum(int *numbers, int length)
{
    if (length)
    {
        int minimum = numbers[0];
        for (int i = 1; i < length; i++)
        {
            if (minimum > numbers[i])
                minimum = numbers[i];
        }
        return minimum;
    }
    return 0;
}

void leapYear()
{
    int year;
    printf("Enter year: ");
    scanf("%d", &year);

    if (!(year % 4) && (year % 400))
    {
        printf("Year is leap");
    } else
    {
        printf("Year is not leap");
    }
}

int findQuadrant(double x, double y)
{
    if (x == 0.0)
    {
        if (y == 0.0)
        {
            return 0;
        } else if (y > 0.0)
        {
            return 0;
        } else
        {
            return 0;
        }
    } else if (y == 0.0)
    {
        if (x > 0.0)
        {
            return 0;
        } else
        {
            return 0;
        }
    } else if (x > 0.0)
    {
        if (y > 0.0)
        {
            return 1;
        } else
        {
            return 4;
        }
    } else
    {
        if (y > 0.0)
        {
            return 2;
        } else
        {
            return 3;
        }
    }
}
void findQuadrantOfCircle(x, y, r)
{
    int quadrant = findQuadrant(x, y);
    bool st, nd, rd, th;
    if (!quadrant)
    {
        if (x == 0)
        {
            if (y > 0.0)
            {
                st = true;
                nd = true;
                if (r > y)
                {
                    rd = true;
                    th = true;
                }
            } else
            {
                rd = true;
                th = true;
                if (r > -y)
                {
                    st = true;
                    nd = true;
                }
            }
        } else
        {
            if (x > 0.0)
            {
                st = true;
                th = true;
                if (r > x)
                {
                    nd = true;
                    rd = true;
                }
            } else
            {
                nd = true;
                rd = true;
                if (r > -x)
                {
                    st = true;
                    th = true;
                }
            }
        }
    }
    case (quadrant)
    {
        1:
    }
}

int main()
{
    /*// Task 1
    convertFarToCel();
    //*/

    /*// Task 2
    int arr[] = {5, 8, 6, 3, 500, 321};
    int length = sizeof(arr) / sizeof(int);
    printf("minimum is %d", findMinimum(arr, length));
    //*/

    /*// Task 3
    leapYear();
    //*/

    /*// Task 4
    double x, y;
    scanf("%lf", &x);
    scanf("%lf", &y);
    findQuadrant(x, y);
    //*/

    // Task 4
    double x, y, r;
    scanf("%lf", &x);
    scanf("%lf", &y);
    scanf("%lf", &r);
    findQuadrantOfCircle(x, y, r);
    //*/

    return 0;
}












#include <stdlib.h>
#include <stdio.h>

int my_strcmp (char *s1, char *s2)
{
    int index = 0;
    while ((*(s1 + index) != '\0') && (*(s2 + index) != '\0'))
    {
        if (*(s1 + index) != *(s2 + index)) return 0;
        index++;
    }
    return (*(s1 + index) == *(s2 + index)) ? 1 : 0;
}

int partition (int p, int r)
{
    
}

int array_stats (double *a, int n, double *avr, double *med)
{
    double sum = 0;
    for (int i = 0; i < n; i++)
        sum += *(a + i);
    *avr = sum / n;
    ////////////////
    double *b = (double *)malloc(n * (sizeof(double));

}

int main()
{
    printf("%d\n", my_strcmp("Abraka dabra", "Abraka dabra"));
    printf("%d\n", my_strcmp("Abraka dabr", "Abraka dabra"));
    printf("%d\n", my_strcmp("Abraka dabra", "Abraka dabr"));
    printf("%d\n", my_strcmp("Abraka dabra", "Dabra abraka"));



    return 0;
}
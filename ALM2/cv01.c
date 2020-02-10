#include <stdlib.h>
#include <stdio.h>

#define STR_LEN 20

typedef struct date
{
    unsigned int year;
    unsigned int month;
    unsigned int day;
} date;

typedef struct person
{
    char first_name[STR_LEN];
    char last_name[STR_LEN];
    date birth_date;
} person;

void print_person (person person)
{
    printf("%s %s, %d.%d.%d\n", person.first_name, person.last_name, person.birth_date.day, person.birth_date.month, person.birth_date.year);
}

void swap_persons(person p[], int i, int j)
{
    person tmp = p[i];
    p[i] = p[j];
    p[j] = tmp;
}

void sort_by_day (person persons[], int n)
{
    for (int i = 0; i < n - 1; i++)
        for (int j = n - 1; j > i; j--)
            if (persons[j].birth_date.day < persons[j - 1].birth_date.day)
                swap_persons(persons, j, j - 1);

}

void sort_by_month (person persons[], int n)
{
    for (int i = 0; i < n - 1; i++)
        for (int j = n - 1; j > i; j--)
            if (persons[j].birth_date.month < persons[j - 1].birth_date.month)
                swap_persons(persons, j, j - 1);

}

void sort_by_year (person persons[], int n)
{
    for (int i = 0; i < n - 1; i++)
        for (int j = n - 1; j > i; j--)
            if (persons[j].birth_date.year < persons[j - 1].birth_date.year)
                swap_persons(persons, j, j - 1);

}

void sort_by_birthdate (person persons[], int n)
{
    sort_by_day(persons, n);
    sort_by_month(persons, n);
    sort_by_year(persons, n);
}

int compare_strings(char s1[], char s2[])
{
    for (int i = 0; i < STR_LEN; i++)
    {
        if (s1[i] != s2[i])
            return (s1[i] > s2[i]) ? -1 : 1;
        if (s1[i] == '\0')
            return 0;
    }
    return 0;
}

void sort_by_firstname (person persons[], int n)
{
    for (int i = 0; i < n - 1; i++)
        for (int j = n - 1; j > i; j--)
            if (compare_strings(persons[j].first_name, persons[j - 1].first_name) == 1)
                swap_persons(persons, j, j - 1);
}
void sort_by_lastname (person persons[], int n)
{
    for (int i = 0; i < n - 1; i++)
        for (int j = n - 1; j > i; j--)
            if (compare_strings(persons[j].last_name, persons[j - 1].last_name) == 1)
                swap_persons(persons, j, j - 1);
}
void sort_by_name (person persons[], int n)
{
    sort_by_firstname(persons, n);
    sort_by_lastname(persons, n);
}

int find_persons_by_firstname(person persons[], const int n, char name[])
{
    unsigned int *founded = (unsigned int *)calloc(n, sizeof(person));
    for (int i = 0; i < n; i++)
        if (!compare_strings(persons[i].first_name, name))
            *(founded + i) = 1;
    //
    for (int i = 0; i < n; i++)
        if (*(founded + i))
            print_person(*(persons + i));
}

int main ()
{
    const int count = 11;
    person persons[count] = {{"Alex",     "Vyroubal",  {1996, 11, 17}},
                             {"Leona",    "Vaculkova", {1898,  5, 12}},
                             {"Milan",    "Schwarts",  {1975,  1,  1}},
                             {"Karel",    "Motak",     {2000, 10, 20}},
                             {"Julie",    "Hladka",    {2004,  9, 28}},
                             {"Assad",    "Muhamed",   {2004,  9, 11}},
                             {"LeBron",   "James",     {1985,  8, 30}},
                             {"Pow",      "Pie",       {1992,  4,  7}},
                             {"Kralicek", "JOJO",      {2020,  1, 15}},
                             {"Leona",    "Bystra",    {1970, 12, 24}},
                             {"Leona",    "Mala",      {1970, 12, 24}}};
    //
    //sort_by_birthdate(persons, count);
    //sort_by_name(persons, count);
    /*
    printf("\n");
    for (int i = 0; i < count; i++)
    {
        print_person(persons[i]);
    }
    printf("\n");
    //*/

    printf("\n");
    sort_by_name(persons, count);
    find_persons_by_firstname(persons, count, "Leona");
    printf("\n");


    return 0;
}

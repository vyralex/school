#include <stdlib.h>
#include <stdio.h>
//#include <string.h>

#define STR_LEN 20
#define true 1
#define false 0

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

char *date_to_ANSI_string (date date)
{
    char *result, *day_prefix = "", *month_prefix = "";
    if (date.day < 10)
        day_prefix = "0";
    if (date.month < 10)
        month_prefix = "0";
    sprintf(result, "%d-%s%d-%s%d", date.year, month_prefix, date.month ,day_prefix, date.day);
    return result;
}

char *date_to_string (date date)
{
    char *result;
    sprintf(result, "%d.%d.%d", date.day, date.month, date.year);
    return result;
}

void print_person (person person)
{
    printf("%s %s, %d.%d.%d\n", person.first_name, person.last_name, person.birth_date.day, person.birth_date.month, person.birth_date.year);
}

void print_all_persons (person *persons, int n)
{
    for (int i = 0; i < n; i++)
    {
        print_person(*(persons + i));
    }
}

char *date_to_string (date date)
{
    char *result;
    sprintf(result, "%d.%d.%d", date.day, date.month, date.year);
    return result;
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

/*int find_persons_by_firstname(person persons[], const int n, char name[])
{
    unsigned char *founded = (unsigned char *)calloc(n, sizeof(person));
    for (int i = 0; i < n; i++)
        if (!compare_strings(persons[i].first_name, name))
            *(founded + i) = 1;
    //
    for (int i = 0; i < n; i++)
        if (*(founded + i))
            print_person(*(persons + i));
    return 0;
}//*/

int find_persons_by_firstname(person persons[], int n, char name[], person **result)
{
    int count = 0;
    unsigned int *founded = (unsigned int *)calloc(n, sizeof(person));
    for (int i = 0; i < n; i++)
    {
        if (!compare_strings(persons[i].first_name, name))
        {
            *(founded + i) = 1;
            count++;
        }
    }
    if (!count)
        return 0;    
    /*/
    person *tmp = (person *)realloc(*result, count * sizeof(person));
    if (!tmp)
        return -1;
    free(*result);
    *result = tmp;
    //*/
    person *tmp = (person *)malloc(count * sizeof(person));
    if (!tmp)
        return -1;
    free(*result);
    *result = tmp;
    //*/
    int index = 0;
    for (int i = 0; i < n; i++)
    {
        if (*(founded + i))
        {
            *(tmp + index) = persons[i];
            index++;
        }
    }
    return count;
}

int compare_dates (date date1, date date2)
{
    if (date1.year > date2.year)
        return 1;
    if (date1.year == date2.year)
    {
        if (date1.month > date2.month)
            return 1;
        if (date1.month == date2.month)
        {
            if (date1.day > date2.day)
                return 1;
            if (date1.day == date2.day)
                return 0;
        }
    }
    return -1;
}

int find_persons_by_birthdate (person persons[], int n, date date, person **result)
{
    int count = 0;
    unsigned int *founded = (unsigned int *)calloc(n, sizeof(person));
    for (int i = 0; i < n; i++)
    {
        if (!compare_dates(persons[i].birth_date, date))
        {
            *(founded + i) = 1;
            count++;
        }
    }
    //*
    if (!count)
        return 0;  
    person *tmp = (person *)malloc(count * sizeof(person));
    if (!tmp)
        return -1;
    free(*result);
    *result = tmp;
    //*/
    int index = 0;
    for (int i = 0; i < n; i++)
    {
        if (*(founded + i))
        {
            *(tmp + index) = persons[i];
            index++;
        }
    }
    return count;
}

int main ()
{
    const int count = 17;
    person persons[count] = {{"Alex",     "Vyrazil",   {1996, 11,  5}},
                             {"Leona",    "Kratka",    {1898,  5, 12}},
                             {"Alex",     "Schwarts",  {1975,  1,  1}},
                             {"Alex",     "Kral",      {2000, 10, 20}},
                             {"Julie",    "Hladka",    {2004,  9, 28}},
                             {"Assad",    "Muhamed",   {2004,  9, 11}},
                             {"LeBron",   "James",     {1985,  8, 30}},
                             {"Alex",     "Pie",       {1992,  4,  7}},
                             {"Kralicek", "JOJO",      {2020,  1, 15}},
                             {"Leona",    "Bystra",    {1970, 12, 24}},
                             {"Leona",    "Mala",      {1970, 12, 24}},
                             {"John",     "Wick",      {2000,  1,  1}},
                             {"John",     "Smith",     {2000,  1,  1}},
                             {"John",     "Johnes",    {2000,  1,  1}},
                             {"John",     "Nelson",    {2000,  1,  1}},
                             {"John",     "Carter",    {2000,  1,  1}},
                             {"John",     "King",      {2000,  1,  1}}};
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
    /*
    printf("\n");
    sort_by_name(persons, count);
    find_persons_by_firstname(persons, count, "Leona");
    printf("\n");
    //*/

    person *filtered = (person *)malloc(0);
    int result_size;
    //
    char *name = "Alex";
    if ((result_size = find_persons_by_firstname(persons, count, name, &filtered)) != 0)
    {
        sort_by_name(filtered, result_size);
        printf("\nFiltered %d persons by name %s:\n", result_size, name);
        print_all_persons(filtered, result_size);
        printf("\n");
    }
    //
    date date  = {2000, 1, 1};
    if ((result_size = find_persons_by_birthdate(persons, count, date, &filtered)) != 0)
    {
        printf("\nFiltered %d persons by birthdate %s:\n", result_size, date_to_string(date));
        print_all_persons(filtered, result_size);
        printf("\n");
    }
    //
    free(filtered);

    return 0;
}

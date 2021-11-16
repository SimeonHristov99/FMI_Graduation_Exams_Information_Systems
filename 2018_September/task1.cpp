#include <iostream>
#include <cmath>

// NOTE: Currently this only checks the first letter.
bool ascending_order(const char a[30][100], int cols)
{
    for (int j = 0; j < cols - 1; ++j)
    {
        if (a[j][0] > a[j + 1][0])
        {
            return false;
        }
    }

    return true;
}

void output_word_count(const char a[100])
{
    int counter = 0;

    for (const char *c = a; *c != '\0'; ++c)
    {
        if (*c == ' ')
        {
            std::cout << counter << ' ';
            counter = 0;
        }
        else
        {
            ++counter;
        }
    }

    std::cout << counter << ' ';
}

void revealPassword(const char a[20][30][100], int rows, int cols)
{
    for (int i = 0; i < rows; ++i)
    {
        if (ascending_order(a[i], cols))
        {
            int mid_idx = std::floor(cols / 2.0);
            output_word_count(a[i][mid_idx]);
        }
    }

    std::cout << '\n';
}

int main(int argc, char const *argv[])
{
    const char a[20][30][100] = {
        {"Algebra", "Analyticna geometria", "Calculus"},
        {"Intro to programming", "Object-oriented programming", "Data structures and algorithms"},
        {"Data bases", "Eskustven intelect", "Functional programming"},
    };

    revealPassword(a, 3, 3);

    return 0;
}

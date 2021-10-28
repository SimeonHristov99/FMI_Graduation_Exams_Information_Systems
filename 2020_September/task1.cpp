#include <iostream>
#include <cstring>

bool is_subordinate(
    const char *employee,
    const char *manager,
    const char *leaders[][2],
    size_t n)
{
    if (n == 0)
    {
        return false;
    }

    if (strcmp(manager, leaders[n - 1][1]) == 0)
    {
        return strcmp(employee, leaders[n - 1][0]) == 0 || n - 2 >= 0 && strcmp(employee, leaders[n - 2][0]) == 0;
    }

    return is_subordinate(employee, manager, leaders, (n - 1));
}

const char *the_big_boss(const char *leaders[][2], size_t n)
{
    for (size_t i = 0; i < n - 1; i++)
    {
        bool is_big_boss = true;
        for (size_t j = i + 1; j < n && is_big_boss; j++)
        {
            if (is_subordinate(leaders[i][1], leaders[j][1], leaders, n))
            {
                is_big_boss = false;
            }
        }
        if (is_big_boss)
        {
            return leaders[i][1];
        }
    }

    return leaders[n - 1][1];
}

int main(int argc, char const *argv[])
{
    const char *leaders[][2] = {
        {"Иван Иванов", "Мария Иванова"},
        {"Мария Иванова", "Иван Драганов"},
        {"Иван Драганов", "Стоян Петров"},
    };

    std::cout << std::boolalpha << is_subordinate("Мария Иванова", "Иван Иванов", leaders, 3) << '\n'; // false
    std::cout << is_subordinate("Иван Драганов", "Иван Иванов", leaders, 3) << '\n';                   // false
    std::cout << is_subordinate("Стоян Петров", "Иван Иванов", leaders, 3) << '\n';                    // false
    std::cout << is_subordinate("Стоян Петров", "Мария Иванова", leaders, 3) << '\n';                  // false
    std::cout << is_subordinate("Иван Иванов", "Мария Иванова", leaders, 3) << '\n';                   // true

    std::cout << is_subordinate("Иван Иванов", "Мария Иванова", leaders, 3) << '\n';  // true
    std::cout << is_subordinate("Иван Иванов", "Иван Драганов", leaders, 3) << '\n';  // true
    std::cout << is_subordinate("Иван Иванов", "Стоян Петров", leaders, 3) << '\n';   // false
    std::cout << is_subordinate("Мария Иванова", "Стоян Петров", leaders, 3) << '\n'; // true

    std::cout << "\nThe big boss is: " << the_big_boss(leaders, 3) << ".\n";

    return 0;
}

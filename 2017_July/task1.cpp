#include <iostream>

void step(char terrain[100][100], int rows, int cols)
{
    // Deal with everything except '4'.
    for (int i = 0; i < rows; ++i)
    {
        for (int j = 0; j < cols; ++j)
        {
            if (
                terrain[i][j] != 'R'
                && terrain[i][j] != 'S'
                && terrain[i][j] != '4'
            )
            {
                terrain[i][j] += 1;
            }
        }
    }

    // Deal with '4'.
    for (int i = 0; i < rows; ++i)
    {
        for (int j = 0; j < cols; ++j)
        {
            if (terrain[i][j] != '4')
            {
                continue;
            }

            int num_threes = 0;

            for (int k = -1; k <= 1; ++k)
            {
                for (int l = -1; l <= 1 && num_threes <= 2; ++l)
                {
                    if (
                        0 <= i + k && i + k < rows
                        && 0 <= j + l && j + l < cols
                        && terrain[i + k][j + l] == '3'
                    )
                    {
                        ++num_threes;
                    }
                }
            }

            if (num_threes > 2)
            {
                terrain[i][j] -= 1;
            }
        }
    }
}

void transform(char terrain[100][100], int rows, int cols)
{
    for (int i = 0; i < 10; ++i)
    {
        step(terrain, rows, cols);
    }
}

void test1()
{
    char terrain[][100] = {
        {'R', 'R', '1', '1', '2', '2'},
        {'1', 'R', 'R', 'R', '1', '2'},
        {'S', '1', 'R', 'R', '2', '3'},
        {'4', '4', 'S', 'S', 'R', 'R'},
    };

    std::cout << "Before:\n";
    for (int i = 0; i < 4; ++i)
    {
        for (int j = 0; j < 6; ++j)
        {
            std::cout << terrain[i][j] << ' ';
        }
        std::cout << '\n';
    }
    std::cout << '\n';

    transform(terrain, 4, 6);

    std::cout << "After:\n";
    for (int i = 0; i < 4; ++i)
    {
        for (int j = 0; j < 6; ++j)
        {
            std::cout << terrain[i][j] << ' ';
        }
        std::cout << '\n';
    }
}

void test2()
{
    int cols = 3;
    int rows = 3;
    char terrain[][100] = {
        {'2', '2', '1'},
        {'1', '4', '1'},
        {'R', '2', '2'},
    };

    std::cout << "Before:\n";
    for (int i = 0; i < rows; ++i)
    {
        for (int j = 0; j < cols; ++j)
        {
            std::cout << terrain[i][j] << ' ';
        }
        std::cout << '\n';
    }
    std::cout << '\n';

    step(terrain, 3, 3);

    std::cout << "After:\n";
    for (int i = 0; i < rows; ++i)
    {
        for (int j = 0; j < cols; ++j)
        {
            std::cout << terrain[i][j] << ' ';
        }
        std::cout << '\n';
    }
    std::cout << '\n';

    step(terrain, 3, 3);

    std::cout << "After:\n";
    for (int i = 0; i < rows; ++i)
    {
        for (int j = 0; j < cols; ++j)
        {
            std::cout << terrain[i][j] << ' ';
        }
        std::cout << '\n';
    }

    /*
    Before:
    2 2 1 
    1 4 1 
    R 2 2 

    After:
    3 3 2 
    2 3 2 
    R 3 3 

    After:
    4 3 3 
    3 3 3 
    R 3 3
    */
}

int main(int argc, char const *argv[])
{
    test1();
    test2();

    return 0;
}

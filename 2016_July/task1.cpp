#include <iostream>

const int SIZE = 11;

void sub_with_mean(float matrix[][SIZE], const int size)
{
    for (int i = 0; i < size / 2; ++i)
    {
        for (int j = 0; j < size; ++j)
        {
            float sum = matrix[i][j];
            int n = 1;

            if (j != i)
            {
                sum += matrix[j][i];
                ++n;
            }
            if (size - 1 - i >= 0 && size - 1 - j >= 0)
            {
                sum += matrix[size - 1 - i][size - 1 - j];
                ++n;
                if (i != j)
                {
                    sum += matrix[size - 1 - j][size - 1 - i];
                    ++n;
                }
            }

            sum /= n;

            matrix[i][j] = sum;
            if (j != i)
            {
                matrix[j][i] = sum;
            }
            if (size - 1 - i >= 0 && size - 1 - j >= 0)
            {
                matrix[size - 1 - i][size - 1 - j] = sum;
                if (i != j)
                {
                    matrix[size - 1 - j][size - 1 - i] = sum;
                }
                ++n;
            }
        }
    }
}

void test1()
{
    int size = 3;
    float matrix[SIZE][SIZE] = {
        {1, 1, 1},
        {1, 1, 1},
        {1, 1, 1},
    };

    std::cout << "Before:\n";
    for (int i = 0; i < size; ++i)
    {
        for (int j = 0; j < size; ++j)
        {
            std::cout << matrix[i][j] << ' ';
        }
        std::cout << '\n';
    }
    std::cout << '\n';

    sub_with_mean(matrix, size);

    std::cout << "After:\n";
    for (int i = 0; i < size; ++i)
    {
        for (int j = 0; j < size; ++j)
        {
            std::cout << matrix[i][j] << ' ';
        }
        std::cout << '\n';
    }
}

void test2()
{
    int size = 3;
    float matrix[SIZE][SIZE] = {
        {1, 1, 1},
        {2, 1, 2},
        {1, 7, 5},
    };

    std::cout << "Before:\n";
    for (int i = 0; i < size; ++i)
    {
        for (int j = 0; j < size; ++j)
        {
            std::cout << matrix[i][j] << ' ';
        }
        std::cout << '\n';
    }
    std::cout << '\n';

    sub_with_mean(matrix, size);

    std::cout << "After:\n";
    for (int i = 0; i < size; ++i)
    {
        for (int j = 0; j < size; ++j)
        {
            std::cout << matrix[i][j] << ' ';
        }
        std::cout << '\n';
    }
}

int main(int argc, char const *argv[])
{
    test1();
    test2();

    return 0;
}

#include <iostream>

bool walkHelper(int matrix[10][10], const char* directions, size_t i, size_t j) {
    if (!*directions) {
        return i == 9 && j == 9;
    }

    return *directions == 'e' && j < 9 && matrix[i][j + 1] == 1 && walkHelper(matrix, directions + 1, i, j + 1)
        || *directions == 'w' && j > 0 && matrix[i][j - 1] == 1 && walkHelper(matrix, directions + 1, i, j - 1)
        || *directions == 's' && i < 9 && matrix[i + 1][j] == 1 && walkHelper(matrix, directions + 1, i + 1, j)
        || *directions == 'n' && i > 0 && matrix[i - 1][j] == 1 && walkHelper(matrix, directions + 1, i - 1, j);
}

bool walk(int matrix[10][10], const char* directions) {
    for (size_t i = 0; i < 10; i++)
    {
        for (size_t j = 0; j < 10; j++)
        {
            if (matrix[i][j] == 1 && walkHelper(matrix, directions, i, j)) {
                return true;
            }
        }
    }

    return false;
}

int main()
{
    int matrix[10][10] = {
            { 0, 1, 0, 0, 0, 0, 1, 1, 1, 0 },
            { 0, 1, 1, 0, 0, 0, 1, 0, 1, 0 },
            { 0, 1, 1, 1, 1, 0, 1, 0, 1, 1 },
            { 0, 0, 0, 0, 1, 1, 1, 0, 0, 1 },
            { 0, 0, 0, 0, 0, 1, 1, 0, 0, 1 },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
            { 0, 0, 0, 0, 0, 1, 1, 1, 1, 1 },
            { 0, 0, 0, 0, 1, 1, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 1, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 1, 1, 1, 1, 1, 1 },
    };

    const char* path0 = "sseeesesennnneessesssswwwwswsseeeee";
    const char* path1 = "e";
    const char* path2 = "nsseeesesennnneessesssswwwwswsseeeee";
    const char* path3 = "esseeesesennnneessesssswwwwswsseeeee";
    const char* path4 = "wsseeesesennnneessesssswwwwswsseeeee";
    const char* path5 = "sseeesesennnneessesssswwwwwwsseeeee";

    std::cout << std::boolalpha << walk(matrix, path0) << '\n';
    std::cout << walk(matrix, path1) << '\n';
    std::cout << walk(matrix, path2) << '\n';
    std::cout << walk(matrix, path3) << '\n';
    std::cout << walk(matrix, path4) << '\n';
    std::cout << walk(matrix, path5) << '\n';

    return 0;
}

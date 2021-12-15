#include <iostream>

bool member(int x, int a[], int size)
{
    if (size == 0)
        return false;
    return a[size / 2] == x ||
           (a[size / 2] < x && member(x, a + size / 2 + 1, size / 2 - 1)) ||
           (member(x, a, size / 2));
}

int main(int argc, char const *argv[])
{
    int arr[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

    for (int i = 0; i <= 10; ++i)
    {
        std::cout << member(i, arr, 10) << '\n'; // first is 0, rest are 1
    }

    // Б
    std::cout << "\n\nPart 2: ";
    int nums[9] = {5, 3, 2, 8, 1, 0, 11, 420, 69};
    int size = 9;

    for (int i = 0; i < size - 1; ++i)
    {
        int min = i;
        for (int j = i + 1; j < size; ++j)
        {
            if (nums[j] < nums[min])
                min = j;
        }
        if (min != i)
        {
            int x = nums[i];
            nums[i] = nums[min];
            nums[min] = x;
        }
    }

    for (int i = 0; i < 9; ++i)
    {
        std::cout << nums[i] << ' ';
    }
    std::cout << '\n';

    // В -> в
    int a = 0; int b = 15; int result = -1;
    if(b < 10 && b / a < 10) result = 0;
    else result = 1;
    std::cout << "result: " << result << '\n';

    // Г -> a
    std::cout << (6 | 11) << '\n';

    return 0;
}

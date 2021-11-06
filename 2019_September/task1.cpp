#include <iostream>

bool find(int value, int *arr, size_t size)
{
    if (size == 0)
    {
        return false;
    }

    size_t mid = size / 2;
    if (value == arr[mid])
    {
        return true;
    }

    if (value < arr[mid])
    {
        return find(value, arr, mid);
    }
    else
    {
        return find(value, arr + mid + 1, mid - 1);
    }
}

int main(int argc, char const *argv[])
{
    int arr1[] = {1, 2, 3, 4, 5};
    int arr2[] = {1, 2, 4, 6};
    int arr3[] = {1, 2, 4, 5};
    int arr4[] = {1, 2, 5, 6};
    int arr5[] = {5, 6, 7, 8};
    int arr6[] = {1, 5, 6, 7};
    int arr7[] = {1, 2, 5, 6, 7};
    int arr8[] = {5, 6, 7, 8, 9};

    // std::cout << std::boolalpha << find(5, arr2, 4) << '\n'; // false
    // std::cout << find(5, arr4, 4) << '\n'; // true
    std::cout << find(5, arr3, 4) << '\n'; // true
    // std::cout << find(5, arr1, 5) << '\n'; // true
    // std::cout << find(5, arr5, 4) << '\n'; // true
    // std::cout << find(5, arr6, 4) << '\n'; // true
    // std::cout << find(5, arr7, 5) << '\n'; // true
    // std::cout << find(5, arr8, 5) << '\n'; // true

    return 0;
}

#include <iostream>
#include <cstring>

bool find(int value, int *arr, size_t size)
{
    if (size == 0)
    {
        return arr[0] == value;
    }

    size_t mid = size / 2;

    if (value == arr[mid])
    {
        return true;
    }

    if (value < arr[mid])
    {
        return find(value, arr, size - mid - 1);
    }
    else
    {
        return find(value, arr + mid + 1, size - mid - 1);
    }
}

template <typename ReturnType, typename InputType, typename OpType>
ReturnType fold_left(InputType *arr, size_t size, OpType op, ReturnType nil)
{
    ReturnType result = nil;

    for (size_t i = 0; i < size; ++i)
    {
        result = op(arr[i], result);
    }

    return result;
}

int op(char Digit, int Result)
{
    return (Result * 10) + (Digit - '0');
}

int str_to_int(const char *str)
{
    return (str == nullptr) ? 0 : fold_left(str, strlen(str), op, 0);
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

    std::cout << std::boolalpha << find(5, arr2, 4) << '\n'; // false
    std::cout << find(5, arr4, 4) << '\n';                   // true
    std::cout << find(5, arr3, 4) << '\n';                   // true
    std::cout << find(5, arr1, 5) << '\n';                   // true
    std::cout << find(5, arr5, 4) << '\n';                   // true
    std::cout << find(5, arr6, 4) << '\n';                   // true
    std::cout << find(5, arr7, 5) << '\n';                   // true
    std::cout << find(5, arr8, 5) << '\n';                   // true
    std::cout << find(6, arr8, 5) << '\n';                   // true
    std::cout << find(66, arr8, 5) << '\n';                  // false

    std::cout << str_to_int("1") << '\n';    // 1
    std::cout << str_to_int("123") << '\n';  // 123
    std::cout << str_to_int("1234") << '\n'; // 1234

    return 0;
}

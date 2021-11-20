#include <iostream>

void numToStr(int num, char *buf, int numDigits)
{
    while (num > 0)
    {
        buf[--numDigits] = num % 10 + '0';
        num /= 10;
    }
}

int numDigits(int x)
{
    if (x < 10)
    {
        return 1;
    }

    return 1 + numDigits(x /= 10);
}

bool helper(const char *xStr, const char *yStr)
{
    if (!xStr && yStr || *xStr < *yStr)
    {
        return true;
    }

    if (xStr && !yStr || !xStr && !yStr || *xStr > *yStr)
    {
        return false;
    }

    return helper(++xStr, ++yStr);
}

bool lexSmallerThan(int x, int y)
{
    int len_x = numDigits(x);
    int len_y = numDigits(y);

    char *xStr = new char[len_x];
    char *yStr = new char[len_y];

    numToStr(x, xStr, len_x);
    numToStr(y, yStr, len_y);

    bool result = helper(xStr, yStr);

    delete[] xStr;
    delete[] yStr;

    xStr = nullptr;
    yStr = nullptr;

    return result;
}

void sortLex(int nums[], int size)
{
    for (int i = 0; i < size - 1; ++i)
    {
        int minIdx = i;

        for (int j = i + 1; j < size; ++j)
        {
            if (lexSmallerThan(nums[j], nums[minIdx]))
            {
                minIdx = j;
            }
        }

        int tmp = nums[i];
        nums[i] = nums[minIdx];
        nums[minIdx] = tmp;
    }
}

void test1()
{
    int numbers[6] = {13, 14, 7, 2018, 9, 0};

    sortLex(numbers, 6);

    for (int i = 0; i < 6; ++i)
    {
        std::cout << numbers[i] << ' ';
    }
    std::cout << '\n';
}

int main(int argc, char const *argv[])
{
    test1();

    // std::cout << lexSmallerThan(201, 2018) << '\n'; // 1

    return 0;
}

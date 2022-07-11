#include <iostream>
#include <cmath>

int calc(int a[5])
{
    int sum = 8;
    for (int i = 0; a[i]; ++i)
        sum += i;
    return sum;
}

void part1()
{
    int a[7] = {1, 2, 3};
    std::cout << calc(a);
}

void part2()
{
    char text[] = "hello", *p = text;
    while (*p)
        std::cout << ++*p++;
}

void part3()
{
    int *pt;
    int a[3] = {4, 19, 13};
    pt = &a[1];
    pt += 1;
    std::cout << *pt << std::endl;
}

void part4()
{
    int A[4] = {-1, -2, -3, -4};
    int B[4] = {10, 20, 30, -1};

    int *arr1 = A;
    const int *arr2 = B;

    int *p1 = arr1;
    const int *p2 = arr2;
    while (*p2 >= 0)
    {
        *p1++ = *p2++;
    }

    std::cout << A[0] << ' ' << A[1] << ' ' << A[2] << ' ' << A[3] << '\n';
    std::cout << B[0] << ' ' << B[1] << ' ' << B[2] << ' ' << B[3] << '\n';
}

struct Point
{
    float x, y;
};

struct Circle
{
    Point center;
    float r;
};

enum RelativePosition
{
    NO_COMMON_POINTS,
    TOUCHING,
    INTERSECTING,
    SAME
};

float calcDist(const Point &p1, const Point &p2)
{
    float dx = p1.x - p2.x;
    float dy = p1.y - p2.y;

    return sqrt(dx * dx + dy * dy);
}

RelativePosition findRelativePosition(const Circle &c1, const Circle &c2)
{
    float d = calcDist(c1.center, c2.center);
    float minR = (c1.r < c2.r ? c1.r : c2.r);
    float maxR = (c1.r < c2.r ? c2.r : c1.r);

    if (d == 0 && minR == maxR)
    {
        return RelativePosition::SAME;
    }

    if (maxR - minR < d && d < maxR + minR)
    {
        return RelativePosition::INTERSECTING;
    }

    if (maxR - minR == d || d == maxR + minR)
    {
        return RelativePosition::TOUCHING;
    }

    return RelativePosition::NO_COMMON_POINTS;
}

int main()
{
    part1(); // 11
    part2(); // ifmmp
    part3(); // 13
    part4(); // A: 10 20 30 -4 | B: 10 20 30 -1

    return 0;
}

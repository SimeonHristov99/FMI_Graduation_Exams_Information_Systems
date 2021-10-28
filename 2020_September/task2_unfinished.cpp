#include <iostream>
#include <vector>
#include <set>

class Point2D
{
public:
    Point2D(double _x = 0, double _y = 0)
        : x(_x), y(_y)
    {
    }

private:
    double x;
    double y;
};

class PointSet2D
{
public:
    PointSet2D(const std::set<Point2D> _pts = {})
        : pts(_pts)
    {
    }

    PointSet2D operator+(std::vector<Point2D> rhs) const
    {
        return *this;
    }

private:
    std::set<Point2D> pts;
};

int main(int argc, char const *argv[])
{
    std::cout << "Hello, world!\n";

    std::set<int> s;

    s.insert(5);
    s.insert(5);

    for (auto it = s.begin(); it != s.end(); ++it)
    {
        std::cout << *it << ' ';
    }
    std::cout << '\n';

    return 0;
}

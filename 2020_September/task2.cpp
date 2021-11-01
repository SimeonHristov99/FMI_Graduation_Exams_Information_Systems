#include <iostream>
#include <vector>
#include <set>
#include <cmath>

class Point2D
{
public:
    Point2D(double _x = 0, double _y = 0)
        : x(_x), y(_y)
    {
    }

    double get_x() const
    {
        return x;
    }

    double get_y() const
    {
        return y;
    }

    void move(const double new_x, const double new_y) // for testing puposes
    {
        x = new_x;
        y = new_y;
    }

    bool operator==(const Point2D &rhs) const
    {
        return x == rhs.x && y == rhs.y;
    }

    bool operator<(const Point2D &rhs) const // for the sake of using std::set
    {
        return x < rhs.x || x == rhs.x && y < rhs.y;
    }

    // for testing puposes
    friend std::ostream &operator<<(std::ostream &out, const Point2D &point)
    {
        return out << '(' << point.x << ", " << point.y << ')';
    }

private:
    double x;
    double y;
};

class PointSet2D
{
public:
    PointSet2D()
    {
    }

    PointSet2D operator+(const std::vector<Point2D> &rhs) const
    {
        PointSet2D result = *this;

        for (const Point2D &p : rhs)
        {
            result.pts.insert(p);
        }

        return result;
    }

    PointSet2D operator+(const PointSet2D &rhs) const
    {
        PointSet2D result = *this;

        return result += rhs;
    }

    PointSet2D &operator+=(const std::vector<Point2D> &rhs)
    {
        for (const Point2D &p : rhs)
        {
            pts.insert(p);
        }

        return *this;
    }

    PointSet2D &operator+=(const PointSet2D &rhs)
    {
        for (const Point2D &p : rhs.pts)
        {
            pts.insert(p);
        }

        return *this;
    }

    std::set<Point2D>::iterator begin() const
    {
        return pts.begin();
    }

    std::set<Point2D>::iterator end() const
    {
        return pts.end();
    }

    // for testing puposes
    friend std::ostream &operator<<(std::ostream &out, const PointSet2D &points)
    {
        out << "[ ";
        for (const Point2D& p : points)
        {
            out << p << ' ';
        }
        out << ']';

        return out;
    }

private:
    std::set<Point2D> pts;
};

bool within(const PointSet2D &points, const Point2D &center, double radius)
{
    for (const Point2D &p : points)
    {
        double x_p = p.get_x();
        double y_p = p.get_y();

        double x_c = center.get_x();
        double y_c = center.get_y();

        if ((x_p - x_c) * (x_p - x_c) + (y_p - x_c) * (y_p - x_c) > radius * radius)
        {
            return false;
        }
    }

    return true;
}

int main(int argc, char const *argv[])
{
    Point2D p1(0, 0);
    Point2D p2(1, 1);
    Point2D p3(-1, -1);
    Point2D p4(0, 0);
    Point2D p1_copy(p1);

    std::cout << p1 << ' ' << p1_copy << '\n'; // (0, 0) (0, 0)
    p1.move(10, 10);
    std::cout << p1 << ' ' << p1_copy << '\n'; // (10, 10) (0, 0)
    std::cout << (p1_copy < p1) << '\n';       // 1
    p1.move(0, 0);
    std::cout << (p1 == p4) << '\n'; // 1

    std::vector<Point2D> pts = {p1, p2, p3, p4, p1_copy};

    std::cout << "\n\nAll points:\n";
    for (auto p : pts)
    {
        std::cout << p << '\n';
    }

    std::cout << "\n\n";

    PointSet2D point_set1;
    std::cout << "set 1 before: " << point_set1 << '\n';
    point_set1 += pts;
    std::cout << "set 1 after: " << point_set1 << '\n';

    std::cout << "Moving p1 to check for shallow copy:\n";
    p1.move(-9, 0);
    std::cout << "New p1: " << p1 << '\n';
    std::cout << point_set1 << '\n';

    std::cout << "\n\n";

    PointSet2D point_set2;
    std::cout << "set 2 before: " << point_set2 << '\n';
    point_set2 = point_set2 + pts;
    std::cout << "set 2 after: " << point_set2 << '\n';

    std::cout << "Moving p1 to check for shallow copy:\n";
    p1.move(9, 0);
    std::cout << "New p1: " << p1 << '\n';
    std::cout << point_set2 << '\n';

    std::cout << "\n\n";

    PointSet2D point_set3;
    std::cout << "set 3 before: " << point_set2 << '\n';
    point_set3 = point_set1 + point_set2;
    // should be the same as the other sets
    std::cout << "set 3 after: " << point_set3 << '\n';
    Point2D p5(5, 5);
    Point2D p6(6, 6);
    pts.push_back(p5);
    point_set2 += pts;
    pts.pop_back();
    pts.push_back(p6);
    point_set1 += pts;
    std::cout << "set 1 after: " << point_set1 << '\n';
    std::cout << "set 2 after: " << point_set2 << '\n';
    point_set3 = point_set1 + point_set2;
    // should have an extra p5 and p6
    std::cout << "set 3 after: " << point_set3 << '\n';

    std::cout << "\n\nTraverse set 3:\n";
    for (const Point2D& p : point_set3) {
        std::cout << p << '\n';
    }

    std::cout << std::boolalpha << (within(point_set3, Point2D(0, 0), 6)) << '\n'; // false
    std::cout << (within(point_set3, Point2D(0, 0), ceil(sqrt(72)))) << '\n'; // true, all are inside, except (6, 6) which is on edge
    std::cout << (within(point_set3, Point2D(0, 0), 9)) << '\n'; // true, all are inside

    return 0;
}

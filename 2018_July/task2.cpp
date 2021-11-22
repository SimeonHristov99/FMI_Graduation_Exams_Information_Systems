#include <iostream>
#include <cmath>

template <class T>
class Polynome
{
public:
    Polynome(const T *new_coeffs, int new_size)
    {
        size = new_size;
        coeffs = new T[size];

        for (int i = 0; i < size; ++i)
        {
            coeffs[i] = new_coeffs[i];
        }
    }

    Polynome(const Polynome &rhs)
    {
        copy(rhs);
    }

    Polynome &operator=(const Polynome &rhs)
    {
        if (this != &rhs)
        {
            del();
            copy(rhs);
        }

        return *this;
    }

    ~Polynome()
    {
        delete[] coeffs;
        coeffs = nullptr;
        size = 0;
    }

    Polynome operator+(const Polynome &rhs) const
    {
        bool rhs_longer = false;
        int size_diff = abs(rhs.size - this->size);

        if (rhs.size > this->size)
        {
            rhs_longer = true;
            size_diff = rhs.size - this->size;
        }

        T *new_coeffs = new T[(rhs_longer ? rhs.size : this->size)];

        for (int i = 0; i < size_diff; i++)
        {
            new_coeffs[i] = (rhs_longer ? rhs.coeffs[i] : this->coeffs[i]);
        }

        for (int i = size_diff, j = 0; i < (rhs_longer ? rhs.size : this->size); ++i, ++j)
        {
            if (rhs_longer)
            {
                new_coeffs[i] = this->coeffs[j] + rhs.coeffs[i];
            }
            else
            {
                new_coeffs[i] = this->coeffs[i] + rhs.coeffs[j];
            }
        }

        Polynome result(new_coeffs, (rhs_longer ? rhs.size : this->size));

        delete[] new_coeffs;
        new_coeffs = nullptr;

        return result;
    }

    Polynome operator-(const Polynome &rhs) const
    {
        bool rhs_longer = false;
        int size_diff = abs(rhs.size - this->size);

        if (rhs.size > this->size)
        {
            rhs_longer = true;
            size_diff = rhs.size - this->size;
        }

        T *new_coeffs = new T[(rhs_longer ? rhs.size : this->size)];

        for (int i = 0; i < size_diff; i++)
        {
            new_coeffs[i] = (rhs_longer ? rhs.coeffs[i] : this->coeffs[i]);
        }

        for (int i = size_diff, j = 0; i < (rhs_longer ? rhs.size : this->size); ++i, ++j)
        {
            if (rhs_longer)
            {
                new_coeffs[i] = this->coeffs[j] - rhs.coeffs[i];
            }
            else
            {
                new_coeffs[i] = this->coeffs[i] - rhs.coeffs[j];
            }
        }

        Polynome result(new_coeffs, (rhs_longer ? rhs.size : this->size));

        delete[] new_coeffs;
        new_coeffs = nullptr;

        return result;
    }

    Polynome operator*(const T &x) const
    {
        T *new_coeffs = new T[this->size];

        for (int i = 0; i < this->size; ++i)
        {
            new_coeffs[i] = this->coeffs[i] * x;
        }

        Polynome result(new_coeffs, this->size);

        delete[] new_coeffs;
        new_coeffs = nullptr;

        return result;
    }

    Polynome &operator+=(const Polynome &rhs)
    {
        *this = *this + rhs;
        return *this;
    }

    Polynome &operator-=(const Polynome &rhs)
    {
        *this = *this - rhs;
        return *this;
    }

    Polynome &operator*=(const T &value)
    {
        *this = *this * value;
        return *this;
    }

    T &operator[](const int idx)
    {
        if (!(0 <= idx < size))
        {
            return coeffs[0];
        }

        return coeffs[idx];
    }

    T operator()(const T &value)
    {
        T result = 0;

        for (int i = 0; i < size; ++i)
        {
            result += coeffs[i] * pow(value, (size - i - 1));
        }

        return result;
    }

    friend std::ostream &operator<<(std::ostream &out, const Polynome &data)
    {
        for (int i = 0; i < data.size; ++i)
        {
            out << data.coeffs[i] << ' ';
        }
        return out;
    }

private:
    T *coeffs;
    int size;

    void copy(const Polynome &rhs)
    {
        size = rhs.size;
        coeffs = new T[size];

        for (int i = 0; i < size; ++i)
        {
            coeffs[i] = rhs.coeffs[i];
        }
    }

    void del()
    {
        size = 0;
        delete[] coeffs;
        coeffs = nullptr;
    }
};

void test_double_prod()
{
    int lhs_coeffs[] = {3, 2, 1};

    Polynome<int> p(lhs_coeffs, 3);

    std::cout << p * 5 << '\n';
    std::cout << p * -1 << '\n';
}

void test_single_prod()
{
    int lhs_coeffs[] = {3, 2, 1};

    Polynome<int> p(lhs_coeffs, 3);

    std::cout << (p *= 5) << '\n';
    std::cout << (p *= -1) << '\n';
}

void test_eq_len_addition()
{
    int lhs_coeffs[] = {3, 2, 1};
    int rhs_coeffs[] = {1, 2, 3};

    Polynome<int> p1(lhs_coeffs, 3);
    Polynome<int> p2(rhs_coeffs, 3);

    std::cout << p1 + p2 << '\n';
}

void test_add_len_addition1()
{
    int lhs_coeffs[] = {4, 3, 2, 1};
    int rhs_coeffs[] = {3};

    Polynome<int> p1(lhs_coeffs, 4);
    Polynome<int> p2(rhs_coeffs, 1);
    std::cout << p1 + p2 << '\n';
}

void test_add_len_addition2()
{
    int lhs_coeffs[] = {3};
    int rhs_coeffs[] = {4, 3, 2, 1};

    Polynome<int> p1(lhs_coeffs, 1);
    Polynome<int> p2(rhs_coeffs, 4);
    std::cout << p1 + p2 << '\n';
}

void test_diff_len_addition1()
{
    int lhs_coeffs[] = {4, 3, 2, 1};
    int rhs_coeffs[] = {3};

    Polynome<int> p1(lhs_coeffs, 4);
    Polynome<int> p2(rhs_coeffs, 1);
    std::cout << p1 - p2 << '\n';
}

void test_diff_len_addition2()
{
    int lhs_coeffs[] = {3};
    int rhs_coeffs[] = {4, 3, 2, 1};

    Polynome<int> p1(lhs_coeffs, 1);
    Polynome<int> p2(rhs_coeffs, 4);
    std::cout << p1 - p2 << '\n';
}

void test_single_add1()
{
    int lhs_coeffs[] = {4, 3, 2, 1};
    int rhs_coeffs[] = {3};

    Polynome<int> p1(lhs_coeffs, 4);
    Polynome<int> p2(rhs_coeffs, 1);
    std::cout << (p1 += p2) << '\n';
}

void test_single_add2()
{
    int lhs_coeffs[] = {3};
    int rhs_coeffs[] = {4, 3, 2, 1};

    Polynome<int> p1(lhs_coeffs, 1);
    Polynome<int> p2(rhs_coeffs, 4);
    std::cout << (p1 += p2) << '\n';
}

void test_single_diff1()
{
    int lhs_coeffs[] = {4, 3, 2, 1};
    int rhs_coeffs[] = {3};

    Polynome<int> p1(lhs_coeffs, 4);
    Polynome<int> p2(rhs_coeffs, 1);
    std::cout << (p1 -= p2) << '\n';
}

void test_single_diff2()
{
    int lhs_coeffs[] = {3};
    int rhs_coeffs[] = {4, 3, 2, 1};

    Polynome<int> p1(lhs_coeffs, 1);
    Polynome<int> p2(rhs_coeffs, 4);
    std::cout << (p1 -= p2) << '\n';
}

void test_indexing()
{
    int coeffs[] = {4, 3, 2, 1};

    Polynome<int> p(coeffs, 4);

    std::cout << p << '\n';

    p[0] = 42;
    p[3] = 42;

    std::cout << p << '\n';
}

void test_calculation()
{
    int coeffs[] = {4, 3, 2, 1};

    Polynome<int> p(coeffs, 4);

    std::cout << p(0) << '\n';
    std::cout << p(1) << '\n';
    std::cout << p(10) << '\n';
}

int main(int argc, char const *argv[])
{
    // test_double_prod(); // 15 10 5 and -3 -2 -1
    // test_single_prod(); // 15 10 5 and -15 -10 -5

    // test_eq_len_addition(); // 4 4 4

    // test_add_len_addition1(); // 4 3 2 4
    // test_add_len_addition2(); // 4 3 2 4

    // test_diff_len_addition1(); // 4 3 2 -2
    // test_diff_len_addition2(); // 4 3 2 2

    // test_single_add1(); // 4 3 2 4
    // test_single_add2(); // 4 3 2 4

    // test_single_diff1(); // 4 3 2 -2
    // test_single_diff2(); // 4 3 2 2

    // test_indexing(); // 4 3 2 1 and 42 3 2 42

    test_calculation(); // 1, 10 and 4321

    return 0;
}

#include <iostream>

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

    ~Polynome()
    {
        delete[] coeffs;
        coeffs = nullptr;
        size = 0;
    }

    Polynome operator+(const Polynome &rhs)
    {
        T *new_coeffs = new T[this->size];

        for (int i = 0; i < this->size; i++)
        {
            new_coeffs[i] = this->coeffs[i] + rhs.coeffs[i];
        }

        Polynome result(new_coeffs, this->size);

        delete[] new_coeffs;
        new_coeffs = nullptr;

        return result;
    }

    Polynome operator-(const Polynome &rhs)
    {
        T *new_coeffs = new T[this->size];

        for (int i = 0; i < this->size; i++)
        {
            new_coeffs[i] = this->coeffs[i] - rhs.coeffs[i];
        }

        Polynome result(new_coeffs, this->size);

        delete[] new_coeffs;
        new_coeffs = nullptr;

        return result;
    }

    Polynome operator*(const Polynome &rhs)
    {
        T *new_coeffs = new T[this->size];

        for (int i = 0; i < this->size; i++)
        {
            for (int j = 0; j < this->size; ++j)
            {
                new_coeffs[i] = this->coeffs[i] * rhs.coeffs[i];
            }
        }

        Polynome result(new_coeffs, this->size);

        delete[] new_coeffs;
        new_coeffs = nullptr;

        return result;
    }

    Polynome operator*(const T &x)
    {
    }

    Polynome &operator+=(const Polynome &rhs)
    {
    }

    Polynome &operator-=(const Polynome &rhs)
    {
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
};

int main(int argc, char const *argv[])
{
    int lhs_coeffs[] = {3, 2, 1};
    int rhs_coeffs[] = {1, 2, 3};

    Polynome<int> p1(lhs_coeffs, 3);
    Polynome<int> p2(rhs_coeffs, 3);

    Polynome<int> sum = p1 + p2;
    std::cout << sum << '\n';

    Polynome<int> diff = p1 - p2;
    std::cout << diff << '\n';

    Polynome<int> prod = p1 * p2;
    std::cout << prod << '\n';

    return 0;
}

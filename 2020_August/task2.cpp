#include <iostream>
#include <functional>

template <class T>
class Sequence
{
public:
    Sequence(const T &new_a, const T &new_d, const unsigned new_n)
        : a(new_a), d(new_d), n(new_n), i(0)
    {
    }

    virtual T current() const
    {
        return a + i * d;
    }

    virtual void next()
    {
        if (i < n)
        {
            ++i;
        }
    }

    virtual bool last() const
    {
        return i == n;
    }

private:
    T a;
    T d;
    unsigned n;
    int i;
};

template <class T>
class MappedSequence : public Sequence<T>
{
public:
    MappedSequence(
        const T &new_a,
        const T &new_d,
        const unsigned new_n,
        std::function<T(T)> new_func)
        : Sequence<T>(new_a, new_d, new_n)
    {
        func = new_func;
    }

    virtual T current() const override
    {
        return func(Sequence<T>::current());
    }

    virtual void next() override
    {
        Sequence<T>::next();
    }

    virtual bool last() const override
    {
        return Sequence<T>::last();
    }

private:
    std::function<T(T)> func;
};

int square (int x) { return x * x; }

int main(int argc, char const *argv[])
{
    std::cout << "Part a)\n";
    Sequence<int> s0(0, 1, 10);

    std::cout << s0.current() << std::endl;

    do
    {
        s0.next();
        std::cout << s0.current() << std::endl;
    } while (!s0.last());

    std::cout << "\n\nPart b)\n";

    MappedSequence<int> s1(0, 1, 10, square);
    std::cout << s1.current() << std::endl;
    do
    {
        s1.next();
        std::cout << s1.current() << std::endl;
    } while (!s1.last());

    return 0;
}

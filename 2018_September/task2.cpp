#include <iostream>

class Counter
{
    static int count;

public:
    Counter()
    {
        ++count;
    }

    ~Counter()
    {
        --count;
    }

    Counter(const Counter &other)
    {
        ++count;
    }

    Counter &operator=(const Counter &other)
    {
        return *this;
    }

    static int GetObjCount()
    {
        return count;
    }
};

int Counter::count = 0;

class Derived : public Counter
{
};

int main(int argc, char const *argv[])
{
    /*************************************************
     * PART A
     **************************************************/
    std::cout << Counter::GetObjCount() << '\n'; // 0
    Counter *p = new Counter[10];

    std::cout << Counter::GetObjCount() << '\n'; // 10
    delete[] p;

    std::cout << Counter::GetObjCount() << '\n'; // 0

    Counter a, b;
    Counter c = a;
    a = b;

    std::cout << Counter::GetObjCount() << '\n'; // 3

    /*************************************************
     * PART B
     * 
     * NOTE: In order to get correct result, comment
     * out the code for part A.
     **************************************************/

    Derived d1;
    std::cout << Derived::GetObjCount() << '\n';
    /**
     * Ouput: 1, because there is a calle to the default
     * contructor of Counter
     */

    Counter c;
    std::cout << Counter::GetObjCount() << '\n';
    /**
     * Ouput: 2, because there will be a new call to
     * the default contructor of Counter
     */

    Counter *p = new Derived;
    std::cout << Counter::GetObjCount() << '\n';
    /**
     * Ouput: 3, because there will be a new call to
     * the default contructor of Counter
     */

    std::cout << Derived::GetObjCount() << '\n';
    /**
     * Ouput: 3, because static variables and functions
     * get inherited and their values don't change
     * in the derived classes
     */

    delete p;
    std::cout << Counter::GetObjCount() << '\n';
    /**
     * Ouput: 2, because there will be a call to the
     * destructor of Couter
     */

    std::cout << Derived::GetObjCount() << '\n';
    /**
     * Ouput: 2, static variables have shared variabels
     * across parents and children
     */

    return 0;
}

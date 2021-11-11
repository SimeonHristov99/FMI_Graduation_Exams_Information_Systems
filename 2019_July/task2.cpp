#include <iostream>

class Base
{
public:
    static Base &getInstance()
    {
        static Base instance;
        return instance;
    }

private:
    Base()
    {
    }

    Base(const Base &);

    Base &operator=(const Base &);
};

class Derived : public Base
{
};

int main(int argc, char const *argv[])
{
    Base &b1 = Base::getInstance();
    Base &b2 = Base::getInstance();

    // prints 1
    std::cout << (&b1 == &b2) << '\n';

    Base &d1 = Derived::getInstance();
    Base &d2 = Derived::getInstance();

    // prints 1
    std::cout << (&d1 == &d2) << '\n';

    /*
        The class "Derived" cannot be a singleton.
        In fact there is no way to get an instance it. The above example
        shows that the "getInstance" method is inherited but it always returns
        a "Base" instance. On the other hand, the constructor for the "Derived"
        class will be deleted because it will have to call the "Base" constructor
        but it is private. So, technically there is no mistake, but the
        "Derived" class cannot be regarded as a singleton (as there is no
        way to instanciate it).
    */

    return 0;
}

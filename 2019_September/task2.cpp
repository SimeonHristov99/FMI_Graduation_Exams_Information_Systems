#include <iostream>

class Base
{
public:
    Base()
    {
        std::cout << "Base::Base\n";
    }

    ~Base()
    {
        std::cout << "Base::~Base\n";
    }

    virtual void f()
    {
        std::cout << "Base::f\n";
    }
};

class Derived : public Base
{

public:
    Derived()
    {
        std::cout << "Derived::Derived\n";
        s = new char[256];
    }

    ~Derived()
    {
        std::cout << "Derived::~Derived\n";
        delete[] s;
        s = nullptr;
    }

    virtual void f()
    {
        std::cout << "Derived::f\n";
    }

private:
    char *s;
};

int main(int argc, char const *argv[])
{
    // Base *p = new Derived();
    // // Base::Base
    // // Derived::Derived

    // p->f();
    // // Derived::f

    // delete p;
    // // Base::~Base

    // Derived d;
    // // Base::Base
    // // Derived::Derived

    // Base b = d;

    // b.f();
    // // Base::f

    Base *arr = new Base[3];
    // Creates a new array with pointers to three objects of class Base.
    // Base::Base
    // Base::Base
    // Base::Base

    delete[] arr;
    // Deletes every pointer in the array.
    // Base::~Base
    // Base::~Base
    // Base::~Base

    delete[] arr;
    // Also deletes every pointer in the array.
    // This operation will cause an error, because it calls the destructor on
    // no data.

    return 0;
    // Base::~Base // for Base b
    // Derived::~Derived // for Derived d
    // Base::~Base // for Derived d
}

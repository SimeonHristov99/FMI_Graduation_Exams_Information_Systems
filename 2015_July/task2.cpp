#include <iostream>

struct Node
{
    int value;
    Node **children;
    size_t children_size;
    size_t children_cap;

    void clear()
    {
        for (size_t i = 0; i < children_size; ++i)
        {
            delete children[i];
            children[i] = nullptr;
        }

        delete[] children;
        children = nullptr;
    }

    Node(const int _value = -1)
        : value(_value)
    {
        children_cap = 8;
        children_size = 0;
        children = new Node *[children_cap];
    }

    Node(const Node &rhs) = delete;
    Node &operator=(const Node &rhs) = delete;

    ~Node()
    {
        clear();
    }

    void add_child(Node *child)
    {
        if (children_size < children_cap)
        {
            children[children_size++] = child;
            return;
        }

        children_cap *= 2;
        Node **children_copy = new Node *[children_cap];
        for (size_t i = 0; i < children_size; ++i)
        {
            children_copy[i] = new Node(children[i]->value);
        }
        clear();
        children = children_copy;
        add_child(child);
    }

    void remove_child(Node *child)
    {
        for (size_t i = 0; i < children_size; ++i)
        {
            if (children[i] == child)
            {
                children[i]->clear();
                child = nullptr;

                for (size_t j = i; j < children_size - 1; ++j)
                {
                    children[i] = children[i + 1];
                }
                --children_size;
            }
        }
    }

    void print_hierarchy() const
    {
        std::cout << '(' << value << ' ';

        for (size_t i = 0; i < children_size; ++i)
        {
            std::cout << ' ';
            children[i]->print_hierarchy();
        }
        std::cout << ')';
    }
};

bool member(Node *root, int x)
{
    if (!root)
    {
        return false;
    }

    if (root->value == x)
    {
        return true;
    }

    for (size_t i = 0; i < root->children_size; ++i)
    {
        if (member(root->children[i], x))
        {
            return true;
        }
    }

    return false;
}

void filterOdd(Node *root)
{
    if (!root)
    {
        return;
    }

    for (size_t i = 0; i < root->children_size; ++i)
    {
        if (root->children[i]->value % 2 != 0)
        {
            root->remove_child(root->children[i]);
        }
        else
        {
            filterOdd(root->children[i]);
        }
    }
}

void test1()
{
    Node *n8 = new Node(8);

    Node *n2 = new Node(2);
    Node *n3 = new Node(3);

    Node *n4 = new Node(4);
    Node *n5 = new Node(5);
    Node *n6 = new Node(6);

    n3->add_child(n4);
    n3->add_child(n5);
    n3->add_child(n6);

    n8->add_child(n2);
    n8->add_child(n3);

    n8->print_hierarchy();
    std::cout << '\n';

    std::cout << std::boolalpha << member(n8, 8) << '\n';
    std::cout << std::boolalpha << member(n8, 2) << '\n';
    std::cout << std::boolalpha << member(n8, 3) << '\n';
    std::cout << std::boolalpha << member(n8, 4) << '\n';
    std::cout << std::boolalpha << member(n8, 5) << '\n';
    std::cout << std::boolalpha << member(n8, 6) << '\n';
    std::cout << std::boolalpha << member(n8, 69) << '\n';
    std::cout << std::boolalpha << member(n8, 42) << '\n';
}

void test2()
{
    Node *n8 = new Node(8);

    Node *n2 = new Node(2);
    Node *n3 = new Node(3);

    Node *n4 = new Node(4);
    Node *n5 = new Node(5);
    Node *n6 = new Node(6);

    n3->add_child(n4);
    n3->add_child(n5);
    n3->add_child(n6);

    n8->add_child(n2);
    n8->add_child(n3);

    n8->print_hierarchy();
    std::cout << '\n';

    filterOdd(n8);
    n8->print_hierarchy();
    std::cout << '\n';
}

int main(int argc, char const *argv[])
{
    test1();
    test2();

    return 0;
}

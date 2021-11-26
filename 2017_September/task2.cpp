#include <iostream>

template <class T>
struct Node
{
    T value;
    Node *next = nullptr;

    Node(const T &new_value)
        : value(new_value)
    {
    }
};

bool is_sorted(Node<int> *l)
{
    while (l->next != nullptr)
    {
        if (l->next->value < l->value)
        {
            return false;
        }
        l = l->next;
    }

    return true;
}

void add(Node<int> *&result, Node<int> *&result_it, int value)
{
    if (result == nullptr)
    {
        result_it = new Node<int>(value);
        result = result_it;
    }
    else
    {
        result_it->next = new Node<int>(value);
        result_it = result_it->next;
    }
}

Node<int> *merge(Node<int> *l1, Node<int> *l2)
{
    Node<int> *result_it = nullptr;
    Node<int> *result = nullptr;

    while (l1 != nullptr && l2 != nullptr)
    {
        if (l1->value < l2->value)
        {
            add(result, result_it, l1->value);

            l1 = l1->next;
        }
        else
        {
            add(result, result_it, l2->value);

            l2 = l2->next;
        }
    }

    if (l1 != nullptr)
    {
        if (result == nullptr)
        {
            result = l1;
        }
        else
        {
            result_it->next = l1;
        }
    }
    else
    {
        if (result == nullptr)
        {
            result = l2;
        }
        else
        {
            result_it->next = l2;
        }
    }

    return result;
}

// TODO: Fix memory leaks.
Node<int> *get_sorted(Node<Node<int> *> *n)
{
    Node<int> *result_it = nullptr;
    Node<int> *result = nullptr;

    while (n != nullptr)
    {
        if (is_sorted(n->value))
        {
            result = merge(result, n->value);
        }

        n = n->next;
    }

    return result;
}

void test()
{
    Node<int> *l1 = new Node<int>(1);
    l1->next = new Node<int>(2);
    l1->next->next = new Node<int>(3);
    l1->next->next->next = new Node<int>(3);
    l1->next->next->next->next = new Node<int>(4);
    l1->next->next->next->next->next = new Node<int>(5);

    Node<int> *l2 = new Node<int>(10);
    l2->next = new Node<int>(2);
    l2->next->next = new Node<int>(4);
    l2->next->next->next = new Node<int>(5);

    Node<int> *l3 = new Node<int>(1);
    l3->next = new Node<int>(2);
    l3->next->next = new Node<int>(40);
    l3->next->next->next = new Node<int>(5);

    Node<int> *l4 = new Node<int>(0);
    l4->next = new Node<int>(2);
    l4->next->next = new Node<int>(40);
    l4->next->next->next = new Node<int>(50);

    Node<int> *l5 = new Node<int>(8);
    l5->next = new Node<int>(20);
    l5->next->next = new Node<int>(14);

    Node<Node<int> *> *n = new Node<Node<int> *>(l1);
    n->next = new Node<Node<int> *>(l2);
    n->next->next = new Node<Node<int> *>(l3);
    n->next->next->next = new Node<Node<int> *>(l4);
    n->next->next->next->next = new Node<Node<int> *>(l5);

    std::cout << "Printing list of lists:\n";
    Node<Node<int> *> *m = n;
    int i = 1;
    while (m != nullptr)
    {
        Node<int> *sub = m->value;
        std::cout << "Sublist " << i++ << ": ";
        while (sub != nullptr)
        {
            std::cout << sub->value << ' ';
            sub = sub->next;
        }
        std::cout << '\n';

        m = m->next;
    }

    std::cout << "Printing sorted metalist: ";
    Node<int> *meta_list = get_sorted(n);
    while (meta_list != nullptr)
    {
        std::cout << meta_list->value << ' ';
        meta_list = meta_list->next;
    }
    std::cout << '\n';
}

int main(int argc, char const *argv[])
{
    test(); // 0 1 2 2 3 3 4 5 40 50

    return 0;
}

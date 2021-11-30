#include <iostream>

class List
{
public:
    List()
    {
        front = nullptr;
    }

    List(const List &rhs) = delete;
    List &operator=(const List &rhs) = delete;

    ~List()
    {
        clear();
    }

    void push_front(int value)
    {
        front = new Node(value, front);
    }

    void sort()
    {
        Node* i = front;
        while(i->next->next != nullptr)
        {
            Node* min_el = i;

            Node* j = i->next;
            while(j)
            {
                if(j->value < min_el->value)
                {
                    min_el = j;
                }
                j = j->next;
            }

            int tmp = i->value;
            i->value = min_el->value;
            min_el->value = tmp;

            i = i->next;
        }        
    }

    friend std::ostream& operator<<(std::ostream& out, const List& data)
    {
        Node* current = data.front;

        while(current)
        {
            out << current->value << ' ';
            current = current->next;
        }

        return out;
    }

private:
    struct Node
    {
        int value;
        Node *next;

        Node(int new_value, Node *new_next = nullptr)
        {
            value = new_value;
            next = new_next;
        }
    };

    Node *front;

    void clear()
    {
        while (front)
        {
            Node *to_remove = front;
            front = front->next;

            to_remove->next = nullptr;
            delete to_remove;
            to_remove = nullptr;
        }
    }
};

// Is this a cheat? :D
void sort(List& l)
{
    l.sort();
}

int main(int argc, char const *argv[])
{
    List l;

    l.push_front(3);
    l.push_front(2);
    l.push_front(1);

    l.push_front(3);
    l.push_front(2);
    l.push_front(1);

    std::cout << l << '\n'; // 1 2 3 1 2 3

    sort(l);

    std::cout << l << '\n'; // 1 1 2 2 3 3

    return 0;
}

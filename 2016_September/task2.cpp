#include <iostream>
#include <vector>
#include <queue>

const int SIZE = 10;

struct Node
{
    int value;
    std::vector<Node *> children;

    explicit Node(const int new_value)
        : value(new_value)
    {
    }
};

Node *build_tree(int k, int a[])
{
    int size = SIZE;

    if (a == nullptr)
    {
        return nullptr;
    }

    Node *root = new Node(a[0]);
    ++a;

    std::queue<Node *> q;
    q.push(root);

    while (size > 0 && !q.empty())
    {
        Node *current = q.front();
        q.pop();

        for (int i = 0; size-- >= 0 && i < k; ++i, ++a)
        {
            Node *n = new Node(*a);
            current->children.push_back(n);
            q.push(n);
        }
    }

    return root;
}

void print_tree(Node *root)
{
    if (!root)
    {
        return;
    }

    std::cout << '(' << root->value;

    if (root->children.size() > 1)
    {
        std::cout << ' ';
    }

    for (Node *n : root->children)
    {
        print_tree(n);
    }

    std::cout << ")";
}

int main(int argc, char const *argv[])
{
    int arr[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

    Node *root = build_tree(3, arr);

    std::cout << "Tree: ";
    print_tree(root);
    std::cout << '\n';

    return 0;
}

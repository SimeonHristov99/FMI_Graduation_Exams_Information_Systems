#include <iostream>
#include <fstream>
#include <vector>
#include <stack>

struct Node
{
    int n;
    std::vector<Node *> successors;

    Node(const int new_n)
        : n(new_n)
    {
    }
};

Node *parse_tree(const std::string &buffer, int *i)
{
    ++*i; // skips the '('

    if (buffer[*i] == ')')
    {
        return nullptr;
    }

    if (buffer[*i] == '(')
    {
        ++*i;
    }

    int value = 0;
    while (isdigit(buffer[*i]))
    {
        value = value * 10 + (buffer[*i] - '0');
        ++*i;
    }
    ++*i; // skips the ' '

    Node *root = new Node(value);

    while (*i < buffer.size() && buffer[*i] != ')')
    {
        if (buffer[*i] == ',')
        {
            *i += 2; // skips the ", "
        }
        Node *succ = parse_tree(buffer, i);
        while (succ)
        {
            root->successors.push_back(succ);
            succ = parse_tree(buffer, i);
            ++*i; // skips the ')'
        }
    }

    return root;
}

int get_max_sum(const char *filename)
{
    std::ifstream fin(filename);
    if (!fin)
    {
        std::cout << "ERROR: Could not open " << filename << '\n';
        return;
    }

    std::string buffer;
    std::getline(fin, buffer);
    fin.close();

    int i = 0;
    Node *root = parse_tree(buffer, &i);

    // DFS
    std::stack<Node *> frontier;
    frontier.push(root);

    int max_sum = -1;
    int current_sum = 0;

    while (!frontier.empty())
    {
        Node *front = frontier.top();
        frontier.pop();

        current_sum += front->n;

        if (front->successors.size() == 0)
        {
            if (current_sum > max_sum)
            {
                max_sum = current_sum;
            }
            current_sum -= front->n;
        }

        for (Node *n : front->successors)
        {
            frontier.push(n);
        }
    }

    return max_sum;
}

int main(int argc, char const *argv[])
{
    std::cout << get_max_sum("input.txt") << '\n';

    return 0;
}

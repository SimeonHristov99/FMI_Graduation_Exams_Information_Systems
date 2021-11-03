#include <iostream>
#include <stack>

void print_backwards(const char *begin, const char *end)
{
    if (end < begin)
    {
        return;
    }

    if (*(end - 1) <= 32)
    {
        print_backwards(begin, end - 1);
    }

    std::stack<char> current_word;

    while (end != begin && *(end - 1) > 32)
    {
        current_word.push(*(end - 1));

        --end;
    }

    while (!current_word.empty())
    {
        std::cout << current_word.top();
        current_word.pop();
    }

    if (end != begin)
    {
        std::cout << ' ';
    }

    print_backwards(begin, end - 1);
}

void print_backwards(const char *string)
{
    const char *end = string;

    while (*end)
    {
        ++end;
    }

    print_backwards(string, end);
}

int main(int argc, char const *argv[])
{
    const char *t1 = "I\tneed a break!";
    print_backwards(t1);

    std::cout << '\n';

    return 0;
}

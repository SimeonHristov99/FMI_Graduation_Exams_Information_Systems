#include <iostream>
#include <set>
#include <cstring>

std::pair<int, int> get_position(const char c, const char *input)
{
    std::pair<int, int> result = {-1, -1};
    int size = strlen(input);

    for (int i = 0; i < size; ++i)
    {
        if (input[i] == c)
        {
            int end = size - 1;
            while (end > i && input[end] != c)
            {
                --end;
            }

            result.first = i;
            result.second = end;
            return result;
        }
    }

    return result;
}

std::pair<int, int> get_positions(const char *input)
{
    const char *input_copy = input;
    std::set<char> chars;

    while (*input_copy)
    {
        chars.insert(*input_copy);
        ++input_copy;
    }

    int max_left = 0;
    int max_right = 0;

    for (const char c : chars)
    {
        std::pair<int, int> pos = get_position(c, input);

        if (pos.second - pos.first > max_right - max_left)
        {
            max_left = pos.first;
            max_right = pos.second;
        }
    }

    return {max_left, max_right};
}

int main(int argc, char const *argv[])
{
    std::pair<int, int> positions = get_positions("this is just a simple example");
    std::cout << positions.first << ' ' << positions.second << '\n';

    return 0;
}

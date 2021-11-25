#include <iostream>
#include <queue>
#include <set>

const int ROWS = 100;
const int COLS = 100;

typedef std::pair<int, int> Element;

int get_biggest_field(char terrain[][COLS], int rows, int cols)
{
    int result = 0;
    std::queue<Element> q;
    std::set<Element> visited;

    for (int i = 0; i < rows; ++i)
    {
        for (int j = 0; j < cols; ++j)
        {
            if (terrain[i][j] == '4')
            {
                int current_size = 0;
                // Add current element to q.
                q.push({i, j});

                // BFS
                while (!q.empty())
                {
                    Element front = q.front();
                    q.pop();

                    // up
                    if (0 <= front.first - 1 && terrain[front.first - 1][front.second] == '4' && visited.find({front.first - 1, front.second}) == visited.end()) // not visited yet
                    {
                        q.push({front.first - 1, front.second});
                        visited.insert({front.first - 1, front.second});
                        ++current_size;
                    }

                    // center
                    if (visited.find({front.first, front.second}) == visited.end()) // not visited yet
                    {
                        q.push({front.first, front.second});
                        visited.insert({front.first, front.second});
                        ++current_size;
                    }

                    // right
                    if (front.second + 1 < cols && terrain[front.first][front.second + 1] == '4'
                    && visited.find({front.first, front.second + 1}) == visited.end()) // not visited yet
                    {
                        q.push({front.first, front.second + 1});
                        visited.insert({front.first, front.second + 1});
                        ++current_size;
                    }

                    // down
                    if (front.first + 1 < rows && terrain[front.first + 1][front.second] == '4' && visited.find({front.first + 1, front.second}) == visited.end()) // not visited yet
                    {
                        q.push({front.first + 1, front.second});
                        visited.insert({front.first + 1, front.second});
                        ++current_size;
                    }

                    // left
                    if (0 <= front.second - 1 && terrain[front.first][front.second - 1] == '4' && visited.find({front.first, front.second - 1}) == visited.end()) // not visited yet
                    {
                        q.push({front.first, front.second - 1});
                        visited.insert({front.first, front.second - 1});
                        ++current_size;
                    }
                }

                // Compare size of q with result.
                if (current_size > result)
                {
                    result = current_size;
                }
            }
        }
    }

    return result;
}

void test1()
{
    char terrain[ROWS][COLS] = {
        {'R', 'R', '1', '1', '2', '2'},
        {'1', 'R', 'R', 'R', '1', '2'},
        {'S', '1', 'R', 'R', '2', '3'},
        {'4', '4', 'S', 'S', 'R', 'R'},
    };

    for (int i = 0; i < 4; ++i)
    {
        for (int j = 0; j < 6; ++j)
        {
            std::cout << terrain[i][j] << ' ';
        }
        std::cout << '\n';
    }

    std::cout << get_biggest_field(terrain, 4, 6) << '\n'; // 2
}

void test2()
{
    char terrain[ROWS][COLS] = {
        {'R', '4', '1', '1', '2', '2'},
        {'1', 'R', '4', '4', '4', '2'},
        {'S', '4', '4', '4', '4', '4'},
        {'4', '4', 'S', 'S', 'R', 'R'},
    };

    for (int i = 0; i < 4; ++i)
    {
        for (int j = 0; j < 6; ++j)
        {
            std::cout << terrain[i][j] << ' ';
        }
        std::cout << '\n';
    }

    std::cout << get_biggest_field(terrain, 4, 6) << '\n'; // 10
}

int main(int argc, char const *argv[])
{
    test1();
    test2();

    return 0;
}

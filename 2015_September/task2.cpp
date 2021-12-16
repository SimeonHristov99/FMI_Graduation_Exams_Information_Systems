#include <iostream>

struct Graph
{
    int v[1024];
    int u[1024][1024];
};

bool visited[1024] = {0};
bool DFS(const Graph &g, const int idx_start, const int idx_goal)
{
    if (idx_start == idx_goal)
    {
        return true;
    }

    visited[idx_start] = true;

    for (int i = 0; i < 2; ++i)
    {
        std::cout << i << ' ' << g.u[idx_start][i] << '\n';
        if (!visited[g.u[idx_start][i]] && DFS(g, g.u[idx_start][i], idx_goal))
        {
            for (int i = 0; i < 1024; ++i)
            {
                visited[i] = 0;
            }
            return true;
        }
    }

    return false;
}

bool isConnected(const Graph &g)
{
    for (int i = 0; i < 1024 && g.v[i] != 0; ++i)
    {
        for (int j = i + 1; j < 1024 && g.v[j] != 0; ++j)
        {
            if (g.v[i] == g.v[j]) // assuming the values in the nodes are unique
            {
                continue;
            }

            if (!DFS(g, i, j) && !DFS(g, j, i))
            {
                return false;
            }
        }
    }

    return true;
}

void test1()
{
    Graph g;

    g.v[0] = 2;
    g.v[1] = 1;
    g.v[2] = 3;

    g.u[0][0] = 2;
    g.u[1][0] = 0;

    std::cout << std::boolalpha << isConnected(g) << '\n';
}

void test2()
{
    Graph g;

    g.v[0] = 2;
    g.v[1] = 1;
    g.v[2] = 3;

    g.u[0][0] = 3;
    g.u[0][1] = 1;
    g.u[2][0] = 1;

    std::cout << std::boolalpha << isConnected(g) << '\n';
}

int main(int argc, char const *argv[])
{
    test1();
    // test2();

    return 0;
}

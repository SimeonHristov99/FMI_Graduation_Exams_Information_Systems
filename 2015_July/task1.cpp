#include <iostream>

const int M = 10;
const int N = 10;

void subsample(int m, int n, float img[M][N])
{
    int new_m = (m + 1) / 2;
    int new_n = (n + 1) / 2;

    float **s = new float *[new_n];

    for (int i = 0; i < new_m; ++i)
    {
        s[i] = new float[new_m];

        for (int j = 0; j < new_n; ++j)
        {
            float sum = 0, num = 0;

            for (int y = i * 2; y <= i * 2 + 1; ++y)
            {
                if (!(0 <= y && y < m))
                    continue;

                for (int x = j * 2; x <= j * 2 + 1; ++x)
                {
                    if (0 <= x && x < n)
                    {
                        sum += img[y][x];
                        ++num;
                    }
                }
            }

            s[i][j] = (num != 0 ? sum / num : 0);
        }
    }

    for (int i = 0; i < new_m; ++i)
    {
        for (int j = 0; j < new_n; ++j)
        {
            std::cout << s[i][j] << ' ';
        }
        std::cout << '\n';
    }
}

int main(int argc, char const *argv[])
{
    float img[M][N] = {
        {1.0, 2.0, 3.0},
        {4.5, 6.5, 7.5},
    };

    subsample(2, 3, img);

    return 0;
}

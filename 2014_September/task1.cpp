#include <iostream>
#include <math.h>

void square(int n, float* x, float* y) {
    float max_x = x[0];
    float max_y = y[0];

    float min_x = x[0];
    float min_y = y[0];

    for (int i = 1; i < n; ++i) {
        if(x[i] > max_x) {
            max_x = x[i];
        } else if (x[i] < min_x) {
            min_x = x[i];
        }

        if (y[i] > max_y) {
            max_y = y[i];
        } else if (y[i] < min_y) {
            min_y = y[i];
        }
    }

    if (max_x - min_x > max_y - min_y) {
        max_y += (max_x - min_x) - (max_y - min_y);
    } else if (max_x - min_x < max_y - min_y) {
        min_x -= (max_y - min_y) - (max_x - min_x);
    }

    std::cout << "Center: (" << ((max_x - min_x) / 2) << ", " << ((max_y - min_y) / 2) << ")\n";
    std::cout << "Left side goes from (" << max_x << ", " << max_y << ") to (" << max_x << ", " << min_y << ")\n";
    std::cout << "Length of side: " << (max_y - min_y) << '\n';
}

int main() {
    float x[7] = { -1, -2, 1, 2, 3, 4, 5 };
    float y[7] = { -1, -2, 1, 2, 3, 4, 0 };

    square(7, x, y);

    return 0;
}
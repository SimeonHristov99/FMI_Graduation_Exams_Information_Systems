package solution;

import java.util.Objects;

public class ChessPosition {
    public char x;
    public int y;

    public ChessPosition(char x, int y) {
        this.x = x;
        this.y = y;
    }

    public boolean isValid() {
        return this.x >= 'A' && this.x <= 'H' && this.y >= 1 && this.y <= 8;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ChessPosition that = (ChessPosition) o;
        return x == that.x &&
                y == that.y;
    }

    @Override
    public int hashCode() {
        return Objects.hash(x, y);
    }

    @Override
    public String toString() {
        return String.format("(%s, %d)", x, y);
    }
}

package solution;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class Rook implements ChessPiece {
    private ChessPosition pos;

    public Rook(ChessPosition pos) {
        this.pos = pos;
    }

    @Override
    public ChessPosition getPosition() {
        return pos;
    }

    @Override
    public void setPosition(ChessPosition position) {
        pos = position;
    }

    @Override
    public List<ChessPosition> allowedMoves() {
        List<ChessPosition> result = new ArrayList<>();

        for (char i = (char) (pos.x + 1); i <= 'H'; i++) {
            result.add(new ChessPosition(i, pos.y));
        }

        for (char i = (char) (pos.x - 1); i >= 'A'; i--) {
            result.add(new ChessPosition(i, pos.y));
        }

        for (int i = pos.y + 1; i <= 8; i++) {
            result.add(new ChessPosition(pos.x, i));
        }

        for (int i = pos.y - 1; i >= 0; i--) {
            result.add(new ChessPosition(pos.x, i));
        }

        return result.stream().filter(ChessPosition::isValid).collect(Collectors.toList());
    }

    @Override
    public boolean captures(ChessPosition pos) {
        return allowedMoves().contains(pos);
    }
}

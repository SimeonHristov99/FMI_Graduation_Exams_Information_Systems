package solution;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class Knight implements ChessPiece {
    private ChessPosition pos;

    public Knight(ChessPosition pos) {
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

        result.add(new ChessPosition((char) (pos.x - 1), pos.y - 2));
        result.add(new ChessPosition((char) (pos.x + 1), pos.y - 2));

        result.add(new ChessPosition((char) (pos.x + 2), pos.y - 1));
        result.add(new ChessPosition((char) (pos.x + 2), pos.y + 1));

        result.add(new ChessPosition((char) (pos.x + 1), pos.y + 2));
        result.add(new ChessPosition((char) (pos.x - 1), pos.y + 2));

        result.add(new ChessPosition((char) (pos.x - 2), pos.y - 1));
        result.add(new ChessPosition((char) (pos.x - 2), pos.y + 1));

        return result.stream().filter(ChessPosition::isValid).collect(Collectors.toList());
    }

    @Override
    public boolean captures(ChessPosition pos) {
        return allowedMoves().contains(pos);
    }
}

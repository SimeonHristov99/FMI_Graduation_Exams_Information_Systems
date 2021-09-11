package solution;

import java.util.List;

public interface ChessPiece {
    void setPosition(ChessPosition position);

    ChessPosition getPosition();

    List<ChessPosition> allowedMoves();

    boolean captures(ChessPosition pos);
}

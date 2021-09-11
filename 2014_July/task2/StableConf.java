package solution;

import java.util.List;

public class StableConf {
    public static void main(String[] args) {

    }

    void allMoves(List<ChessPiece> pieces) {
        int size = pieces.size();

        for (int i = 0; i < size - 1; i++) {
            ChessPiece currentPiece = pieces.get(i);
            List<ChessPosition> moves = currentPiece.allowedMoves();

            for (int j = i + 1; j < size; j++) {
                ChessPiece otherPiece = pieces.get(j);
                ChessPosition otherPiecePos = otherPiece.getPosition();

                if (currentPiece.captures(otherPiecePos)) {
                    for (ChessPosition move : moves) {
                        boolean stable = false;

                        while (!stable && currentPiece.captures(otherPiecePos)) {
                            currentPiece.setPosition(move);
                            stable = true;
                        }

                        if (stable) {
                            System.out.printf(
                                    "%s %s -> %s\n",
                                    currentPiece.getClass(),
                                    currentPiece.getPosition(),
                                    move
                            );
                        }
                    }
                }
            }
        }
    }
}

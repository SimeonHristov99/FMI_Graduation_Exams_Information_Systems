package solution;

public class RookTest {
    public static void main(String[] args) {
        Rook rook0 = new Rook(new ChessPosition('A', 1));
        System.out.println(rook0.allowedMoves().toString().equals("[(B, 1), (C, 1), (D, 1), (E, 1), (F, 1), (G, 1), (H, 1), (A, 2), (A, 3), (A, 4), (A, 5), (A, 6), (A, 7), (A, 8)]"));

        Rook rook1 = new Rook(new ChessPosition('E', 7));
        System.out.println(rook1.allowedMoves().toString().equals("[(F, 7), (G, 7), (H, 7), (D, 7), (C, 7), (B, 7), (A, 7), (E, 8), (E, 6), (E, 5), (E, 4), (E, 3), (E, 2), (E, 1)]"));

        System.out.println(rook0.captures(new ChessPosition('A', 7)) == true);
        System.out.println(rook0.captures(new ChessPosition('B', 7)) == false);

        System.out.println(rook1.captures(new ChessPosition('A', 7)) == true);
        System.out.println(rook1.captures(new ChessPosition('B', 6)) == false);

        System.out.println(rook0.getPosition());
    }
}

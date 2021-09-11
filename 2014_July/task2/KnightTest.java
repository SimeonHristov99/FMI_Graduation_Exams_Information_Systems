package solution;

public class KnightTest {
    public static void main(String[] args) {
        Knight knight0 = new Knight(new ChessPosition('D', 4));
        System.out.println(knight0.allowedMoves().toString().equals("[(C, 2), (E, 2), (F, 3), (F, 5), (E, 6), (C, 6), (B, 3), (B, 5)]"));

        Knight knight1 = new Knight(new ChessPosition('B', 7));
        System.out.println(knight1.allowedMoves());
    }
}

main :: IO()
main = do
    print $ permutations [1, 2, 3] == [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]

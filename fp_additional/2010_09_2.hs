main :: IO()
main = do
    print $ sumProd [[1, 2, 3], [-3, 2, 1], [1], [-1]] == 7

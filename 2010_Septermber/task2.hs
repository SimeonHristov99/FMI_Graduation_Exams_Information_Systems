main :: IO()
main = do
    print $ sumProd [[1, 2, 1, 3], [-11, -22, 5, 6], [-1, 0, 2], [0, 5]] == 6

sumProd :: [[Integer]] -> Integer
sumProd = sum . map (product) . filter (all (>= 0))
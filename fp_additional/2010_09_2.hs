main :: IO()
main = do
    print $ sumProd [[1, 2, 3], [-3, 2, 1], [1], [-1]] == 7

sumProd :: [[Int]] -> Int
sumProd ll = sum $ map product $ filter (\ xs -> all (\ x -> x >= 0) xs) ll
-- sumProd ll = sum $ map product $ filter (\ xs -> all (>=0) xs) ll

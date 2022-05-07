main :: IO()
main = do
    -- print $ "Hello, world"
    -- print $ f 6
    -- print $ (\ x y z -> (x y z) + 1) (\ x y -> x + y) 5 6
    print $ sumProd [[1, 2, 3], [-3, 2, 1], [1], [-1]] == 7

sumProd :: [[Integer]] -> Integer
sumProd ll = sum (map product $ filter (\ xs -> all (\ x -> x >= 0) xs) ll)

-- (\ x y z -> x y z) (\ x y -> x + y) 5 6
-- (\ (\ x y -> x + y) 5 6 -> x y z)
-- (\ (\ x y -> x + y) 5 6 -> (\ x y -> x + y) 5 6)
-- (\ (\ x y -> x + y) 5 6 -> (\ 5 6 -> 5 + 6) 5 6)
-- (\ (\ x y -> x + y) 5 6 -> (\ 5 6 -> 11) 5 6)
-- (\ (\ x y -> x + y) 5 6 -> 11)
-- print $ 11

-- f n = 42
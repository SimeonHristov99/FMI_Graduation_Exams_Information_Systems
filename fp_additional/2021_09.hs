main :: IO()
main = do
    print $ foldr1 (&&) [False, False ..]
    -- print $ foldr1 (&&) [True, True ..]
    print $ filter (`elem` [10 .. 20]) [1, 5, 10, 100, 20, 15] == [10, 20, 15]
    -- -- print $ negate $ max 10 20
    -- print $ take 4 [1, 3 ..] == [1, 3, 5, 7]
    -- -- print $ (:[]) []
    print $ map ($ 0) (map (+) [1..5])
    print $ f [1, 10]
    print $ g [[1, 2, 3], [4, 5, 6]]

f l = [ x + y | x <- l, y <- l ]

g :: (Num a) => [[a]] -> [[a]]
g ([]:_) = []
g x = (map head x) : g (map tail x)

-- g x=[[1, 2, 3], [4, 5, 6]]
-- head [1, 2, 3]
-- head [4, 5, 6]
-- [1, 4] : g [[2, 3], [5, 6]]
-- [1, 4], [2, 5] : g [[3], [6]]
-- [1, 4], [2, 5], [3, 6] : g [[], []]
-- [1, 4], [2, 5], [3, 6] : []
-- [[1, 4], [2, 5], [3, 6]]

-- [1, 10]
-- 1 1
-- 1 10
-- 10 1
-- 10 10
-- [2, 11, 11, 20]

-- map ($ 0) (map (+) [1..5])
-- map ($ 0) [(+1), (+2), (+3), (+4), (+5)]
-- map ($ 0) [(+1), (+2), (+3), (+4), (+5)]

-- (+1) 0 => 0 + 1 = 1

-- foldr1 f (x1:x2:xs) = foldr1 xs (x1 && x2) 

-- filter (`elem` [10 .. 20]) [1, 5, 10, 100, 20, 15]
-- elem x xs
-- x `elem` xs
-- (\ x -> x `elem` xs)
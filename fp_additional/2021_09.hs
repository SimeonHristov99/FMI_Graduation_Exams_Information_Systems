main :: IO()
main = do
    print $ foldr1 (&&) [False, False ..]
    print $ foldr1 (&&) [True, True ..]
    print $ filter (`elem` [10 .. 20]) [1, 5, 10, 100, 20, 15]
    -- print $ negate $ max 10 20
    print $ take 4 [1, 3 ..] == [1, 3, 5, 7]
    -- print $ (:[]) []
    print $ map ($ 0) (map (+) [1..5])
    print $ f [1, 10]
    print $ g [[1, 2, 3], [4, 5, 6]]

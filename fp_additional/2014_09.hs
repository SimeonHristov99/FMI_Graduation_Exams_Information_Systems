main :: IO()
main = do
    print $ permutations [1, 2, 3] == [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]

permutations :: (Eq a) => [a] -> [[a]]
permutations [] = [[]]
permutations xs = [ x : y | x <- xs, y <- permutations $ filter (\ z -> z /= x) xs ]



-- [ x : y | x <- [1, 2, 3], y <- permutations $ filter (\ z -> z /= x) xs ]

-- 1 : p [2, 3]
--     2 : p [3]
--         3 : p []
--             3 : [[]] => y <- [[]] => x <- 3, y=[] -> 3:[] => [3]
--         2 : [3]
--     1 : 2 : [3]
-- [[1, 2, 3]]

--     3 : p [2]
--         2 : [[]] => [1, 3, 2]

-- 2 : p [1, 3]

-- 3 : p [1, 2]
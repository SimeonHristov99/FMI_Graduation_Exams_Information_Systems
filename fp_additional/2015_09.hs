main :: IO()
main = do
    print $ merge [1, 3, 5, 7] [2, 2, 6, 10] == [1,2,2,3,5,6,7,10]
    print $ (\ xs -> [ y | y <- xs, even y ]) [1, 2, 3, 4]

merge :: [Int] -> [Int] -> [Int]
merge x [] = x
merge [] x = x
merge (x:xs) (y:ys) = if x < y then x : merge xs (y:ys) else y : merge (x:xs) ys

-- (\ xs -> [ y | y <- xs, even y ]) [1, 2, 3, 4]
-- (\ xs=[1, 2, 3, 4] -> [ y | y <- [1, 2, 3, 4], even y ]) [1, 2, 3, 4]
-- [ y | y <- [1, 2, 3, 4], even y ]
-- [2, 4]
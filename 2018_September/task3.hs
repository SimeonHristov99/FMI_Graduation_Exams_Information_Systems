main :: IO()
main = do
    print $ sumMaxRoots (\x -> x^3 -x) [ [1, 2, 3], [-1, 0, 5], [1, 4, -1] ] == -1

selectList :: [Int] -> [Int] -> [Int]
selectList l1 l2 = if length l1 >= length l2 then l1 else l2

sumMaxRoots :: (Int -> Int) -> [[Int]] -> Int
sumMaxRoots f l1 = sum (foldl selectList [] (map (\ l -> [ x | x <- l, f x == 0]) l1))

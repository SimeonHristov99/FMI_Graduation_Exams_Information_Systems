main :: IO()
main = do
    print $ foldr1 (&&) [False, False ..] == False -- b
    -- print $ foldr1 (&&) [True, True ..] -- v
    print $ filter (`elem` [10 .. 20]) [1, 5, 10, 100, 20, 15] == [10, 20, 15]
    print $ negate $ max 10 20 -- == (-20)
    print $ take 4 [1, 3 ..] == [1, 3, 5, 7]
    -- print $ (:[]) [] == [[]]
    print $ map ($ 0) (map (+) [1..5])
    print $ map ($ 0) (map (-) [1..5])
    print $ map ($ 0) (map (*) [1..5])
    print $ map ($ 1) (map (-) [1..5])
    print $ f [1, 10]
    print $ g [[1, 2, 3], [4, 5, 6]]

f l = [ x + y | x <- l, y <- l ]
-- f [1, 10]
-- 1 + 1
-- 1 + 10
-- 10 + 1
-- 10 + 10

-- f list@(l:ls) = [ x + y | x <- list, y <- ls ]

g :: (Num a) => [[a]] -> [[a]]
g ([]:_) = []
g x = (map head x) : g (map tail x)

-- g [[1, 2, 3], [4, 5, 6]]
-- x=[[1, 2, 3], [4, 5, 6]]
-- map (\ xs -> head xs) x
-- [1, 4] : g [[2, 3], [5, 6]]
-- [1, 4] : [2, 5] : g [[3], [6]]
-- [1, 4] : [2, 5] : [3, 6] : g [[], []]
-- [1, 4] : [2, 5] : [3, 6] : []
-- [[1, 4], [2, 5], [3, 6]]

-- map ($ 0) (map (+) [1..5])
-- map ($ 0) [(+1), (+2), (+3), (+4), (+5)]
-- map (\ f -> f $ 0) [(+1), (+2), (+3), (+4), (+5)]
-- f=(+1) -> (+1) 0 -> + 1 0
-- [(+ 1 0), (+ 2 0), (+ 3 0), (+ 4 0), (+ 5 0)]

-- [- 1 1, (- 2 1), (+ 3 0), (+ 4 0), (+ 5 0)]

-- (:[]) []
-- (\ xs -> xs:[])

-- filter (`elem` [10 .. 20]) [1, 5, 10, 100, 20, 15]
-- filter (\ x -> elem x [10 .. 20]) [1, 5, 10, 100, 20, 15]
-- filter (\ x -> x `elem` [10 .. 20]) [1, 5, 10, 100, 20, 15]

-- if the list is empty, the result is the initial value z; else
-- apply f to the first element and the result of folding the rest
-- foldr f z []     = z 
-- foldr f z (x:xs) = f x (foldr f z xs) 

-- foldr1 _ [x] = x
-- foldr1 f (x:xs) = f x (foldr1 f xs)

-- -- if the list is empty, the result is the initial value; else
-- -- we recurse immediately, making the new initial value the result
-- -- of combining the old initial value with the first element.
-- foldl f z []     = z                  
-- foldl f z (x:xs) = foldl f (f z x) xs

-- foldl1 _ [x]       = x
-- foldl1 f (x:y:zs)  = f (f x y) (foldl1 f zs)
-- alternative: foldl1 f (x:y:zs) = foldl1 f ((f x y):zs)



main :: IO()
main = do
    print $ (totalMin [(\ x -> x - 1), (\ x -> x + 1)]) 5 == 4
    print $ (totalMin [(\ x -> x * 0), (\ x -> x + 1)]) 5 == 0
    print $ (totalMin [(\ x -> x * 0), (\ x -> -100)]) 5 == -100

    print $ ((take 4 $ chainMinCompositions (+1))!!0) 2 == 2
    print $ ((take 4 $ chainMinCompositions (+1))!!1) 2 == 3
    print $ ((take 4 $ chainMinCompositions (+1))!!2) 2 == 3
    print $ ((take 4 $ chainMinCompositions (+1))!!3) 2 == 2

-- totalMin [(\ x -> x - 1), (\ x -> x + 1)] => (\ x -> x - 1)
-- (\ x -> x - 1) 5
-- 5 - 1 => 4

-- int min = is[0];
-- for(i : is[1:])
-- {
--     if i > max {
--         max = i
--         }
-- }
-- std::cout << max

-- totalMin :: (Num a, Ord a) => [(a -> a)] -> (a -> a)
totalMin fs = foldr1 (\ f1 f2 -> if f1 0 < f2 0 then f1 else f2) fs

-- [(\ x -> x), (\ x -> x + 1), (\ x -> x + 1), (\ x -> x)]
-- [0, 1, 2]
-- 0 => 0 (id)
-- 0 => 1 (lambda)

-- [id, f, ???]

chainMinCompositions f = [id, f] ++ helper (f, id) (totalMin [f, id]) [2, 1, 0]
 where
     helper (f1, f2) tM (i:is)
      | any (\ j -> f1 j /= f2 j) (i:is) = (f1.f2) : helper ((f1.f2), f1) (totalMin [(f1.f2), tM]) (i+1:i:is)
      | otherwise = tM : helper (tM, f1) tM (i+1:i:is)

-- [3, 2, 1, 0]

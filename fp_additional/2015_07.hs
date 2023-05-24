main :: IO()
main = do
    print $ map (head [(\couple -> fst couple + snd couple)]) (foldr1 (++) [[(1, 2)], [(3, 4)]])

    print $ [ zip [x] [x] | x <- [1 .. 5] ]

    print $ map (\ (x:y:z) -> x:z) [[1,2,3],[2,3,1],[3,1,2]]

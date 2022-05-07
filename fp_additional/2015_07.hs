main :: IO()
main = do
    print $ map (head [(\couple -> fst couple + snd couple)]) (foldr1 (++) [[(1, 2)], [(3, 4)]])

    print $ [ zip [x] [x] | x <- [1 .. 5] ]

    print $ map (\ (x:y:z) -> x:z) [[1,2,3],[2,3,1],[3,1,2]]

-- [[1,2,3],[2,3,1],[3,1,2]]

-- (\ (x=1:y=2:z=[3]) -> x:z) => [1, 3]

-- [[1, 3], [2, 1], [3, 2]]

-- map (head [(\couple -> fst couple + snd couple)]) (foldr1 (++) [[(1, 2)], [(3, 4)]])

-- foldr1 (++) [[(1, 2)], [(3, 4)]]

-- x=[(1, 2)] y=[(3, 4)] => x ++ y => [(1, 2), (3, 4)]

-- map (head [(\couple -> fst couple + snd couple)]) [(1, 2), (3, 4)]
-- map (\couple -> fst couple + snd couple) [(1, 2), (3, 4)]

-- (\couple=(1, 2) -> 1 + 2)

-- [3, 7]

-- [ zip [x] [x] | x <- [1 .. 5] ]
-- [ zip [x] [x] | x <- [1, 2, 3, 4, 5] ]
-- [ zip [1] [1] ]
-- [ [(1, 1)] ]

-- zip [1] [1] => [(1, 1)]
-- [(2, 2)]
-- [(3, 3)]
-- [(4, 4)]
-- [(5, 5)]
-- [[(1, 1)], [(2, 2)]]
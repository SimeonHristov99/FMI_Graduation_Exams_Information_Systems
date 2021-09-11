main :: IO()
main = do
    print $ (totoalMin [id, (*2), (*(-1)), (*10) . (+5)]) 0 == 0
    print $ (totoalMin [(+2), ((-) (-1)), (*10) . (+5)]) 0 == (-1) -- -1 - 0
    print $ (totoalMin [(+2), ((-) 1), (*10) . (+5)]) 0 == 1 -- 1 - 0

    print $ [(chainMinCompositions (*0)!!i) 5 | i <- [0 .. 20]] == [5,0,0,5,0,0,5,0,0,5,0,0,5,0,0,5,0,0,5,0,0]
    print $ [(chainMinCompositions (max 10)!!i) 5 | i <- [0 .. 20]] == [5,10,10,5,10,10,5,10,10,5,10,10,5,10,10,5,10,10,5,10,10]
    print $ [(chainMinCompositions (* (-5))!!i) (-1) | i <- [0 .. 20]] == [-1,5,5,-1,5,5,-1,5,5,-1,5,5,-1,5,5,-1,5,5,-1,5,5]

totoalMin :: [(Int -> Int)] -> (Int -> Int)
totoalMin = foldl1 (\ f1 f2 -> if f1 0 < f2 0 then f1 else f2)

chainMinCompositions :: (Int -> Int) -> [(Int -> Int)]
chainMinCompositions f = id : f : helper [f, id]
 where
     helper :: [(Int -> Int)] -> [(Int -> Int)]
     helper fs
      | any (\ j -> (fs!!0) j /= (fs!!1) j) [0 .. length fs] = ((fs!!0) . (fs!!1)) : helper (((fs!!0) . (fs!!1)) : fs)
      | otherwise = totoalMin fs : helper (totoalMin fs : fs)

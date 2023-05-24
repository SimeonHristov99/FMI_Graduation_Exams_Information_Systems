main :: IO()
main = do
    print $ (totalMin [(\ x -> x - 1), (\ x -> x + 1)]) 5 == 4
    print $ (totalMin [(\ x -> x * 0), (\ x -> x + 1)]) 5 == 0
    print $ (totalMin [(\ x -> x * 0), (\ x -> -100)]) 5 == -100

    print $ ((take 4 $ chainMinCompositions (+1))!!0) 2 == 2
    print $ ((take 4 $ chainMinCompositions (+1))!!1) 2 == 3
    print $ ((take 4 $ chainMinCompositions (+1))!!2) 2 == 3
    print $ ((take 4 $ chainMinCompositions (+1))!!3) 2 == 2

totalMin fs = ???

chainMinCompositions f = ???

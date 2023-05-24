main :: IO()
main = do
    print $ [ x : [x] | x <- [ [1,2], [3,4] ] ]

    print $ [ map (f 5) [1,2,3] | f <- [(+),(-),(*)] ]

    print $ "a" : [['b', 'c'], "d"]

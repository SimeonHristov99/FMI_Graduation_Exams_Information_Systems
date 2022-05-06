main :: IO()
main = do
    print $ sumMaxRoots (\ x -> x^3 - x) [ [1,2,3], [-1,0,5], [1,4,-1] ] == -1

main :: IO()
main = do
    print $ sumMinFix [ (1/), exp, \x -> 2*x - 3 ] [-2, -1, 1, 3] == 2

addDefault val [] = [val]
addDefault val l = l

sumMinFix fl xl =
    ???
        (???
            (\ f -> ???
                (addDefault ???
                    [ ??? | x <- xl, ???])) fl)

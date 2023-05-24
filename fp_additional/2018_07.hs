main :: IO()
main = do
    print $ sumMinFix [ (1/), exp, \x -> 2*x - 3 ] [-2, -1, 1, 3] == 2

addDefault val [] = [val]
addDefault val l = l

sumMinFix fl xl =
    sum
        (map
            (\ f -> minimum
                (addDefault 0
                    [ x | x <- xl, f x == x])) fl)

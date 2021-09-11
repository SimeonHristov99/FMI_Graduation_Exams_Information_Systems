main :: IO()
main = do
    print $ sumMinFix [ (1/), exp, (\x -> 2*x - 3) ] [-2, -1, 1, 3] == 2 -- (= -1 + 3)

addDefault :: Double -> [Double] -> [Double]
addDefault val [] = [val]
addDefault val l = l

sumMinFix :: [(Double -> Double)] -> [Double] -> Double
sumMinFix fl xl = sum ( map (\ f -> minimum (addDefault 0 [ x | x <- xl, f x == x])) fl)

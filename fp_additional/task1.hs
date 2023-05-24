main :: IO()
main = do
    print $ minIf 15 60 == 15
    -- print $ minIf (-15) (-60)
    print $ minIf 60 15 == 15

    print $ minGuard 15 60 == 15
    print $ minGuard 60 15 == 15
    print $ minBuiltIn 60 15 == 15

    print $ lastDigit 154 == 4

    print $ quotientWhole 64 2 == 32
    print $ divWhole 154 17 == 9.058823529411764

    print $ removeLastDigit 154 == 15    

    print $ divReal 154.451 10.01 == 15.42967032967033
    print $ quotientReal 154.21 17.17 == 8

    print $ avgWhole 5 1542 == 773.5

    print $ roundTwoDig 3.1413465345321 == 3.14
    print $ roundTwoDigButWithMagic 3.1413465345321 == 3.14

    print $ inside 1 5 4 == True -- start = 1, finish = 5, x = 4
    print $ inside 5 1 4 == True
    print $ inside 10 50 20 == True
    print $ inside 10 50 1 == False

inside :: Int -> Int -> Int -> Bool
inside start finish x = any (\ num -> num == x) [min start finish .. max start finish]
-- inside start finish x = elem x [min start finish .. max start finish]
-- inside start finish x = any (== x) [min start finish .. max start finish]

-- 3.1413465345321
-- 314.13465345321
-- 314
-- 3.14

roundTwoDigButWithMagic :: Double -> Double
roundTwoDigButWithMagic = (/ 100) . fromIntegral . round . (* 100)

roundTwoDig :: Double -> Double
roundTwoDig x = (fromIntegral $ round $ x * 100) / 100

avgWhole :: Int -> Int -> Double
avgWhole x y = (fromIntegral $ x + y) / 2

quotientReal :: Double -> Double -> Int
quotientReal x d = truncate $ x / d

divReal :: Double -> Double -> Double
divReal x y = x / y

removeLastDigit :: Int -> Int
removeLastDigit x = div x 10

divWhole :: Int -> Int -> Double
divWhole x d = fromIntegral x / fromIntegral d

quotientWhole :: Int -> Int -> Int
quotientWhole x d = div x d

lastDigit :: Int -> Int
lastDigit x = mod x 10

minBuiltIn :: Int -> Int -> Int
minBuiltIn x y = min x y

minGuard :: Int -> Int -> Int
minGuard x y
 | x < y = x
 | otherwise = y

minIf :: Int -> Int -> Int
minIf x y = if x < y then x else y

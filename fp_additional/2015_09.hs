main :: IO()
main = do
    print $ merge [1, 3, 5, 7] [2, 2, 6, 10] == [1,2,2,3,5,6,7,10]
    print $ (\ xs -> [ y | y <- xs, even y ]) [1, 2, 3, 4]
    
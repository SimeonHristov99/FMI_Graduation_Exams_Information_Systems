main :: IO()
main = do
    print $ recommend [1, 2, 3] (\ x -> if even x then 5 else 1) [(1, 100), (2, 200), (3, 300), (4, 400), (5, 500)] == [5]

recommend :: [Int] -> (Int -> Int) -> [(Int, Double)] -> [Int]
recommend basket bestFit products = filter (\ product -> (not $ elem product basket) && findPrice product <= basketCost) (map bestFit basket)
 where
     findPrice :: Int -> Double
     findPrice product = head [ price | (id, price) <- products, id == product]
     
     basketCost :: Double
     basketCost =  sum [price | (productId, price) <- products, id <- basket, productId == id]
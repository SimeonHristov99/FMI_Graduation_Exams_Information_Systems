main :: IO()
main = do
    print $ recommended [1, 2, 3] bF [(1, 100), (2, 200), (3, 300), (8, 50), (10, 100)] -- == [10, 8]

bF :: Int -> Int
bF 1 = 3
bF 2 = 10
bF n = 8

-- [3, 10, 8]
recommended basket bestFit products = filter (\ product -> not (elem product basket) && findPrice product <= basketCost) (map bestFit basket)
 where
     findPrice product = head [ price | (id, price) <- products, id == product]
     basketCost = sum [ findPrice pId | pId <- basket]

-- findPrice 1 => head [100]
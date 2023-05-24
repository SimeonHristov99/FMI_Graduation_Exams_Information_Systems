main :: IO()
main = do
    print $ recommended [1, 2, 3] bF [(1, 100), (2, 200), (3, 300), (8, 50), (10, 100)] -- == [10, 8]

bF :: Int -> Int
bF 1 = 3
bF 2 = 10
bF n = 8

recommended basket bestFit products =
    ??? (\ product -> ???) (??? basket)
 where
     findPrice product = ??? products ???
     basketCost = ??? basket ???

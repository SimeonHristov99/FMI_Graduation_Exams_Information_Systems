import Data.List

main :: IO()
main = do
    print $ filterByChar 'o' ["cat", "cow", "dog"]
    print $ filterByChar' 'o' ["cat", "cow", "dog"]
    
    print $ f [1, 2, 3]
    print $ let (x:y):z = ["Curry"] in (x, y, z)
    print $ let (x:y):z = ["Curry", "sdfsd", "sfdsdf"] in (x, y, z)

filterByChar c ls = filter (\ x -> elem c x) ls
filterByChar'' c ls = filter (elem c) ls
filterByChar' c ls = filter (\ x -> any (== c) x) ls

f :: [Int] -> [Int]
f xs = let sorted = sort xs in if sorted == xs then sorted else xs

-- let (x:y):z = ["Curry"] in (x, y, z)
-- ['c', 'u', 'r', 'r', 'y']
-- x='c'
-- y="urry"
-- z=[]

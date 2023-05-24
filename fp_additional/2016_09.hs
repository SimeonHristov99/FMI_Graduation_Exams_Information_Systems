main :: IO()
main = do
    print $ filterByChar 'o' ["cat", "cow", "dog"]
    
    print $ let (x:y):z = ["Curry"] in (x, y, z)
    print $ let (x:y):z = ["Curry", "Information", "Systems"] in (x, y, z)

type String = [Char]

filterByChar c ls = filter (\ word -> any (==c) word) ls
-- filterByChar c ls = filter (\ word -> elem c word) ls

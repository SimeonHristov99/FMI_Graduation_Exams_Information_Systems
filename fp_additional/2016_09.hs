main :: IO()
main = do
    print $ filterByChar 'o' ["cat", "cow", "dog"]
    
    -- print $ let (x:y):z = ["Curry"] in (x, y, z)
    -- print $ let (x:y):z = ["Curry", "Information", "Systems"] in (x, y, z)

filterByChar c ls = filter ??? ls

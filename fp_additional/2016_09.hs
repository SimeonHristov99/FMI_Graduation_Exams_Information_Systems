main :: IO()
main = do
    print $ filterByChar 'o' ["cat", "cow", "dog"]
    print $ let (x:y):z = ["Curry"] in (x, y, z)

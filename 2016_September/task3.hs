main :: IO()
main = do
    print $ filterByChar 'o' ["cat", "cow", "dog"] == ["cow", "dog"]

    print $ let (x:y):z = ["Curry"] in (x,y,z)

filterByChar :: Char -> [String] -> [String]
filterByChar c = filter (\ s -> elem c s)

{-
let (x:y):z = ["Curry"] in (x,y,z)
=> ('C', "urry", [])

I would have chosen Scheme (Racket) on this one :D
-}
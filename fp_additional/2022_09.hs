main :: IO()
main = do
    print $ leaf (T 1 []) == True
    print $ leaf tree == False

    print $ twig (T 1 [T 2 [], T 3 []]) == True

    print $ stick (T 1 [T 2 [T 3 [T 4 []]]]) == True
    
    print $ trim tree == T 1 [T 4 [], T 7 [T 9 []]]
    
    print $ prune tree == T 1 [
        T 2 [T 3 []],
        T 4 [T 5 []],
        T 7 [T 8 [], T 9 [T 10 []]]]

leaf 
twig 
stick 

trim (T x ts) = T x 
                    
prune t@(T x []) = 
prune t@(T x ts) = T x (if stick t
                        then 
                        else )

data Tree = T { root :: Int, subtrees :: [Tree] }
 deriving (Show, Eq)

tree = T 1 [
    T 2 [T 3 []],
    T 4 [T 5 [T 6 []]],
    T 7 [T 8 [], T 9 [T 10 [T 11 []]]]]

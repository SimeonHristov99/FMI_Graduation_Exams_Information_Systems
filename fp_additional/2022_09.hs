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

    print $ let x = 5 + 6 in x * 10

--листо
-- leaf (T value children) = null children
-- leaf = null . subtrees
leaf t = null $ subtrees t

-- клонка
twig (T value children) = all leaf children
-- twig (T value children) = all (\ child -> leaf child) children
-- twig = all leaf . subtrees

-- пръчка
stick (T value children) = length children < 2 && all stick children
-- stick (T _ [t]) = stick t
-- stick (T _ ts) = null ts

-- trim (T x ts) = T x (map (\ child -> trim child) $ filter (\ child -> not $ twig child) ts)
trim (T x ts) = T x [trim child | child <- ts, not $ twig child]
-- trim (T x ts) = T x [ trim t | t <- ts, not $ twig t ]

-- & === @ (reference / псевдоним)

prune t@(T x []) = t
prune t@(T x ts) = T x (if stick t
                        then map (\ (T y _) -> (T y [])) ts
                        else map prune ts)
-- prune t@(T x []) = t
-- prune t@(T x ts) = T x (if stick t
--     then let [T y _] = ts in [T y []]
--     else map prune ts)


data Tree = T { root :: Int, subtrees :: [Tree] }
 deriving (Show, Eq)

tree = T 1 [
    T 2 [T 3 []],
    T 4 [T 5 [T 6 []]],
    T 7 [T 8 [], T 9 [T 10 [T 11 []]]]]

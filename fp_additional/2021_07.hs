main :: IO()
main = do
    -- print $ TwoD 5 6 == ThreeD 5 7 8 -- std::ostream operato<< (std::cout << ) != ==
    print $ treeWords t == ["abd","ac"]
    print $ quickSort [3,4,1,1,542,5,23,2,233,-6] == [-6,1,1,2,3,4,5,23,233,542]
    -- print $ f 6


data Tree a = EmptyTree | Node {
    value :: a,
    left :: Tree a,
    right :: Tree a
} deriving (Show, Read)

-- data Point2D a = TwoD a a | ThreeD a a a
--  deriving (Show, Eq)


-- data NTree a = EmptyTree | Node a [NTree a]
-- data BTree a = EmptyTree | Node a (BTree a) (BTree a)

-- strcut Node {
--     T a;
--     Node<T> left;
--     Node<T> right;
-- }

-- struct NNode
-- {
--     T a;
--     std::vector<Node<a>> children
-- }

t :: Tree Char
t = Node 'a' (Node 'b' (Node 'd' EmptyTree EmptyTree) EmptyTree) (Node 'c' EmptyTree EmptyTree)

--      a
--     / \
--    b   c
--   /
--  d

-- type String = [Char]

-- treeWords :: Tree Char -> [[Char]]
treeWords :: Tree Char -> [String]
treeWords EmptyTree = []
treeWords (Node v EmptyTree EmptyTree) = [[v]]
treeWords (Node v l r) = map (v:) (wl ++ wr)
 where
     wl = treeWords l
     wr = treeWords r

-- [a : b : [d]], [a, c]
-- [['a', 'b', 'd']], [['a', 'c']]

-- map ('a' : (map ('b' :) [['d'], ['c']]))
-- ["abd", "ac"]

-- f :: (Ord a) => a -> Bool -- operator< operator<= operator> 
-- f n = n < 5

quickSort :: (Ord a) => [a] -> [a]
quickSort [] = []
quickSort (x:xs) = quickSort lesser ++ [x] ++ quickSort greater
 where
     lesser = filter (\ y -> y <= x) xs
     greater = filter (\ y -> y > x) xs

-- [3,4,1,1,542,5,23,2,233,-6]
-- x=3:xs=[4,1,1,542,5,23,2,233,-6]
main :: IO()
main = do
    print $ treeWords t == ["abd","ac"]
    print $ quickSort [3,4,1,1000, 1,542,5,23,2,233,-6] == [-6,1,1,2,3,4,5,23,233,542,1000]


data Tree a = EmptyTree | Node {
    value :: a,
    left :: Tree a,
    right :: Tree a
} deriving (Show, Read)

t :: Tree Char
t = Node 'a' (Node 'b' (Node 'd' EmptyTree EmptyTree) EmptyTree) (Node 'c' EmptyTree EmptyTree)

--      a
--     / \
--    b   c
--   /
--  d

treeWords :: Tree Char -> [String]
treeWords EmptyTree = []
treeWords (Node v EmptyTree EmptyTree) = [[v]]
treeWords (Node v l r) = map (v:) (wl ++ wr)
 where
     wl = treeWords l
     wr = treeWords r

quickSort :: (Ord a) => [a] -> [a]
quickSort [] = []
quickSort (x:xs) = quickSort lesser ++ [x] ++ quickSort greater
 where
     lesser = filter (<=x) xs -- filter (\ y -> y <= x) xs
     greater = filter (>x) xs

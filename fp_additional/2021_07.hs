main :: IO()
main = do
    print $ treeWords t == ["abd","ac"]
    print $ quickSort [3,4,1,1,542,5,23,2,233,-6] == [-6,1,1,2,3,4,5,23,233,542]


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

treeWords :: ???
treeWords ??? = []
treeWords (Node v EmptyTree EmptyTree) = [[???]]
treeWords (Node v l r) = map (v:) (??? ++ ???)
 where
     wl = ???
     wr = ???

quickSort :: ???
quickSort [] = ???
quickSort (x:xs) = ??? ++ ??? ++ ???
 where
     lesser = filter ???
     greater = filter ???

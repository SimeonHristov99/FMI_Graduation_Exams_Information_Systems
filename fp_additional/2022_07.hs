main :: IO()
main = do
    print $ maxChain ["Boyan"] 15 "Maria" dues == ["Maria","Sia","Boyan"]
    print $ maxCircle dues == ["Boyan","Georgi","Petar","Maria"]

maxByLength ls = foldr (\ xs acc -> if length xs > length acc then xs else acc) [] ls

-- ls=[[1,2,3,19,29],[1,2,3], [4,5], [6,7,8,9]]
-- foldr (\ xs acc -> if length xs > length acc then xs else acc) [] [[1,2,3,19,29],[1,2,3], [4,5], [6,7,8,9]]
-- xs=[6,7,8,9] acc=[]

maxChain chain@(last:rest) amount final dues
 | last == final = chain
 | otherwise = maxByLength [ maxChain (to:chain) amount final dues |
                            (from, due, to) <- dues,
                            amount == due,
                            last == from, notElem to rest]

maxCircle dues = maxByLength [ maxChain [to] due from dues | (from, due, to) <- dues ]

dues = [("Georgi",10,"Boyan"),("Boyan",15,"Sia"),("Sia",15,"Maria"),("Maria",10,"Georgi"), ("Maria",10,"Petar"),("Petar",10,"Georgi"),("Boyan",10,"Maria")]

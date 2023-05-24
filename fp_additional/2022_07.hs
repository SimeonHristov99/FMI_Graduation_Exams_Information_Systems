main :: IO()
main = do
    print $ maxChain ["Boyan"] 15 "Maria" dues == ["Maria","Sia","Boyan"]
    print $ maxCircle dues == ["Boyan","Georgi","Petar","Maria"]

maxByLength ls = foldr ??? [] ls

maxChain chain@(last:rest) amount final dues
 | ??? = chain
 | otherwise = maxByLength [ maxChain ??? amount final dues |
                            ??? <- dues,
                            amount == ???,
                            last == ???, ???]

maxCircle dues = maxByLength [ maxChain ??? ??? ??? dues | ??? <- dues ]

dues = [("Georgi",10,"Boyan"),("Boyan",15,"Sia"),("Sia",15,"Maria"),("Maria",10,"Georgi"), ("Maria",10,"Petar"),("Petar",10,"Georgi"),("Boyan",10,"Maria")]

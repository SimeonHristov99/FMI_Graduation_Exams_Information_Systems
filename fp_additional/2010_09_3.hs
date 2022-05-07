main :: IO()
main = do
    print $ discount [("Pleven", 200, 5), ("Shumen", 259, 7), ("Varna", 20, 3)] 300 -- == [("Pleven",200,5.0),("Shumen",259,7.0),("Varna",20,3.0)]
    print $ discount [("Pleven", 200, 5), ("Shumen", 259, 7), ("Varna", 20, 3)] 250 -- == [("Pleven",200,5.0),("Shumen",259,6.3),("Varna",20,3.0)]
    print $ discount [("Pleven", 200, 5), ("Shumen", 259, 7), ("Varna", 20, 3)] 199 -- == [("Pleven",200,4.5),("Shumen",259,6.3),("Varna",20,3.0)]
    
    print $ shortenTour [("Pleven", 200, 5), ("Shumen", 259, 7), ("Varna", 20, 3), ("Sofia", 200, 5)] "Pleven" "Sofia" ("Sofia", 3, 1) == [("Pleven",200,5.0),("Sofia",3,1.0)]
    print $ shortenTour [("Pleven", 200, 5), ("Shumen", 259, 7), ("Varna", 20, 3), ("Pleven", 200, 5), ("Shumen", 259, 7)] "Pleven" "Shumen" ("Burgas", 300, 14) == [("Pleven",200,5.0),("Burgas",300,14.0),("Varna",20,3.0),("Pleven",200,5.0),("Burgas",300,14.0)]

type Trip = (String, Integer, Float)
type Tour = [Trip]

discount :: Tour -> Integer -> Tour
discount tour len = foldr (\ t@(end, lenC, price) acc -> 
                            if lenC > len
                            then (end, lenC, price * 0.9) : acc
                            else t:acc ) [] tour

-- [("Pleven", 200, 5), ("Shumen", 259, 7), ("Varna", 20, 3)]
-- (end="Varna", lenC=20, price=3) acc=[] => acc=[(end="Varna", lenC=20, price=3)]
-- (end="Shumen", lenC=259, price=7) acc=[("Varna", 20, 3)] => 259 > 300 

shortenTour :: Tour -> String -> String -> Trip -> Tour
shortenTour tour from to trip = helper tour False
 where
     helper :: Tour -> Bool -> Tour
     helper [] flag = []
     helper ((end, len, pr):ts) True
      | end == to = trip : helper ts False
      | otherwise = helper ts True
     helper ((end, len, pr):ts) False
      | end == from = (end, len, pr) : helper ts True
      | otherwise = (end, len, pr) : helper ts False

-- std::vector<Tour> res;
-- bool flag = False
-- for(t : tour) {
--     if(flag)
--     {
--         if (t.end == to)
--         {
--             res.push_back(trip)
--         }
--     }
-- }

-- shortenTour tour=[("Pleven", 200, 5), ("Shumen", 259, 7), ("Varna", 20, 3), ("Sofia", 200, 5)] from="Pleven" to="Sofia" trip=("Sofia", 3, 1)
-- helper tour=[("Pleven", 200, 5), ("Shumen", 259, 7), ("Varna", 20, 3), ("Sofia", 200, 5)] flag=False
-- helper t=(end="Pleven", _, _) ts=[("Shumen", 259, 7), ("Varna", 20, 3), ("Sofia", 200, 5)] flag=False
-- ("Pleven", 200, 5) : helper ts[("Shumen", 259, 7), ("Varna", 20, 3), ("Sofia", 200, 5)] flag=True
-- ("Pleven", 200, 5) : helper t=(end="Shumen", _, _) ts=[("Varna", 20, 3), ("Sofia", 200, 5)] flag=True
-- ("Pleven", 200, 5) : helper t=("Varna", 20, 3) ts=[("Sofia", 200, 5)] flag=True
-- ("Pleven", 200, 5) : helper t=("Sofia", 200, 5) ts=[] flag=True
-- ("Pleven", 200, 5) : ("Sofia", 3, 1) : helper [] flag=True
-- ("Pleven", 200, 5) : ("Sofia", 3, 1) : []
-- [("Pleven", 200, 5), ("Sofia", 3, 1)]


-- discount tour len = [ (name, lenC, price * 0.9) | (name, lenC, price) <- tour, lenC > len ]
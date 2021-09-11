main :: IO()
main = do
    print $ discount [("Sofia", 10, 5), ("Shumen", 50, 400), ("Burgas", 10, 100)] 10 == [("Sofia",10,4.5),("Shumen",50,400.0),("Burgas",10,90.0)]
    print $ shortenTour [("Sofia", 10, 5), ("Shumen", 50, 400), ("Burgas", 10, 100)] "Sofia" "Burgas" ("Svoge", 2, 20) == [("Sofia", 10, 5), ("Svoge", 2, 20)]
    print $ shortenTour [("Sofia", 10, 5), ("Shumen", 50, 400), ("Burgas", 10, 100), ("Varna", 100, 500), ("Sofia", 10, 5), ("Burgas", 10, 100)] "Sofia" "Burgas" ("Svoge", 2, 20) == [("Sofia",10,5.0),("Svoge",2,20.0),("Varna",100,500.0),("Sofia",10,5.0),("Svoge",2,20.0)]
    print $ shortenTour [("Sofia", 10, 5), ("Shumen", 50, 400), ("Varna", 100, 500), ("Sofia", 10, 5), ("Burgas", 10, 100)] "Sofia" "Burgas" ("Svoge", 2, 20) == [("Sofia",10,5.0),("Svoge",2,20.0)]
    print $ shortenTour [("Sofia", 10, 5), ("Burgas", 50, 400), ("Varna", 100, 500), ("Shumen", 50, 400), ("Sofia", 10, 5), ("Burgas", 10, 100)] "Sofia" "Burgas" ("Svoge", 2, 20) == [("Sofia",10,5.0),("Svoge",2,20.0), ("Varna", 100, 500), ("Shumen", 50, 400), ("Sofia",10,5.0),("Svoge",2,20.0)]

type Trip = (String, Integer, Float)
type Tour = [Trip]

discount :: Tour -> Integer -> Tour
discount tour len =
    map (\ trip@(name, cLen, cPrice) -> 
        if cLen == len
            then (name, cLen, cPrice - cPrice * 0.1)
            else trip) tour

shortenTour :: Tour -> String -> String -> Trip -> Tour
shortenTour [] _ _ _ = []
shortenTour (t@(name, _, _):ts) from to trip
 | name == from = t : trip : shortenTour (tail $ dropWhile (\ (destName, _, _) -> destName /= to) ts) from to trip
 | otherwise = t : shortenTour ts from to trip
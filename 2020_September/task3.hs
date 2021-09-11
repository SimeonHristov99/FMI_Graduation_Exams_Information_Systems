main :: IO()
main = do
    print $ rf ("Mozart","The Marriage of Figaro Overture",270) == "Summertime"
    print $ rf ("Gershwin", "Summertime", 300) == "Rhapsody in Blue"
    print $ rf ("Gershwin", "Rhapsody in Blue", 1100) == "Bohemian Rhapsody"

rf = recommender [("Mozart","The Marriage of Figaro Overture",270), ("Gershwin","Summertime",300), ("Queen","Bohemian Rhapsody",355), ("Gershwin","Rhapsody in Blue",1100)]

recommender :: [(String, String, Int)] -> ((String, String, Int) -> String)
recommender pl = (\ p@(currentAuthor, currentName, currentDuration) -> 
    let avgDuration artist = let durs = [ duration | (author, name, duration) <- pl, author == artist] in (fromIntegral $ sum durs) / (fromIntegral $ length durs)
        option1 = [ name | (author, name, duration) <- pl, author == currentAuthor, duration > currentDuration]
        option2 = [ name | (author, name, _) <- pl, author /= currentAuthor, avgDuration author < avgDuration currentAuthor]
                 in if not (null option1) then (head option1)
                    else if not (null option2) then (last option2)
                         else if (null $ tail $ dropWhile (/= p) pl) then currentName else head [name | (_, name, dur) <- pl, dur > currentDuration])

main :: IO()
main = do
    print $ rf ("Mozart","The Marriage of Figaro Overture",270) == "Summertime"
    print $ rf ("Gershwin", "Summertime", 300) == "Rhapsody in Blue"
    print $ rf ("Gershwin", "Rhapsody in Blue", 1100) == "Bohemian Rhapsody"

rf = recommender [("Mozart","The Marriage of Figaro Overture",270), ("Gershwin","Summertime",300), ("Queen","Bohemian Rhapsody",355), ("Gershwin","Rhapsody in Blue",1100)]

recommender pl = (\ (author, songName, songLen) ->
    let avgDuration artist = let lens = [sLpL | (aPl, sPl, sLpL) <- pl, aPl == artist] in sum lens / (fromIntegral $ length lens)
        option1 = [sPl | (aPl, sPl, sLpL) <- pl, author == aPl && sLpL > songLen]
        option2 = [sPl | (aPl, sPl, sLpL) <- pl, avgDuration aPl < avgDuration author]
    in if not (null option1) then (head option1)
       else if not (null option2) then (last option2)
            else head $ [sPl | (aPl, sPl, sLpL) <- pl, sLpL > songLen] ++ [songName])

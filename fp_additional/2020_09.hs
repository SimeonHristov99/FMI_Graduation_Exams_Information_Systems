main :: IO()
main = do
    print $ rf ("Mozart","The Marriage of Figaro Overture",270) == "Summertime"
    print $ rf ("Gershwin", "Summertime", 300) == "Rhapsody in Blue"
    print $ rf ("Gershwin", "Rhapsody in Blue", 1100) == "Bohemian Rhapsody"

rf = recommender [("Mozart","The Marriage of Figaro Overture",270), ("Gershwin","Summertime",300), ("Queen","Bohemian Rhapsody",355), ("Gershwin","Rhapsody in Blue",1100)]

recommender pl = (\ p@(aCurrent, nCurrent, lCurrent) ->
    let avgDuration artist = let lens = [ len | (author, n, len) <- pl, author == artist ] in sum lens / (fromIntegral $ length lens)
        option1 = [ name | (author, name, len) <- pl, author == aCurrent && len > lCurrent ]
        option2 = [ name | (author, name, len) <- pl, avgDuration author < avgDuration aCurrent ]
    in if not (null option1) then (head option1)
       else if not (null option2) then (last option2)
            else let afterP = [ name | (a, name, len) <- pl, len > lCurrent ] in if not (null afterP) then head afterP else nCurrent)

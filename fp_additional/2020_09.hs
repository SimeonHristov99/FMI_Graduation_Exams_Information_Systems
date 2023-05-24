main :: IO()
main = do
    print $ rf ("Mozart","The Marriage of Figaro Overture",270) == "Summertime"
    print $ rf ("Gershwin", "Summertime", 300) == "Rhapsody in Blue"
    print $ rf ("Gershwin", "Rhapsody in Blue", 1100) == "Bohemian Rhapsody"

rf = recommender [("Mozart","The Marriage of Figaro Overture",270), ("Gershwin","Summertime",300), ("Queen","Bohemian Rhapsody",355), ("Gershwin","Rhapsody in Blue",1100)]

recommender pl = ???
    let avgDuration artist = ???
        option1 = ???
        option2 = ???
    in if not (null option1) then (??? option1)
       else if not (null option2) then (??? option2)
            else ???

main :: IO()
main = do
    print $ rf ("Mozart","The Marriage of Figaro Overture",270) == "Summertime"
    print $ rf ("Gershwin", "Summertime", 300) == "Rhapsody in Blue"
    print $ rf ("Gershwin", "Rhapsody in Blue", 1100) == "Bohemian Rhapsody"

rf = recommender [("Mozart","The Marriage of Figaro Overture",270), ("Gershwin","Summertime",300), ("Queen","Bohemian Rhapsody",355), ("Gershwin","Rhapsody in Blue",1100)]

main :: IO()
main = do
    print $ maxSlope (head tracks) == 0.2
    print $ easiestTrackUnder 800 tracks == [(0, 900), (100, 910), (200, 925), (300, 905), (600, 950)]

tracks = [[(0, 900), (100, 910), (200, 925), (300, 905), (600, 950)],[(0, 1300), (100, 1305), (500, 1340), (800, 1360), (1000, 1320)],[(0, 800), (200, 830), (300, 845), (600, 880), (800, 830)]]

argMin f l = foldl1 (\ x y -> if f x < f y then x else y) l

maxSlope track = maximum (map (\ ((start, hStart), (end, hEnd)) -> abs $ (hEnd - hStart) / (end - start)) (zip track (tail track)))

easiestTrackUnder maxLen tracks = argMin maxSlope (filter (\ xs -> (fst $ last xs) < maxLen) tracks)

-- track=[(0, 900), (100, 910), (200, 925), (300, 905), (600, 950)]
-- (tail track) = [(100, 910), (200, 925), (300, 905), (600, 950)]
-- [((0, 900), (100, 910)), ((100, 910), (200, 925))]

-- [(0, 900), (100, 910), (200, 925), (300, 905), (600, 950)]
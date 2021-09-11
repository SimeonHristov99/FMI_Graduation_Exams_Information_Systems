main :: IO()
main = do
    print $ maxSlope (head tracks) == 0.2
    print $ easiestTrackUnder 800 tracks == [(0, 900), (100, 910), (200, 925), (300, 905), (600, 950)]

argMin :: ([(Double, Double)] -> Double) -> [[(Double, Double)]] -> [(Double, Double)]
argMin f l = foldr1 (\ x y -> if f x < f y then x else y) l

maxSlope :: [(Double, Double)] -> Double
maxSlope track = maximum (map (\ ((d1, h1), (d2, h2)) -> (abs $ h1 - h2) / (abs $ d1 - d2)) (zip track (tail track)))

easiestTrackUnder :: Double -> [[(Double, Double)]] -> [(Double, Double)]
easiestTrackUnder maxLen tracks = argMin maxSlope (filter (\ track -> maxLen >= (fst $ last track)) tracks)

tracks = [[(0, 900), (100, 910), (200, 925), (300, 905), (600, 950)],[(0, 1300), (100, 1305), (500, 1340), (800, 1360), (1000, 1320)],[(0, 800), (200, 830), (300, 845), (600, 880), (800, 830)]]
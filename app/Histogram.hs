import Data.List

countsOf :: Integer -> [Integer] -> Integer
countsOf _ [] = 0
countsOf x (y:ys)
   | x == y    = 1 + countsOf x ys
   | otherwise = countsOf x ys

counts :: [Integer] -> [(Integer, Integer)]
counts [] = []
counts xs = map (\a -> (a, (countsOf a xs))) xs

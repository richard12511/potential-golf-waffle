import Data.List

countsOf :: Integer -> [Integer] -> Integer
countsOf _ [] = 0
countsOf x (y:ys)
   | x == y    = 1 + countsOf x ys
   | otherwise = countsOf x ys

counts :: [Integer] -> [(Integer, Integer)]
counts [] = []
counts xs = nub $ map (\a -> (a, (countsOf a xs))) xs

--ex: (3,4) becomes 3 = * * * *
--ex: (4,3) becomes 4 = * * *
countToString :: (Integer, Integer) -> String

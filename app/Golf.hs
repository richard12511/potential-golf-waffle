every :: Int -> [a] -> [a]
every n xs = case drop (n-1) xs of 
      (y:ys) -> y : every n ys
      []     -> []

buildList :: [a] -> [[a]] -> [[a]]
buildList xs xsList 
   | (length xsList) < (length xs) = buildList xs (xsList ++ [(every (length xsList + 1) xs)])                 
   | otherwise                     = xsList

skips :: [a] -> [[a]]
skips xs = buildList xs []

hasMaxima :: Integer -> Integer -> Integer -> Bool
hasMaxima x1 x2 x3 
   | (x2 > x1) && (x2 > x3) = True
   | otherwise              = False

localMaxima :: [Integer] -> [Integer]
localMaxima (x1:x2:x3:xs)
   | hasMaxima x1 x2 x3 = x2 : (localMaxima (x2:x3:xs))
   | otherwise          = localMaxima (x2:x3:xs)
localMaxima xs = []

counts :: [Integer] -> [(Integer, Integer)]
counts [] = []

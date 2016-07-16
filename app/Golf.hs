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
every :: Int -> [a] -> [a]
every n xs
   | n > (length xs) = []
   | otherwise       = case drop (n-1) xs of 
                        (y:ys) -> y : every n ys
                        []     -> []

buildList :: [a] -> [[a]] -> [[a]]
buildList xs xsList 
   | (length xsList) < (length xs) = buildList xs (xsList ++ [(every (length xsList) xs)])                 
   | otherwise                = drop 1 xsList

skips :: [a] -> [[a]]
skips xs = buildList xs [[]]
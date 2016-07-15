every :: Int -> [a] -> [a]
every n xs
   | n > (length xs) = []
   | otherwise       = case drop (n-1) xs of 
                        (y:ys) -> y : every n ys
                        []     -> []

skips :: [a] -> [[a]]
skips xs = [(every 1 xs)] ++ [(every 2 xs)]

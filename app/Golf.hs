skip :: Int -> [a] -> [a]
skip n xs = case drop (n-1) xs of 
   (y:ys) -> y : skip n ys
   []     -> []


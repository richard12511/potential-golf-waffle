isRight :: (Integer, Integer, Integer) -> Bool
isRight (a, b, c)
   | (a ^ 2) + (b ^ 2) == (c ^ 2) = True
   | otherwise                    = False

perimeter :: (Integer, Integer, Integer) -> Integer
perimeter (a, b, c) = a + b + c

allRightTrianglesSmallerThan11 = [(a, b, c) | c <- [1..10], b <- [1..c], a <- [1..b], isRight (a,b,c)]
allRightTrianglesSmallerThan11AndPerimeter24 = [(a, b, c) | (a, b, c) <- allRightTrianglesSmallerThan11, perimeter (a,b,c) == 24]

surfaceArea r h =
   let sideArea = 2 * pi * r * h
       topArea  = pi * r^2
   in sideArea + 2 * topArea 

elem' :: (Eq a) => a -> [a] -> Bool
elem' a [] = False
elem' a (x:xs) 
   | a == x    = True
   | otherwise = elem' a xs

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
   let smallerElems = [a | a <- xs, a <= x]
       largerElems  = [a | a <- xs, a > x]
   in quicksort smallerElems ++ [x] ++ quicksort largerElems

quicksort' :: (Ord a) => [a] -> [a]
quicksort' [] = []
quicksort' (x:xs) = 
  let smallerElems = quicksort (filter (<= x) xs)
      largerElems  = quicksort (filter (> x) xs)
  in smallerElems ++ [x] ++ largerElems
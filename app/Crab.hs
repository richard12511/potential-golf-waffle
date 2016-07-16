isRight :: (Integer, Integer, Integer) -> Bool
isRight (a, b, c)
   | (a ^ 2) + (b ^ 2) == (c ^ 2) = True
   | otherwise                    = False

allRightTrianglesSmallerThan11 = [(a, b, c) | a <- [1..10], b <- [1..10], c <- [1..10], isRight (a,b,c)]
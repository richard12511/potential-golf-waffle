isRight :: (Integer, Integer, Integer) -> Bool
isRight (a, b, c)
   | (a ^ 2) + (b ^ 2) == (c ^ 2) = True
   | otherwise                    = False

allRightTrianglesSmallerThan11 = [(a, b, c) | c <- [1..10], b <- [1..c], a <- [1..b], isRight (a,b,c)]
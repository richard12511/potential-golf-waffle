isRight :: (Integer, Integer, Integer) -> Bool
isRight (a, b, c)
   | (a ^ 2) + (b ^ 2) == (c ^ 2) = True
   | otherwise                    = False

perimeter :: (Integer, Integer, Integer) -> Integer
perimeter (a, b, c) = a + b + c

allRightTrianglesSmallerThan11 = [(a, b, c) | c <- [1..10], b <- [1..c], a <- [1..b], isRight (a,b,c)]
allRightTrianglesSmallerThan11AndPerimeter24 = [(a, b, c) | (a, b, c) <- allRightTrianglesSmallerThan11, perimeter (a,b,c) == 24]
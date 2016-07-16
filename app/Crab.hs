allSidesSmallerThan10 :: (Integer, Integer, Integer) -> Bool
allSidesSmallerThan10 (a,b,c)
   | (a < 10) && (b < 10) && (c < 10) = True
   | otherwise                        = False
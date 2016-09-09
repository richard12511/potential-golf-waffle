import Data.List
import Data.Char

countsOf :: Int -> [Int] -> Int
countsOf _ [] = 0
countsOf x (y:ys)
   | x == y    = 1 + countsOf x ys
   | otherwise = countsOf x ys

counts :: [Int] -> [(Int, Int)]
counts [] = []
counts xs = nub $ map (\a -> (a, (countsOf a xs))) xs

addSpaces :: Int -> String
addSpaces 0 = []
addSpaces x = ' ' : ' ' : addSpaces (x - 1)

addStars :: Int -> String
addStars 0 = []
addStars x = ' ' : '*' : addStars (x - 1)

numToStars :: Int -> String
numToStars 0 = ""
numToStars x = addSpaces (9 - x) ++ addStars (x)

countToString :: (Int, Int) -> String
countToString (num, count) =
  intToDigit num : ' ' : '=' : numToStars count

toHistoStrings :: [Int] -> [String]
toHistoStrings xs = map reverse $ map countToString $ counts xs

histogram :: [Int] -> String
histogram [] = ""
histogram xs = intercalate "\n" $ map reverse (toHistoStrings xs)

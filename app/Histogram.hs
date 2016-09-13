import Data.List
import Data.Char

countsOf :: Int -> [Int] -> Int
countsOf _ [] = 0
countsOf x (y:ys)
   | x == y    = 1 + countsOf x ys
   | otherwise = countsOf x ys

counts :: [Int] -> [(Int, Int)]
counts [] = []
counts xs = nub $ map (\a -> (a, (countsOf a xs))) (xs `union` [1..9])

addChars :: Char -> Int -> String
addChars _ 0 = []
addChars char x = ' ' : char : addChars char (x - 1)

numToStars :: Int -> String
numToStars 0 = ""
numToStars x = addChars '*' (x) ++ addChars ' ' (9 - x)

countToString :: (Int, Int) -> String
countToString (num, count) =
  intToDigit num : ' ' : '=' : numToStars count

toHistoStrings :: [Int] -> [String]
toHistoStrings xs = map reverse $ map countToString $ counts xs

histogram :: [Int] -> String
histogram [] = ""
histogram xs = intercalate "\n" $ map reverse (toHistoStrings xs)

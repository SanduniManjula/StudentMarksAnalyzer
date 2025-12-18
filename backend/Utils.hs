module Utils where

-- Compute average of a list of Int
averageOf :: [Int] -> Float
averageOf xs = fromIntegral (sum xs) / fromIntegral (length xs)

-- Convert average to grade
gradeFromAverage :: Float -> String
gradeFromAverage avg
  | avg >= 75 = "A"
  | avg >= 60 = "B"
  | avg >= 45 = "C"
  | otherwise = "F"

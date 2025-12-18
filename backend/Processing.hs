module Processing where

import DataTypes
import Utils
import Data.List (sortOn)

-- Compute the Result for a Student
-- Optional: weighted marks (first mark 60%, others equally 40%)
computeResult :: Student -> Result
computeResult s =
  let ms     = marks s
      avg    = averageOf ms
      final  = case ms of
                 (m1:m2:m3:_) -> fromIntegral m1 * 0.6 + fromIntegral m2 * 0.2 + fromIntegral m3 * 0.2
                 _            -> avg  -- fallback for fewer marks
      total  = sum ms
  in Result (name s) total avg (gradeFromAverage final) final

-- Rank results by final score (descending)
rankResults :: [Result] -> [Result]
rankResults = reverse . sortOn finalScore

-- Compute statistics from results
computeStatistics :: [Result] -> Statistics
computeStatistics rs =
  let scores = map finalScore rs
  in Statistics
       { highest = maximum scores
       , lowest  = minimum scores
       , mean    = averageOf (map round scores)
       }

-- Create a polished ASCII table for results
asciiTable :: [Result] -> String
asciiTable rs =
  let header = "Student   | Score  | Grade\n" ++ replicate 25 '-'
      rows   = map formatRow rs
  in unlines (header : rows)
  where
    formatRow r =
      let n   = padRight 9 (studentName r)
          s   = padRight 6 (show (round (finalScore r) :: Int))
          g   = grade r
      in n ++ " | " ++ s ++ " | " ++ g

-- Helper: pad string on the right
padRight :: Int -> String -> String
padRight n str = str ++ replicate (n - length str) ' '

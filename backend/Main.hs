module Main where

import DataTypes
import Processing
import IOHandler
-- Conditional import for parallel computation
import qualified Control.Parallel.Strategies as PS

-- Helper function: choose parallel or sequential map
computeResults :: [Student] -> [Result]
computeResults students =
  -- Use parMap if parallel strategies are available
  PS.parMap PS.rseq computeResult students
  -- To use sequentially instead, comment above line and uncomment below
  -- map computeResult students

main :: IO ()
main = do
    putStrLn "Enter CSV file path (e.g., students.csv):"
    path <- getLine
    students <- readStudents path

    -- Functional pipeline
    let results = computeResults students
    let ranked  = rankResults results
    let stats   = computeStatistics ranked

    -- Show statistics
    putStrLn "\n--- Class Statistics ---"
    print stats

    -- Show ranked results in ASCII table
    putStrLn "\n--- Ranked Results Table ---"
    putStrLn (asciiTable ranked)

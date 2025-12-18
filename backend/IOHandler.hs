module IOHandler where

import DataTypes

-- Parse CSV line to Student
parseStudent :: String -> Student
parseStudent line =
  case splitByComma line of
    [] -> Student "" []
    (nm:ms) -> Student nm (map read ms)

-- Split string by comma
splitByComma :: String -> [String]
splitByComma "" = []
splitByComma s  =
  let (w, rest) = break (== ',') s
  in w : case rest of
           []      -> []
           (_:rs)  -> splitByComma rs

-- Read CSV file and return students
readStudents :: FilePath -> IO [Student]
readStudents path = fmap (map parseStudent . lines) (readFile path)

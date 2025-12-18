module DataTypes where

-- Represents a student with name and marks
data Student = Student
  { name  :: String
  , marks :: [Int]
  } deriving (Show, Eq)

-- Computed result per student
data Result = Result
  { studentName :: String
  , total       :: Int
  , average     :: Float
  , grade       :: String
  , finalScore  :: Float
  } deriving (Show, Eq)

-- Statistics for a class
data Statistics = Statistics
  { highest :: Float
  , lowest  :: Float
  , mean    :: Float
  } deriving (Show, Eq)

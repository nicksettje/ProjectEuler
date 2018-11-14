module Euler15 where

import EulerProblem

-- Key Lesson:
-- math is faster than programming

question15 :: Question
question15 = "Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.\n\
\How many such routes are there through a 20×20 grid?\n\
\Answer:\n"

answer15 :: Answer
answer15 = show $ numberOfSquareLatticePaths 20 

-- number of paths is binomial steps rows
-- for an n-by-n grid, need 2*n steps for n rows

numberOfSquareLatticePaths :: Integer -> Integer
numberOfSquareLatticePaths n = binomial (2*n) n 

binomial :: Integer -> Integer -> Integer
binomial n k = (factorial n) `div` ((factorial (n-k))*(factorial k))

factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n*factorial(n-1)

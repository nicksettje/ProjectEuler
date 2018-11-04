module Euler6 where

import EulerProblem

question6 :: Question
question6 = "The sum of the squares of the first ten natural numbers is,\n\
\ 1^2 + 2^2 + ... + 10^2 = 385\n\
\The square of the sum of the first ten natural numbers is,\n\
\(1 + 2 + ... + 10)^2 = 55^2 = 3025\n\
\Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.\n\
\Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.\n\
\Answer:\n"

answer6 :: Answer
answer6 = show $ differenceSquareSum 100

differenceSquareSum :: Integer -> Integer
differenceSquareSum n = (squareOfSum n) - (sumOfSquares n)  

sumOfSquares :: Integer -> Integer
sumOfSquares n = foldr (+) 0 $ map (^(2::Integer)) [1..n] 

squareOfSum :: Integer -> Integer
squareOfSum n = (foldr (+) 0 [1..n])^(2::Integer) 

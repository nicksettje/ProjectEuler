module Euler12 where

import EulerProblem

question12 :: Question
question12 = "The sequence of triangle numbers is generated by adding the natural numbers. So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The first ten terms would be:\n\
\ 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...\n\
\ Let us list the factors of the first seven triangle numbers:\n\
\  1: 1\n\
\  3: 1,3\n\
\  6: 1,2,3,6\n\
\ 10: 1,2,5,10\n\
\ 15: 1,3,5,15\n\
\ 21: 1,3,7,21\n\
\ 28: 1,2,4,7,14,28\n\
\ We can see that 28 is the first triangle number to have over five divisors.\n\
\ What is the value of the first triangle number to have over five hundred divisors?\n\
\Answer:\n"

-- TODO: optimize run time 
answer12 :: Answer
answer12 = show $ (\x -> x*(x+1) `div` 2) $ head $ filter (\x -> (numberOfTriangleNumberFactors x) > 500) $ [1..] 

-- triangle(n) = n(n+1)/2 
-- n and n+1 are coprime, only one of n or n+1 is even
-- n is even: number of factors of n = (factors n/2)*(factors n+1) 
-- n is not even: number of factors of n = (factors n)*(factors (n+1)/2) 
-- you move the /2 over to the factor that will be even
numberOfTriangleNumberFactors :: Integer -> Int
numberOfTriangleNumberFactors n
    | n `mod` 2 == 0 = (length (factors (n `div` 2)))*(length (factors (n+1)))
    | otherwise = (length (factors n))*(length (factors ((n+1) `div` 2))) 

factors :: Integer -> [Integer]
factors n = f n where
  f factor
    | factor == 0         = []                    -- stop condition
    | n `mod` factor == 0 = factor : f (factor-1) -- factor is a factor
    | otherwise           = f (factor-1)          -- factor is not a factor

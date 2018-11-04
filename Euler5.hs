module Euler5 where

import EulerProblem
import MathUtil (primes)

question5 :: Question
question5 = "2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.\n\n\
\What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?\n\n\
\Answer:\n"

answer5 :: Answer
answer5 = show $ smallestMultiple 20 

smallestMultiple :: Integer -> Integer
smallestMultiple n = f primeProduct where
  f acc
    | isEvenlyDivisible acc n = acc
    | otherwise = f (acc+primeProduct) 
  primeProduct =  foldr (*) 1 $ takeWhile (<n) $ map toInteger primes

isEvenlyDivisible :: Integer -> Integer -> Bool
isEvenlyDivisible n largest = f 0 where
  f offset
    | largest-offset < 1 = True
    | n `mod` (largest-offset) == 0 = f (offset+1) 
    | otherwise = False

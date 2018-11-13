module Euler14 where

import Data.Function.Memoize
import EulerProblem

-- Key Lesson:
-- memoization saves time but not necessarily all of the time
--
-- Remaining Questions:
-- is maximum faster than foldr (max) 0?

question14 :: Question
question14 = "The following iterative sequence is defined for the set of positive integers:\n\
\ n → n/2 (n is even)\n\
\ n → 3n + 1 (n is odd)\n\
\Using the rule above and starting with 13, we generate the following sequence:\n\
\ 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1\n\
\It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.\n\
\Which starting number, under one million, produces the longest chain?\n\
\NOTE: Once the chain starts the terms are allowed to go above one million.\n\
\Answer:\n"

answer14 :: Answer
answer14 = show $ snd . maximum $ map (\x -> ((length. collatzSequence) x, x)) [2..1000000]

-- not a lot faster
collatzSequence :: Integer -> [Integer]
collatzSequence = memoize collatz where
  collatz 1 = [] 
  collatz n
    | odd n     = 3*n+1 : collatzSequence (3*n+1)
    | even n    = n `div` 2  : collatzSequence (n `div` 2)
    | otherwise = []

-- slow
naiveCollatzSequenceLength :: Int -> Int
naiveCollatzSequenceLength n = memoize f n 0 where
  f term chainl 
    | term == 1         = chainl+1 
    | term `mod` 2 == 0 = f (term `div` 2) (chainl+1)
    | otherwise         = f (3*term+1) (chainl+1)

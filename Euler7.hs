module Euler7 where

import Data.Maybe (fromJust)
import ListUtil (idx)
import MathUtil (primes)
import EulerProblem

-- Key Lesson:
-- Roll your own safe indexing function
-- Zero-indexing

question7 :: Question
question7 = "By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.\n\n\
\What is the 10 001st prime number?\n\n\
\Answer \n"

answer7 :: Answer
answer7 = show $ fromJust $ idx 10000 $ map toInteger primes

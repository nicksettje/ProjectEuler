module Euler10 where

import MathUtil (primes)
import EulerProblem

question10 :: Question
question10 = "The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.\n\
\Find the sum of all the primes below two million.\n\
\Answer:\n"

answer10 :: Answer
answer10 = show $ foldr (+) 0 $ takeWhile (<2000000) primes 

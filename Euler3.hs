module Euler3 where
-- based on https://stackoverflow.com/questions/21276844/prime-factors-in-haskell
import EulerProblem
import MathUtil (primeFactors)

-- Key Lesson:
-- Haskell allows recursive infinite lists to be shared between functions
-- Recursive infinite lists are computed term-by-term back-and-forth
--
-- tail returns a list
-- head returns an element of a list
--
-- General Strategy:
-- Generate all primes as an infinite list, then use a recursive function
-- to divide the number at hand by the list of primes in order to
-- compute prime factors for all factors of the number that are not
-- yet known to be prime or not prime. Basically, start from the number
-- then sequentially divide by increasing primes.
--
-- Remaining Questions
-- How does Haskell cache the list of primes?
-- How many primes does it actually compute for a given invocation?
-- Are intermediate n `mod` m calculations cached?

question3 :: Question
question3 = "Question: \n\n\
\The prime factors of 13195 are 5, 7, 13 and 29.\n\n\
\What is the largest prime factor of the number 600851475143 ?\n\n\
\Answer:\n"

answer3 :: Answer
-- largest prime factor is the last element of the primeFactors list
answer3 = show $ last $ primeFactors 600851475143 


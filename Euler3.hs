module Euler3 where
-- based on https://stackoverflow.com/questions/21276844/prime-factors-in-haskell
import EulerProblem

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

primeFactors :: Int -> [Int]
-- head primes and tail primes are starting conditions
-- BEFORE the primes list has computed the next prime
--
-- Each call to primes computes one more term, and each call happens
-- after one iteration (one guard evaluation) of primeFactors
primeFactors em = f em (head primes) (tail primes) where
  f m n ns
    -- two is the first prime; algo counts down from n, so this is the stop condition
    | m < 2 = []
    -- m is smaller than the square of n, so can stop early because
    -- the algorithm will proceed with equivalent calculations for smaller factors;
    -- this prevents re-doing calculations for smaller factors 
    | m < n^(2::Int) = [m]
    -- n is a factor of m, so add n to the list, then find
    -- the factors of m/n
    | m `mod` n == 0 = n : f (m `div` n) n ns
    -- n is not a factor of m, start another iteration
    -- by moving to the next larger known prime 
    | otherwise = f m (head ns) (tail ns)

primes :: [Int]
-- skip even numbers because they are not prime
-- the anonymous function looks for numbers that are their own
-- smallest prime factor, which means that they are prime
-- (remember that the list is in increasing order)
primes = 2 : filter (\n-> head (primeFactors n) == n) [3,5..]

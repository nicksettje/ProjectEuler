module MathUtil where

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

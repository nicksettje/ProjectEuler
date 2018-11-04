module Euler4 where

import EulerProblem

question4 :: Question
question4 = "A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.\n\n\
\Find the largest palindrome made from the product of two 3-digit numbers.\n\n\
\Answer:\n"

-- Key Lesson:
-- recursive functions accumulate until a stop condition
-- guarded functions need otherwise statements
-- takeWhile is not filter
-- need to use foldr and accumulate the maximum
--
-- General Strategy:
-- Generate all product pairs in roughly decreasing order, then find the largest one
--
-- Remaining Questions:
-- When to use bool vs maybe?

answer4 :: Answer
answer4 = show $ foldr max 0 $ filter isPalindrome $ pairProducts 3 

-- pairProductLevels :: Integer -> [[Integer]]
-- pairProductLevels order = f 0 where
--   f level
--     | level == 2*order-1 =  [[0]] 
--     | otherwise = g 0 (level+1) where
--       g loffset offset
--         | loffset > offset = [] 
--         | otherwise = newpair : g (loffset+1) offset
--           where
--             base = 10^order-1  
--             newpair = ((base-loffset)*(base-offset+loffset))

pairProducts :: Integer -> [Integer]
pairProducts order = f 0 0 where 
  f loffset offset
    | loffset > offset = f 0 (offset+1)
    | offset == base-lowest = []
    | otherwise = (base-loffset)*(base-offset+loffset) : f (loffset+1) offset
      where
        base = 10^order-1  
        lowest = 10^(order-1)

isPalindrome :: Integer -> Bool 
isPalindrome m = mdigits == reverse mdigits
    where
        mdigits = toDigitList m

toDigitList :: Integer -> [Integer]
toDigitList = map (read . (:[])) . show

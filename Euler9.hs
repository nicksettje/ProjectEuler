module Euler9 where

import EulerProblem

question9 :: Question
question9 = "A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,\n\
\ a^2 + b^2 = c^2\n\
\For example, 32 + 42 = 9 + 16 = 25 = 52.\n\
\There exists exactly one Pythagorean triplet for which a + b + c = 1000.\n\
\Find the product abc.\n\n\
\Answer:\n"

answer9 :: Answer
answer9 = printMaybe $ maybeProduct $ pythagoreanTripletSearch 1000

printMaybe :: Maybe Integer -> String
printMaybe (Just a) = show a
printMaybe Nothing = "Nothing" 

maybeProduct :: Maybe [Integer] -> Maybe Integer
maybeProduct (Just l) = Just (foldr (*) 1 l)
maybeProduct Nothing = Nothing

pythagoreanTripletSearch :: Integer -> Maybe [Integer]
pythagoreanTripletSearch n
  | n < 6 = Nothing -- smallest set that fulfills a<b<c for a,b,c elem N is 1,2,3 (sum is 6)
  | otherwise = f 1 2 (n-3) where
    f a b c
      | isPythagoreanTriplet a b c = Just [a, b, c]
      | a >= b    = Nothing
      | b >= c    = f (a+1) (a+2) (n-2*a-3) -- a+1+a+2+n-2a-3 = n
      | otherwise = f a (b+1) (c-1)

isPythagoreanTriplet :: Integer -> Integer -> Integer -> Bool
isPythagoreanTriplet a b c = a^(2::Integer) + b^(2::Integer) == c^(2::Integer)

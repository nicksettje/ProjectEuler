main :: IO ()
main = do
    putStrLn description
    print (sum (map multipleOfThreeOrFive [0..999]))

description :: String
description = "Question: \n\n\
\If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.\n\n\
\Find the sum of all the multiples of 3 or 5 below 1000.\n\n\
\Answer:\n"

multipleOrZero :: Integer -> Integer -> Integer
multipleOrZero m n 
    | n `mod` m == 0 = n 
    | otherwise = 0

multipleOfThreeOrFive :: Integer -> Integer
multipleOfThreeOrFive n
    | multipleOrZero 3 n /= 0 = n
    | multipleOrZero 5 n /= 0 = n
    | otherwise = 0

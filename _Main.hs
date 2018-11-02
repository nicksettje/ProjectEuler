import Data.Map (lookup)
import EulerProblem 
import ProblemFiniteMap 

main :: IO ()
main = do
    putStrLn "Project Euler Solutions. What is the number of the problem?"
    number <- getLine
    putStrLn ("Problem " ++ number)
    let result = Data.Map.lookup number problems
    case result of
        Nothing -> putStrLn $ "Problem " ++ number ++ " does not exist or does not yet have a solution."
        Just a -> putStrLn $ (question a) ++ "\n" ++ (answer a)

module ProblemFiniteMap where

import Data.Map (fromList, Map)
import EulerProblem
import Euler1 (question1, answer1)
import Euler2 (question2, answer2)
import Euler3 (question3, answer3)
import Euler4 (question4, answer4)

problems :: Map [Char] Problem 
problems = fromList
    [
     ("1", Problem question1 answer1),
     ("2", Problem question2 answer2),
     ("3", Problem question3 answer3),
     ("4", Problem question4 answer4)
    ]

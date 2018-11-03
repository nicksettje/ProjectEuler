module ProblemFiniteMap where

import Data.Map (fromList)
import EulerProblem
import Euler1 (question1, answer1)
import Euler2 (question2, answer2)
import Euler3 (question3, answer3)

problems = fromList
    [
     ("1", Problem question1 answer1),
     ("2", Problem question2 answer2),
     ("3", Problem question3 answer3)
    ]

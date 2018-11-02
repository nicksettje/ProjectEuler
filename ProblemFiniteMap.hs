module ProblemFiniteMap where

import Data.Map (fromList)
import EulerProblem
import Euler2(question2, answer2)
import Euler1(question1, answer1)

problems = fromList
    [
     ("1", Problem question1 answer1),
     ("2", Problem question2 answer2)
    ]

module ProblemFiniteMap where

import Data.Map (fromList, Map)
import EulerProblem
import Euler1 (question1, answer1)
import Euler2 (question2, answer2)
import Euler3 (question3, answer3)
import Euler4 (question4, answer4)
import Euler5 (question5, answer5)
import Euler6 (question6, answer6)
import Euler7 (question7, answer7)

problems :: Map [Char] Problem 
problems = fromList
    [
     ("1", Problem question1 answer1),
     ("2", Problem question2 answer2),
     ("3", Problem question3 answer3),
     ("4", Problem question4 answer4),
     ("5", Problem question5 answer5),
     ("6", Problem question6 answer6),
     ("7", Problem question7 answer7)
    ]

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
import Euler8 (question8, answer8)
import Euler9 (question9, answer9)
import Euler10 (question10, answer10)
import Euler11 (question11, answer11)
import Euler12 (question12, answer12)
import Euler13 (question13, answer13)
import Euler14 (question14, answer14)

problems :: Map [Char] Problem 
problems = fromList
    [
     ("1", Problem question1 answer1),
     ("2", Problem question2 answer2),
     ("3", Problem question3 answer3),
     ("4", Problem question4 answer4),
     ("5", Problem question5 answer5),
     ("6", Problem question6 answer6),
     ("7", Problem question7 answer7),
     ("8", Problem question8 answer8),
     ("9", Problem question9 answer9),
     ("10", Problem question10 answer10),
     ("11", Problem question11 answer11),
     ("12", Problem question12 answer12),
     ("13", Problem question13 answer13),
     ("14", Problem question14 answer14)
    ]

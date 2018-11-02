module EulerProblem where

type Question = String
type Answer = String

data Problem = Problem Question Answer 

class EulerProblem a where
    question :: a -> String
    answer :: a -> String

instance EulerProblem Problem where
    question (Problem q _) = q
    answer (Problem _ a) = a

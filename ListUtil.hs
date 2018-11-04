module ListUtil where

idx :: Int -> [a] -> Maybe a
idx _ []       = Nothing
idx 0 (x : _)  = Just x
idx i (_ : xs) = idx (i - 1) xs

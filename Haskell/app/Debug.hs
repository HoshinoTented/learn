module Debug where

import Debug.Trace

debug :: Int -> Int -> Int
debug low high
    | low == high = low
    | otherwise = high + (debug low $ trace (show high) high - 1)
module Algorithm where

gcd' :: Int -> Int -> Int
gcd' a 0 = a
gcd' a b = if b > a then gcd' b a else gcd' (a `mod` b) b
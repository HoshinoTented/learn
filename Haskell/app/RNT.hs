{-# LANGUAGE RankNTypes #-}

module RNT where

fmap' :: (forall c. (c -> c)) -> (a, b) -> (a, b)
fmap' f (a, b) = (f a, f b)
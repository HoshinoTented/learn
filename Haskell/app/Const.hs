module Const where

newtype Const a b = Const { getConst :: a } deriving (Show)

instance Functor (Const a) where
    -- fmap :: (a -> b) -> Const a a -> Const a b
    fmap _ (Const v) = Const v
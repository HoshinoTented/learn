module Const where

import qualified Control.Applicative

newtype Const a b = Const { getConst :: a } deriving (Show)

instance Functor (Const a) where
    -- fmap :: (b -> c) -> Const a b -> Const a c
    fmap _ (Const v) = Const v
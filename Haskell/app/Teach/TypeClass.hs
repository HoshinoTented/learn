module Teach.TypeClass where

data Nat = Zero | Next Nat deriving (Show)

class Equal a where
    equals :: a -> a -> Bool

instance Equal Nat where
    equals Zero Zero = True
    equals (Next a) (Next b) = equals a b
    equals _ _ = False
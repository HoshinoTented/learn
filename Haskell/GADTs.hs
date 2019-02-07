{-# LANGUAGE GADTs #-}

module Learn.GADTs where

data OldList a = OldNil | OldCons a (OldList a)

data List a where
  IntNil :: List Int
  
  Nil :: List a
  Cons :: a -> List a -> List a

data Expr a where
  ILit :: Int -> Expr Int
  BLit :: Bool -> Expr Bool

  AddExpr :: Expr Int -> Expr Int -> Expr Int
  EqExpr :: (Eq a) => Expr a -> Expr a -> Expr Bool

{-
data StackLang where
  Begin :: StackLang
  Push :: Int -> StackLang -> StackLang
  Add :: StackLang -> StackLang

complet  = Add $ Push 1 $ Push 0 Begin
bug = Add $ Push 1 Begin
-}

data CZ
data CP n

data StackLang c where
  SBegin :: StackLang CZ
  SPush :: Int -> StackLang c -> StackLang (CP c)

  SAdd :: StackLang (CP (CP c)) -> StackLang (CP c)

complet = SAdd $ SPush 1 $ SPush 0 SBegin
-- bug = SAdd $ SPush 1 SBegin

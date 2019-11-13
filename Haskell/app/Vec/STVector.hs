{-# LANGUAGE RankNTypes, ScopedTypeVariables #-}

module Vec.STVector where

import Prelude hiding (init, concat)
import Control.Monad.State
import Data.Vector.Unboxed.Mutable (STVector, new)
import qualified Data.Vector.Unboxed.Mutable as MV
import Control.Monad.ST

type Index = Int
type Union s = STVector s Index
type SUnion s = StateT (Union s) (ST s)

findS :: forall s. Index -> SUnion s Int
findS x = do
    vec <- get

    lift $ do
        p <- MV.read vec x

        if p == x then return x else find p vec

concatS :: forall s. Index -> Index -> SUnion s ()
concatS x y = do
    vec <- get

    lift $ do
        x' <- find x vec
        y' <- find y vec

        MV.write vec x' y'

usS :: forall s. SUnion s ()
usS = do
    concatS 1 2
    concatS 3 4
    concatS 0 2
    concatS 4 5
    concatS 1 5

findingS :: Index -> Index
findingS x = runST $ do
    vec <- newWithFill 5 
    (_, us) <- runStateT usS vec

    MV.read us x

apply :: Monad m => m a -> (a -> m b) -> m a
apply v f = v >>= \x -> (f x >> return x)

find :: forall s. Index -> Union s -> ST s Index
find x vec = do
    p <- MV.read vec x

    if p == x then return x else find p vec >>= \x' -> (MV.write vec x x' >> return x')


concat :: forall s. Index -> Index -> Union s -> ST s ()
concat x y vec = do
    x' <- find x vec
    y' <- find y vec

    MV.write vec x' y'

newWithFill :: forall s. Int -> ST s (Union s)
newWithFill xs = do
    v <- new $ xs + 1

    forM_ [0..MV.length v - 1] (\a -> MV.write v a a)

    return v

us :: forall s. ST s (Union s)
us = do
    v <- newWithFill 5

    concat 1 2 v
    concat 3 4 v
    concat 0 2 v
    concat 4 5 v
    concat 1 5 v

    return v

finding :: Index -> Index
finding x = runST $ do
    us' <- us
    MV.read us' x

main :: IO ()
main = do
    forever $ do
        putStrLn "Which index do you want to find?"
        n <- read <$> getLine

        print $ findingS n

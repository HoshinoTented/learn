{-# LANGUAGE RankNTypes, ScopedTypeVariables #-}

module Vec.STVector where

import           Prelude                     hiding (init, concat)
import           Control.Monad.State
import           Data.Vector.Mutable                (STVector, new)
import qualified Data.Vector.Mutable         as MV
import           Control.Monad.ST

type Index = Int
type Union s = STVector s Index
type SUnion s = StateT (Union s) (ST s)
    
findS :: Index -> SUnion s Int
findS x = do
    vec <- get
    p <- MV.read vec x

    if p == x then return x else do
        x' <- findS p
        MV.write vec x x'

        return x'

concatS :: Index -> Index -> SUnion s ()
concatS x y = do
    vec <- get

    x' <- findS x
    y' <- findS y

    MV.write vec x' y'

usS :: SUnion s ()
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

find :: Index -> Union s -> ST s Index
find x vec = do
    p <- MV.read vec x

    if p == x then return x else do
        x' <- find p vec
        MV.write vec x x'

        return x'


concat :: Index -> Index -> Union s -> ST s ()
concat x y vec = do
    x' <- find x vec
    y' <- find y vec

    MV.write vec x' y'

newWithFill :: Int -> ST s (Union s)
newWithFill xs = do
    v <- new $ xs + 1

    forM_ [0..MV.length v - 1] (\a -> MV.write v a a)

    return v

fromList :: [a] -> ST s (STVector s a)
fromList xs = do
    vec <- MV.new $ length xs

    forM_ (zip [0..MV.length vec - 1] xs) (\(i, x) -> MV.write vec i x)

    return vec

us :: ST s (Union s)
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

getter :: STVector s a -> [Int] -> ST s a
getter vec [x] = MV.read vec x

setter :: STVector s a -> [Int] -> a -> ST s a
setter vec [x] = \v -> MV.write vec x v >> return v

likeC :: IO ()
likeC = print $ runST $ do
    vec <- fromList [0, 1, 2, 3, 4, 5]
    let v = getter vec

    (+) <$> v[5] <*> v[0]


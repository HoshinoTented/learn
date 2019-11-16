{-# LANGUAGE RankNTypes #-}

module STMonad where

import Control.Monad.ST
import Data.STRef

foo :: forall s. STRef s Int -> ST s ()
foo ref = do
    i <- readSTRef ref
    writeSTRef ref $ i + 1

bar :: forall s. ST s (STRef s Int)
bar = do
    r <- newSTRef 0

    foo r

    return r

(+=), (-=), (*=) :: Num a => forall s. STRef s a -> a -> ST s ()
ref += i = modifySTRef ref (+i)
ref -= i = modifySTRef ref (subtract i)
ref *= i = modifySTRef ref (*i)

num :: Int
num = runST $ do
    ref <- newSTRef 1

    ref += 2
    ref -= 1
    ref *= 3

    readSTRef ref
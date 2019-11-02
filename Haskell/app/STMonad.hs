{-# LANGUAGE RankNTypes #-}

module STMonad where

import Control.Monad.ST
import Data.STRef

foo :: (forall s. STRef s Int -> ST s ())
foo ref = do
    i <- readSTRef ref
    writeSTRef ref $ i + 1

bar :: (forall s. ST s (STRef s Int))
bar = do
    r <- newSTRef 0

    foo r

    return r
{-# LANGUAGE RankNTypes #-}

module STMonad where

import Control.Monad.ST
import Data.STRef

foo :: STRef s Int -> Int
foo ref = runST $ do
    i <- readSTRef ref

    return 1

bar :: Int
bar = runST $ do
    i <- newSTRef 0

    modifySTRef i (+1)

    readSTRef i
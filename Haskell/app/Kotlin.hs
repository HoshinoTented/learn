{-# LANGUAGE BangPatterns #-}

module Kotlin where

import Data.Function

-- fun <T> T.apply(block: T.() -> Unit): T
(.>) :: Monad m => a -> (a -> m b) -> m a
r .> f = do
    f r
    return r

main :: IO ()
main = do
    str <- "Hello world!" .> \str ->
        print str
    print str

    return ()
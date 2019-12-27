module Kotlin where

import Data.Function
import Control.Applicative

(?.) :: Maybe a -> (a -> b) -> Maybe b
(?.) = flip (<$>)

(?:) :: Maybe a -> Maybe a -> Maybe a
(?:) = (<|>)

-- fun <T> T.apply(block: T.() -> Unit): T
(|>) :: Monad m => a -> (a -> m b) -> m a
r |> f = do
    f r
    return r

main :: IO ()
main = do
    str <- "Hello world!" |> print
    print str

    print $ (Just 1)?.(+2)?.(+3) ?: Just 4

    return ()
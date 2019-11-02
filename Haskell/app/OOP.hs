module OOP where

import Prelude hiding ((.))

infixl 9 .

(.) :: a -> (a -> b) -> b
(.) = flip id

main :: IO ()
main = do
    print $ [1, 2, 3].head

    return ()
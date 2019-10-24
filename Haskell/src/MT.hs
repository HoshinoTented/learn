module MT where

import Control.Monad.State

push :: a -> StateT [a] Maybe ()
push v = do
    xs <- get
    put $ (v:xs)

pop :: StateT [a] Maybe a
pop = do
    v <- get

    undefined

main :: IO ()
main = do


    return ()
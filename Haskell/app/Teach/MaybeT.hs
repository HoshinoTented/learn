module Teach.MaybeT where

import Control.Monad.State
import Control.Monad.Trans.Maybe

push :: a -> MaybeT (State [a]) ()
push = modify . (:)

{-
MaybeT { runMaybeT :: m (Maybe a) }
runMaybeT $ MaybeT (State [a]) a :: s -> (Maybe a, s)

-}

pop :: MaybeT (State [a]) a
pop = do
    xs <- get

    case xs of
        [] -> MaybeT $ return Nothing
        (x:xs) -> put xs >> return x

stack :: MaybeT (State [Int]) ()
stack = do
    push 1
    v <- pop
    push $ v + 1
    v <- pop
    push $ v + 2
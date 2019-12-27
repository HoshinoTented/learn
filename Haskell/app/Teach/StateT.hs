{-# LANGUAGE ScopedTypeVariables, ConstraintKinds #-}

module Teach.StateT where

import Control.Monad.State
import Control.Monad.Trans

newtype MaybeT m a = MaybeT { runMaybeT :: m (Maybe a) }

dirtyPush :: a -> State [a] ()
dirtyPush i = modify (i:)

dirtyPop :: State [a] (Maybe a)
dirtyPop = do
    xs <- get

    case xs of
        [] -> return Nothing
        (x:xs) -> put xs >> (return $ Just x)

dirtyStack :: State [Int] (Maybe Int)
dirtyStack = do
    dirtyPush 1
    v <- dirtyPop

    case v of
        Nothing -> return Nothing
        Just i -> do 
            dirtyPush $ i + 1
            dirtyPop

push :: a -> StateT [a] Maybe ()
push i = modify (i:)

pop :: StateT [a] Maybe a
pop = do
    xs <- get

    case xs of
        [] -> StateT $ \_ -> Nothing
        (x:xs) -> put xs >> return x

stack :: StateT [Int] Maybe ()
stack = do
    push 1
    v <- pop

    push $ v + 1
    v <- pop

    push $ v + 2
{-# LANGUAGE FunctionalDependencies, MultiParamTypeClasses, FlexibleInstances #-}

module Teach.State where

import Control.Monad

newtype State s a = State { runState :: s -> (a, s) }

inc :: State Int ()
inc = State $ \s -> ((), s + 1)

incs :: State Int ()
incs = do
    inc
    inc
    inc

badInc :: Int -> ((), Int)
badInc i = ((), i + 1)

badIncs :: Int -> ((), Int)
badIncs i = let (_, i') = badInc i
                (_, i'') = badInc i'
                (_, i''') = badInc i'' in
                    ((), i''')

instance Functor (State s) where
    fmap f (State g) = State $ \s ->
        let (v, s') = g s in
            (f v, s')

instance Applicative (State s) where
    pure v = State $ \s -> (v, s)
    -- (State f) <*> (State g) = State $ \s ->
    --     let (f', s') = f s
    --         (g', s'') = g s' in
    --             (f' g', s'')
    (<*>) = ap

instance Monad (State s) where
    (State m) >>= f = State $ \s ->
        let (v, s') = m s 
            (State g) = f v in
                g s'

class (Monad m) => MonadState s m where
    get :: m s
    put :: s -> m ()
    state :: (s -> (a, s)) -> m a

instance MonadState s (State s) where
    get = State $ \s -> (s, s)
    put s = State $ \_ -> ((), s)
    state = State

push :: a -> State [a] ()
push i = do
    xs <- get
    put $ i:xs

push' :: a -> State [a] ()
push' i = State $ \s -> ((), i:s)

pop :: State [a] a
pop = do
    xs <- get
    put $ tail xs
    return $ head xs

pop' :: State [a] a
pop' = State $ \(x:xs) -> (x, xs)
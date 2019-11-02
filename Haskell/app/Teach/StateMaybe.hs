{-# LANGUAGE DeriveFunctor #-}

module Teach.StateMaybe where

import Control.Monad.State
import System.IO.Unsafe

push :: a -> State [a] ()
push = modify . (:)
-- 等价于
-- push i = State $ \s -> ((), i:s)

pop :: State [a] (Maybe a)
pop = do
    xs <- get

    case xs of
      [] -> return Nothing
      (x:xs) -> put xs >> return (Just x)

stack :: State [Int] (Maybe ())
stack = do
  push 1
  v <- pop
  xs <- get

  case v of
    Nothing -> return Nothing
    Just v' -> do
        push (v' + 1)
        v'' <- pop
        xs' <- get

        case v'' of
            Nothing -> return Nothing
            Just v''' -> do
                push $ v''' + 2

                return $ Just ()
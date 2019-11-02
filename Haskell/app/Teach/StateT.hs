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

data Result = Win | Wrong | Update (Int, Int)

badGuess :: Int -> State (Int, Int) (IO Int)
badGuess i = do
    (low, high) <- get
    return $ putStrLn $ "Please gusse a number between " ++ show low ++ " and " ++ show high ++ "."

    (guess :: IO Int) <- return $ read <$> getLine

    result <- return $ guess >>= \g ->
        if g == i 
            then putStrLn "You win!" >> return Win
            else if g < low || high < g
                then putStrLn "The number you guess is out of bounds!" >> return Wrong
                else return $ Update (if g < i
                    then (g, high)
                    else (low, g))

    

    return $ return 1
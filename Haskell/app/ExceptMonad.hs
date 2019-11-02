{-# LANGUAGE ConstraintKinds, FlexibleContexts #-}

module ExceptMonad where

import Control.Monad.Except
import Control.Monad.State

div' :: Integral i => i -> i -> Except String i
div' a 0 = throwError "Can not be zero"
div' a b = return $ a `div` b

-- type Stack s = StateT [s] (Except String)

-- push :: a -> Stack a ()
-- push i = modify (i:)

-- pop :: Stack a a
-- pop = do
--     xs <- get

--     case xs of
--         [] -> liftEither $ Left "Stack is empty"
--         (x:s) -> put s >> return x

type M s m = (MonadError String m, MonadState [s] m)
type StackSE s = StateT [s] (Except String)
type StackES s = ExceptT String (State [s])

push :: M a m => a -> m ()
push i = modify (i:)

pop :: M a m => m a
pop = do
  xs <- get
  case xs of
    [] -> throwError "Stack empty"
    x:s -> put s >> pure x

-- Guess Number :: Magic Number -> StateT Bound IO (Guess Count)
guessNumber :: Int -> StateT (Int, Int) IO Int
guessNumber num = do
  (low, high) <- get
  
  liftIO $ putStrLn $ "Please guess a number between " ++ show low ++ " and " ++ show high

  guess <- read <$> liftIO getLine

  if guess == num 
    then (liftIO $ putStrLn "You win!") >> return 1 
    else if guess < low || high < guess 
      then (liftIO $ putStrLn "Number out of bounds!") >> guessNumber num 
      else put (if guess < num then (guess, high) else (low, guess)) >> guessNumber num >>= return . (+1)
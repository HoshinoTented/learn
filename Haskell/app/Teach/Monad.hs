module Teach.Monad where

data Exp = ILit Int
    | Add Exp Exp
    | Div Exp Exp
    deriving (Show)

eval :: Exp -> Int
eval (ILit i) = i
eval (Add a b) = eval a + eval b
eval (Div a b) = eval a `div` eval b

safeEval :: Exp -> Maybe Int
safeEval (ILit i) = Just i
safeEval (Add a b) = case safeEval a of
                        Nothing -> Nothing
                        Just a' -> case safeEval b of
                            Nothing -> Nothing
                            Just b' -> Just $ a' + b'
safeEval (Div a b) = case safeEval a of
                        Nothing -> Nothing
                        Just a' -> case safeEval b of
                            Nothing -> Nothing
                            Just b' -> if b' == 0 then Nothing else Just $ a' `div` b'

safeEval (Add a b) = safeEval a `evalSeq` \a' ->
                     safeEval b `evalSeq` \b' -> Just $ a' + b'
safeEval (Div a b) = safeEval a `evalSeq` \a' ->
                     safeEval b `evalSeq` \b' -> if b' == 0 then Nothing else Just $ a' + b'

evalSeq :: Maybe Int -> (Int -> Maybe Int) -> Maybe Int
evalSeq Nothing _ = Nothing
evalSeq (Just i) f = f i

data Identity a = Identity { runIdentity :: a } deriving (Show)

instance Functor Identity where
    fmap f (Identity i) = Identity $ f i

instance Applicative Identity where
    pure = Identity
    (Identity f) <*> a = f <$> a

instance Monad Identity where
    (Identity i) >>= f = f i
    
data Option a = None | Some a deriving (Show)

instance Functor Option where
    fmap _ None = None
    fmap f (Some i) = Some $ f i

instance Applicative Option where
    pure = Some
    None <*> _ = None
    (Some f) <*> a = f <$> a

instance Monad Option where
    None >>= _ = None
    (Some a) >>= f = f a

guessNumber :: Int -> IO Int
guessNumber = flip guessing (0, 100)
    where
        guessing :: Int -> (Int, Int) -> IO Int
        guessing num (low, high) = (putStrLn $ "Please guess a number between " ++ show low ++ " and " ++ show high ++ ".") >>= \_ ->
            read <$> getLine >>= \gus ->
            if gus == num 
                then putStrLn "You win!" >> return 1
                else if gus < low || high < gus
                    then putStrLn "The number is out of bounds!" >> guessing num (low, high)
                    else if gus < num
                        then guessing num (gus, high) >>= \i -> return $ i + 1
                        else guessing num (low, gus) >>= \i -> return $ i + 1
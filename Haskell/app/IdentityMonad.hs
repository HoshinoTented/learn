module IdentityMonad where

import Control.Monad.Identity
import Control.Monad.ST
import Data.STRef

for' :: Monad m => (e -> m (e, Bool)) -> e -> m e
for' f env = do
        (e', c) <- f env

        if c 
            then for' f e'
            else return e'

foo :: Int
foo = fst . runIdentity $ for' (\(sum, i) -> return ((sum + i, i + 1), i + 1 <= 100)) (0, 1)

sum' :: Int
sum' = runST $ do
    sum <- newSTRef 0

    for' (\i -> do
        modifySTRef sum (+i)
        return (i + 1, i + 1 <= 100)
        ) 1

    readSTRef sum
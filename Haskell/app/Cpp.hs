module Cpp where

import           System.IO
import           Data.Typeable
import           Data.Maybe
import           Prelude                hiding ((>>), print, sum)
import           Data.IORef
import           Control.Monad          hiding ((>>))
import qualified Control.Monad          as M
import qualified Prelude
import           Control.Monad.Identity hiding ((>>))
import           Control.Monad.ST
import           Data.STRef
import           STMonad ((+=))

for' :: Monad m => e -> (e -> m (e, Bool)) -> m e
for' env f = do
        (e', c) <- f env

        if c
            then for' e' f
            else return e'

while :: Monad m => m Bool -> m () -> m ()
while cond block = do
    cond' <- cond

    if cond'
        then block M.>> while cond block
        else return ()

(<<) :: (Typeable s, Show s) => IO Handle -> s -> IO Handle
h << s = h >>= \h -> do
    hPutStr h $ if typeOf s == typeOf "" then fromJust $ cast s else show s

    return h

untilSpace :: IO String
untilSpace = do
    c <- getChar

    if c == ' ' || c == '\n' then return "" else (c:) <$> untilSpace

(>>) :: Read r => IO Handle -> IORef r -> IO Handle
h >> r = h >>= \h -> do
    str <- untilSpace

    writeIORef r $ read str

    return h

cout :: IO Handle
cout = return stdout

cin :: IO Handle
cin = return stdin

endl :: String
endl = "\n"

var = newIORef
vars xs = forM xs newIORef
get = readIORef
set = writeIORef
(^=) = set

sum' :: IORef Int -> IORef Int -> IO Int
sum' from to = do
    from' <- get from
    to' <- get to
    sum <- var 0
    i <- var from'

    while ((to'>=) <$> get i) $ do
        i' <- get i
        curSum <- get sum

        sum ^= (curSum + i')
        i  ^= (i' + 1)

    get sum

sum from to = if from == to
    then from
    else to + sum from (to - 1)

main :: IO ()
main = do
    [from, to] <- vars ([0, 0] :: [Int])
    cin >> from >> to
    from' <- get from
    to' <- get to
    sumResult <- return $ sum from' to'

    cout << sumResult << endl

    return ()


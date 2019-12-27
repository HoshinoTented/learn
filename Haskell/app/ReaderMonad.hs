module ReaderMonad where

import Control.Monad.Reader

readLen :: Reader [a] Int
readLen = do
    xs <- ask

    return $ length xs
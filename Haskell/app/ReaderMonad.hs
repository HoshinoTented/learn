module ReaderMonad where

import Control.Monad.Reader

readLen :: Reader [a] Int
readLen = reader $ \xs -> length xs
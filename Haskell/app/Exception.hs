module Exception where

import Control.Exception

data MyException = ThisException | ThatException deriving (Show)

instance Exception MyException
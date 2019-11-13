{-# LANGUAGE OverloadedStrings #-}

module Json where

import Data.Aeson
import Data.Maybe

data Obj = Obj Int deriving (Show)

instance FromJSON Obj where
    parseJSON = withObject "Obj" $ \v -> Obj 
        <$> v .: "a"

obj :: Object
obj = fromMaybe undefined $ decode "{\"a\":1}"
{-# LANGUAGE OverloadedStrings, ScopedTypeVariables, DeriveGeneric #-}

module Json where

import Data.Aeson
import Data.Aeson.Types
import Data.Maybe
import Data.Dynamic
import Data.Typeable
import GHC.Generics
import qualified Data.Text as T
import qualified Data.HashMap.Strict as M
import qualified Data.Vector as V

data Obj = Obj Int deriving (Show)

data Person = Person {
    name :: String,
    age :: Int
} deriving (Show, Generic)

instance FromJSON Person
instance ToJSON Person

instance FromJSON Obj where
    parseJSON = withObject "Obj" $ \v -> Obj 
        <$> v .: "a"

(!) :: (Typeable a) => Maybe Value -> a -> Maybe Value
(!) Nothing _ = Nothing
(!) (Just (Object obj)) k = cast k >>= flip M.lookup obj . T.pack
(!) (Just (Array vec)) k = cast k >>= (V.!?) vec

main :: Maybe Value
main = let obj = decode "{\"a\":{\"b\":[1, 2, 3]}}" in
    obj ! ("a" :: String) ! ("b" :: String) ! (2 :: Int)

foo :: Result Int
foo = flip parse (fromJust $ decode "{\"a\":1, \"b\":2}") $ \obj -> do
    a <- obj .: "a"
    b <- obj .: "b"

    return $ a + b

parse' :: Parser a -> Result a
parse' p = parse id p
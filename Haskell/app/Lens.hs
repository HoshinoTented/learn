{-# LANGUAGE TemplateHaskell #-}

module Lens where

import Control.Lens

data Point = Point {
    _posX :: Int,
    _posY :: Int
} deriving (Show)

makeLenses ''Point

head' :: Functor f => (a -> f a) -> [a] -> f [a]
head' f (x:xs) = (:xs) <$> f x

toString :: (Functor f, Show a, Read a) => (String -> f String) -> a -> f a
toString f v = read <$> (f $ show v)

foo :: String
foo = 1 ^. toString
{-# LANGUAGE TemplateHaskell #-}

module Lens where

import Control.Lens

data Point = Point {
    _posX :: Int,
    _posY :: Int
} deriving (Show)

makeLenses ''Point
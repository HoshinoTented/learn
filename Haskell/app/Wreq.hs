{-# LANGUAGE OverloadedStrings #-}

module Wreq where

import Control.Lens         hiding ((.=))
import Network.Wreq
import Data.Aeson

data A = A {
    a :: Int,
    b :: String
}

instance ToJSON A where
    toJSON (A a b) = object ["a" .= a, "b" .= b]

main :: IO ()
main = do
    resp <- postWith (defaults & header "1" .~ ["2"]) "https://httpbin.org/post" $ toJSON (A 1 "2")

    print $ resp ^. responseBody

    return ()
{-# OPTIONS_GHC -O2 #-}
{-# LANGUAGE Strict #-}

module OI where

import Data.IORef
import Data.Char
import qualified Data.Text as T
import qualified Data.Text.IO as TIO
import qualified Data.Vector.Unboxed.Mutable as MV
import Data.Vector.Unboxed.Mutable (IOVector)

-- Parse Int :: Source -> Count -> Result
parseInt :: Int -> String -> Int
parseInt n [] = n
parseInt n (char:str) = parseInt (n * 10 + (ord char - ord '0')) str

main :: IO ()
main = do
    vec <- MV.new 5 :: IO (IOVector Int)

    MV.modify vec (+1) 0    -- 对 vec 中下标为 0 的元素应用 (+1) 函数
    v <- MV.read vec 0      -- 读取 vec 中下标为 0 的元素
    print v

    return ()
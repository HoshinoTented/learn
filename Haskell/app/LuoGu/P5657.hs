module LuoGu.P5657 where

import Data.Word

forceGrayCode :: Word64 -> [String]
forceGrayCode 1 = ["0", "1"]
forceGrayCode n = map ('0':) last ++ map ('1':) (reverse last)
    where
        last = forceGrayCode (n - 1)

grayCode :: Word64 -> Word64 -> String
grayCode 1 0 = "0"
grayCode 1 1 = "1"
grayCode n c = if c < mid
        then '0' : grayCode (n - 1) c
        else '1' : grayCode (n - 1) (mid - 1 - (c - mid))
    where
        mid = 2 ^ (n - 1)

main :: IO ()
main = do
    [n, c] <- map read . words <$> getLine

    putStrLn $ grayCode n c
--    putStrLn $ forceGrayCode n !! fromIntegral c
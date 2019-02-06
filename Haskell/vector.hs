module Learn.Vector where

import qualified Data.Vector as V
import Data.Vector ((!))

-- Begin -> End -> Vector -> Target Value -> Index (Result)
binarySearch' :: (Eq a, Ord a) => Int -> Int -> V.Vector a -> a -> Int
binarySearch' begin end vec elem
  | begin == end = -1
  | value > elem = binarySearch' begin mid vec elem
  | value < elem = binarySearch' (mid + 1) end vec elem
  | otherwise = mid
  where
    mid = (begin + end) `div` 2
    value = vec ! mid

binarySearch :: (Eq a, Ord a) => V.Vector a -> a -> Int
binarySearch vec = binarySearch' 0 (V.length vec) vec

main :: IO ()
main = do
  vec <- return $ V.generate 10 id

  print $ binarySearch vec 5

  return ()

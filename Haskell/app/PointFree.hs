{-# LANGUAGE ScopedTypeVariables #-}

module PointFree where

import Control.Monad
import Data.Function

if' con a b = if con then a else b

mergeSort :: Ord a => [a] -> [a]
mergeSort = fix (ap (flip if' ([]) . null) . ap (if' =<< null . tail) . (. (splitAt =<< (`div` 2) . length)) . (`ap` snd) . (. fst) . (flip =<< (((.) . merge) .)))
    where
        merge :: Ord a => [a] -> [a] -> [a]
        merge = fix (ap (ap . if' . null) . ap (ap . flip (if' . null)) . ap (ap . (ap .) . ap (ap . (if' .) . (. head) . (<=) . head) . ap ((.) . (:) . head) . (. tail)) ((liftM2 (:) head .) . flip flip tail . ((.) .)))

printList :: (Show a) => [a] -> IO ()
printList = flip forM_ (putStr . ((++ " ") . show))

main :: IO ()
main = getLine >>= (const ((map read . words <$> getLine) :: IO [Int])) >>= (printList . mergeSort)
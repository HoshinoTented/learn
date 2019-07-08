module Codewars.BuildTower where

maxLength :: Int -> Int
maxLength i = i * 2 - 1

indent :: Int -> Int -> Int
indent max i = ((maxLength max `div` 2) - (i - 1))

fill :: Int -> Int -> Int
fill max i = maxLength max - 2 * (indent max i)

buildTower'' :: Int -> Int -> String
buildTower'' max i = indent' ++ fill' ++ indent'
  where
    indent' = replicate (indent max i) ' '
    fill' = replicate (fill max i) '*'

buildTower' :: Int -> Int -> [String]
buildTower' i max
  | max == i = [buildTower'' max i]
  | otherwise = (buildTower'' max i) : (buildTower' (i + 1) max)

buildTower :: Int -> [String]
buildTower = buildTower' 1

module DataType where

data Day = Sun | Mon | Tue | Wed | Thu | Fri | Sat deriving (Show)
data People = People {
  name :: String,
  age :: Int
} deriving (Show)

getName :: People -> String
getName (People name age) = name

isNull :: Maybe a -> Bool
isNull Nothing = True
isNull (Just _) = False

data Tree a = Leaf { value :: a }
    | Node { left :: Tree a, value :: a, right :: Tree a }
    deriving (Show)

pre :: Tree a -> [a]
pre (Leaf v) = [v]
pre (Node left v right) = pre left ++ [v] ++ pre right

newtype QAQ = QAQ Int deriving (Show)

module SegmentTree where
    data Tree a = Tree {
        lChild :: Maybe (Tree a),
        value :: a,
        rChild :: Maybe (Tree a)
    }

    type SegTree = Tree
    type Range = (Int, Int)

    isIn :: Int -> Range -> Bool
    isIn i (l, r) = l <= i && i <= r

    instance (Show a) => Show (Tree a) where
        show (Tree Nothing v Nothing) = showString "Leaf {value = " . shows v $ "}"
        show (Tree l v r) = showString "Tree {lChild = " . shows l . showString ", value = " . shows v . showString ", rChild = " . shows r $ "}"

    indent :: Int -> ShowS
    indent i = showString (replicate i ' ')

    end :: String
    end = "\n"

    new :: (Num a) => [a] -> Maybe (SegTree a)
    new [] = Nothing
    new [x] = Just $ Tree Nothing x Nothing
    new xs = let
        newL = new l
        newR = new r in
            Just $ Tree newL (maybe 0 value newL + maybe 0 value newR) newR
        where
            (l, r) = splitAt (length xs `div` 2) xs

    rangeSum :: (Num a) => (Int, Int) -> SegTree a -> a
    rangeSum = undefined
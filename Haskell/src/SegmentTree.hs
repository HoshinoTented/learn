module SegmentTree (Tree (..), new, rangeSum) where
    import Data.Maybe

    type Range = (Int, Int)

    data Tree a = Tree {
        lChild :: Maybe (Tree a),
        value :: a,
        rChild :: Maybe (Tree a),
        range :: Range
    }

    isIn :: Int -> Range -> Bool
    isIn i (l, r) = l <= i && i <= r

    instance (Show a) => Show (Tree a) where
        show (Tree Nothing v Nothing _) = showString "Leaf {value = " . shows v $ "}"
        show (Tree l v r rg) = showString "Tree {range = " . shows rg . showString ", lChild = " . shows l . showString ", value = " . shows v . showString ", rChild = " . shows r $ "}"

    indent :: Int -> ShowS
    indent i = showString (replicate i ' ')

    end :: String
    end = "\n"

    new :: (Num a) => [a] -> Maybe (Tree a)
    new xs = new' (0, length xs - 1) xs

    new' :: (Num a) => Range -> [a] -> Maybe (Tree a)
    new' _ [] = Nothing
    new' rg [x] = Just $ Tree Nothing x Nothing rg
    new' rg xs = let
        newL = new' (fst rg, fst rg + mid - 1) l
        newR = new' (fst rg + mid, snd rg) r in
            Just $ Tree newL (maybe 0 value newL + maybe 0 value newR) newR rg
        where
            len = length xs
            mid = len `div` 2
            (l, r) = splitAt mid xs

    rangeSum :: (Num a) => Range -> Tree a -> a
    rangeSum _ (Tree Nothing v Nothing _) = v
    rangeSum rg t = if range t == rg then value t else lS + rS
        where
            lS = fromMaybe 0 $ lChild t >>= \l -> 
                return $ if fst rg `isIn` range l then rangeSum (fst rg, min (snd $ range l) (snd rg)) l else 0
            rS = fromMaybe 0 $ rChild t >>= \r -> 
                return $ if snd rg `isIn` range r then rangeSum (max (fst $ range r) (fst rg), snd rg) r else 0
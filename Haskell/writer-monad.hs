module Learn.WriterMonad where
    import Control.Monad.Writer

    left :: Int -> Writer String Int
    left x = writer (x-1, "move left\n")

    right :: Int -> Writer String Int
    right x = writer (x+1, "move right\n")

    move :: Int -> Writer String Int
    move b = do
        x <- left b
        y <- left x

        return y

    indent :: Int -> ShowS
    indent i = showString (replicate (i * 4) ' ')

    end :: String
    end = "\n"
    
    merge :: [Int] -> [Int] -> [Int]
    merge xs [] = xs
    merge [] ys = ys
    merge (x:xs) (y:ys)
        | x <= y = x : merge xs (y:ys)
        | otherwise = y : merge (x:xs) ys

    -- mergeSort :: Stack Depth -> List -> Writer Monad
    mergeSort :: Int -> [Int] -> Writer String [Int]
    mergeSort _ [] = return []
    mergeSort _ xs@[_] = return xs
    mergeSort i xs = do
        tell $ indent i $ showString "mergeSort: " $ shows xs $ end
        
        let (f, s) = splitAt (length xs `div` 2) xs
        tell $ indent (i + 1) $ showString "merge: " $ shows f $ showChar ' ' $ shows s $ end

        w <- liftM2 merge (mergeSort (i + 2) f) (mergeSort (i + 2) s)
        tell $ indent (i + 1) $ showString "merged: " $ shows w $ end

        return w
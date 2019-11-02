module AdjList where

import Prelude hiding (concat)
import qualified Data.Vector.Mutable as M

data Node a = Node {
    index :: Int,
    value :: a,
    adja :: [Int]
}
    
type AdjList a = M.IOVector (Node a)
        
instance (Show a) => Show (Node a) where
    show (Node i v xs) = shows i . showChar ' ' . shows v . showChar ' ' $ show xs

concat :: Int -> Node a -> Node a
concat = concats . (:[])

concats :: [Int] -> Node a -> Node a
concats i (Node ix v xs) = Node ix v (i ++ xs)

repeatDoM :: (Monad m) => Int -> (Int -> m a) -> m a
repeatDoM 1 f = f 1
repeatDoM i f = f i >> repeatDoM (i - 1) f

concatNode :: AdjList () -> IO ()
concatNode v = do
    xs <- (map read . words) <$> getLine :: IO [Int]

    if length xs == 1 then return () else
        let [ix, tg] = xs in M.modify v (concat tg) ix >> (M.modify v (concat ix) tg) >> (concatNode v)

dfs :: M.IOVector Bool -> AdjList () -> Int -> IO ()
dfs vis v i = do
    visited <- M.read vis i
    if visited then return () else do
        node <- M.read v i

        M.write vis i True

        print node
        foldr (\i' m -> m >> (dfs vis v i')) (return ()) (adja node)


newGraph :: IO (AdjList ())
newGraph = do
    n <- read <$> getLine :: IO Int
    g <- M.new n

    repeatDoM n (\v -> let i = n - v in M.write g i (Node i () []))

    return g

main :: IO ()
main = do
    g <- newGraph
    len <- return $ M.length g
    concatNode g

    -- repeatDoM len $ \i -> do
    --     v <- M.read g $ len - i
    --     print v

    visited <- M.new len
    M.set visited False

    dfs visited g 0

    return ()
module Learn.MutableVector where

import qualified Data.Vector as V
import qualified Data.Vector.Mutable as M

fill :: M.IOVector a -> (Int -> a) -> IO ()
fill vec f = foldr (\x m -> m >>= (const $ M.write vec x $ f x)) (return ()) [0..M.length vec - 1]

main :: IO ()
main = do
  vec <- M.new 5

--  M.set vec 9
  fill vec $ const 9

  cvec <- V.freeze vec

  print cvec
  
  return ()

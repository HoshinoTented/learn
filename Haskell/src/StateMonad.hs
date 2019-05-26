module StateMonad where
import Control.Monad.State

data Tree a =
    Leaf a
    | Node (Tree a) a (Tree a)
    deriving (Show, Eq)

labelTree :: Tree a -> Tree (a, Int)
labelTree = fst . labelTree' 0

labelTree' :: Int -> Tree a -> (Tree (a, Int), Int)
labelTree' n (Leaf a) = (Leaf (a, n), n + 1)
labelTree' n (Node l v r) = let
    (cn, n') = ((v, n), (n + 1))
    (ln, n'') = labelTree' n' l
    (rn, n''') = labelTree' n'' r in
        (Node ln cn rn, n''')

inc :: State Int Int
inc = state $ \x -> (x, x + 1)

labelTreeS :: Tree a -> State Int (Tree (a, Int))
-- labelTreeS (Leaf v) = do
--     i <- inc
--     return $ Leaf (v, i)
-- labelTreeS (Node l v r) = do
--     i <- inc
--     ln <- labelTreeS l
--     rn <- labelTreeS r

--     return $ Node ln (v, i) rn
labelTreeS (Leaf v) = inc >>= (\i -> return $ Leaf (v, i))
labelTreeS (Node l v r) = inc >>= \i ->
    labelTreeS l >>= \ln ->
        labelTreeS r >>= \rn ->
            return $ Node ln (v, i) rn

push :: a -> State [a] ()
push x = state $ \xs -> ((), x:xs)

pop :: State [a] a
pop = state $ \(x:xs) -> (x, xs)

peek :: State [a] a
peek = state $ \x -> (head x, x)

stack :: State [Int] ()
stack = do
    push 5
    v <- pop
    push (v + 1)
    v <- pop
    push (v + 2)
module StateMonad where
import Control.Monad.State

data Tree a =
    Leaf a
    | Node (Tree a) a (Tree a)
    deriving (Show, Eq)

inc :: State Int Int
inc = state $ \x -> (x, x + 1)

dfs :: Tree a -> State Int (Tree (a, Int))
dfs (Leaf v) = do
    i <- inc
    return $ Leaf (v, i)
dfs (Node l v r) = do
    i <- inc
    left <- dfs l
    right <- dfs r
    return $ Node left (v, i) right

push' :: a -> [a] -> ([a], ())
push' x xs = (x:xs, ())

pop' :: [a] -> ([a], a)
pop' (x:xs) = (xs, x)

peek' :: [a] -> ([a], a)
peek' (x:xs) = ((x:xs), x)

stack':: (Num a) => ([a], ())
stack' = let s = [] in
    let (s', _) = push' 5 s in
        let (s'', v) = pop' s' in
            let (s''', _) = push' (v + 1) s'' in
                let (s'''', v) = pop' s''' in
                    push' (v + 2) s''''

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

sum' :: Int -> State Int Int
sum' max = do
    s <- inc

    if s == max then return s else sum' max >>= (return . (+s))
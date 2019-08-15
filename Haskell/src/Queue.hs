module Queue where

-- Queue Output Input
data Queue a = Queue [a] [a]

instance (Show a) => Show (Queue a) where
    show (Queue o i) = show $ o ++ reverse i

front :: Queue a -> a
front (Queue [] xs) = last xs
front (Queue xs _) = head xs

push :: Queue a -> a -> Queue a
push (Queue o i) v = Queue o (v:i)

pop :: Queue a -> Queue a
pop (Queue [] []) = error "empty queue"
pop (Queue [] xs) = pop $ Queue (reverse xs) []
pop (Queue (_:xs) ys) = Queue xs ys

fromList :: [a] -> Queue a
fromList xs = Queue xs []

main :: IO ()
main = do
    q <- return $ fromList [1, 2, 3]

    print $ q
module ParseBracket where

newtype Node = Node [Node]



parse :: String -> Node
parse = undefined
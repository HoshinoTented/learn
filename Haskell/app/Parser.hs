module Parser where

newtype Parser a = Parser { runParser :: String -> Maybe (a, String) }

instance Functor Parser where
  fmap f p = Parser $ \str ->
    case runParser p str of
      Just (a, s) -> Just (f a, s)
      Nothing -> Nothing

instance Applicative Parser where
  pure a = Parser (\str -> Just (a, str))
  f <*> a = Parser $ \str ->
    case runParser f str of
      Nothing -> Nothing
      Just (ab, s) ->
        case runParser a s of
          Nothing -> Nothing
          Just (ac, ss) -> Just (ab ac, ss)

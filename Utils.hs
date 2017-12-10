{-# LANGUAGE RecordWildCards #-}
module Utils where

import           Text.Parsec
import           Text.Parsec.Char
import           Text.Parsec.String

data Pos = Pos
         { x :: Float
         , y :: Float
         }

data Write = WriteT Pos String
           | WriteP Pos FilePath
           | FontChosen Pos String

-- (f,f), [T|P]:xxx
cmd :: Parser Write
cmd = do
    char '('
    many space
    x <- read <$> many (digit <|> char '.')
    many space
    char ','
    many space
    y <- read <$> many (digit <|> char '.')
    many space
    char ')'
    many space
    char ','
    many space
    t <- anyChar
    char ':'
    s <- many1 anyChar
    case t of
      'T' -> pure $ WriteT Pos{..} s
      'P' -> pure $ WriteP Pos{..} s
      'F' -> pure $ FontChosen Pos{..} s

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

float :: Parser Float
float = do
    x <- digit
    xs <- many $ (digit <|> char '.')
    pure $ read (x:xs)

pos :: Parser Pos
pos = do
  char '('
  x <- skipSpace float
  skipSpace $ char ','
  y <- skipSpace float
  skipSpace $ char ')'
  return $ Pos{..}

skipSpace :: Parser a -> Parser a
skipSpace p = do
    x <- p
    many space
    pure x

-- (f,f), [T|P]:xxx
cmd :: Parser Write
cmd = do
    position <- skipSpace pos
    skipSpace $ char ','
    t <- skipSpace $ anyChar
    char ':'
    s <- many1 anyChar
    case t of
      'T' -> pure $ WriteT position s
      'P' -> pure $ WriteP position s
      'F' -> pure $ FontChosen position s

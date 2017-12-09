module Main (main) where

import           Graphics.PDF.LibHaru
import           Graphics.PDF.LibHaru.Page
import           Graphics.PDF.LibHaru.Utils

main :: IO ()
main = do
    pdf <- new error_handler
    page <- addPage pdf
    free pdf

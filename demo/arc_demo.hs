module Main (main) where

import           Graphics.PDF.LibHaru
import           Graphics.PDF.LibHaru.Page
import           Graphics.PDF.LibHaru.Utils

main :: IO ()
main = do
    pdf <- new error_handler
    page <- addPage pdf
    setHeight page 220
    setWidth page 200
    printGrid pdf page
    saveToFile pdf "arc_demo.pdf"
    free pdf

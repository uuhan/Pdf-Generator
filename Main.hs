module Main where

import           Graphics.PDF.LibHaru
import qualified Graphics.PDF.LibHaru.Page  as Page
import           Graphics.PDF.LibHaru.Utils

main :: IO ()
main = do
    doc <- new error_handler
    page <- addPage doc
    font <- getFont doc "Helvetica"
    Page.setWidth page 220
    Page.setHeight page 200
    saveToFile doc "test.pdf"
    return ()

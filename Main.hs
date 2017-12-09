module Main where

import           Foreign.Ptr
import           Graphics.PDF.LibHaru
import qualified Graphics.PDF.LibHaru.Page  as Page
import           Graphics.PDF.LibHaru.Types
import           Graphics.PDF.LibHaru.Utils

main :: IO ()
main = do
    doc <- new handler
    page <- addPage doc
    font <- getFont doc "Helvetica" nullPtr
    Page.setWidth page 220
    Page.setHeight page 200
    saveToFile doc "test.pdf"
    return ()

foreign import ccall unsafe "utils.h &error_handler"
  handler :: ErrorHandler

module Main (main) where

import           Graphics.PDF.LibHaru
import           Graphics.PDF.LibHaru.Page
import           Graphics.PDF.LibHaru.Types
import           Graphics.PDF.LibHaru.Utils

import           Foreign.Ptr

main :: IO ()
main = do
    pdf <- newEx error_handler (AllocFunc nullFunPtr) (FreeFunc nullFunPtr) 0
    page <- addPage pdf
    setHeight page 400
    setWidth page 200
    saveToFile pdf "encoding_list.pdf"
    free pdf
    return ()

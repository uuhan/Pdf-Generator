module Main (main) where

import           Graphics.PDF.LibHaru
import           Graphics.PDF.LibHaru.Objects
import           Graphics.PDF.LibHaru.Page
import           Graphics.PDF.LibHaru.Types
import           Graphics.PDF.LibHaru.Utils

import           Foreign.Ptr

text :: String
text = "Thies is an encrypted pdf document."

owner, user :: String
owner = "abc123"
user  = "123abc"

main :: IO ()
main = do
    pdf <- new error_handler
    font <- getFont pdf "Helvetica" nullPtr
    page <- addPage pdf
    setSize page PageSizeB5 PageLandscape
    beginText page
    setFontAndSize page font 20
    tw <- textWidth page text
    moveTextPos page ((getWidth page - tw) / 2) ((getHeight page - 20) / 2)
    showText page text
    endText page
    setPassword pdf owner user
    saveToFile pdf "encryption.pdf"
    free pdf

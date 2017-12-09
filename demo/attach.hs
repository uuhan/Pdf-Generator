module Main (main) where

import           Foreign.Ptr
import           Graphics.PDF.LibHaru
import           Graphics.PDF.LibHaru.Page
import           Graphics.PDF.LibHaru.Types
import           Graphics.PDF.LibHaru.Utils

main :: IO ()
main = do
    pdf <- new error_handler
    page <- addPage pdf
    font <- getFont pdf "Helvetica" nullPtr
    setSize page PageSizeLetter PagePortrait

    beginText page
    setFontAndSize page font 20
    tw <- textWidth page text
    moveTextPos page ((getWidth page - 20) / 2) ((getHeight page - 20) / 2)
    showText page text
    endText page
    saveToFile pdf "attach.pdf"
    free pdf

text :: String
text = "There is an attach in this PDF"

module Main (main) where

import           Graphics.PDF.LibHaru
import           Graphics.PDF.LibHaru.Page
import           Graphics.PDF.LibHaru.Utils

main :: IO ()
main = do
    pdf <- new error_handler
    setCompressionMode pdf 0x0F
    font <- getFont pdf "Helvetica"
    -- page <- addPage pdf
    -- setWidth page 550
    -- setHeight page 500
--     dst <- createDestination page
--     destinationSetXYZ dst 0 (getHeight page) 1
--     setOpenAction pdf dst
--     beginText page
--     setFontAndSize page font 20
--     moveTextPos page 220 $ (getHeight page) - 70
--     showText page "ImageDemo"
--     endText page

--     image1 <- loadPngImageFromFile pdf "pngsuite/basn3p02.png"
--     setLineWidth page 0.5
--
--     let x = 100.0
--         y = realToFrac $ getHeight page - 150
--         iw = realToFrac $ imageGetWidth image1
--         ih = realToFrac $ imageGetHeight image1
--
--     drawImage page image1 x y iw ih
--     showDescription page x y "Color Mask"
--     saveToFile pdf "image_demo.pdf"
    free pdf
    return ()

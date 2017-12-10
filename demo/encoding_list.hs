module Main (main) where

import           Graphics.PDF.LibHaru
import           Graphics.PDF.LibHaru.Encoder
import           Graphics.PDF.LibHaru.Objects
import           Graphics.PDF.LibHaru.Outline
import           Graphics.PDF.LibHaru.Page
import           Graphics.PDF.LibHaru.Types
import           Graphics.PDF.LibHaru.Utils

import           Control.Monad                (forM_, (>=>))
import           Foreign.C.String
import           Foreign.Ptr

main :: IO ()
main = do
    pdf <- newEx error_handler (AllocFunc nullFunPtr) (FreeFunc nullFunPtr) 0
    setCompressionMode pdf 0x0F
    setPageMode pdf PageModeUseOutline
    font <- getFont pdf "Helvetica" nullPtr
    font_name <- loadType1FontFromFile pdf "type1/a010013l.afm" "type1/a010013l.pfb"
    root <- createOutline pdf (Dict nullPtr) "Encoding list" (Encoder nullPtr)
    setOpened root True
    -- loop
    forM_ encodings $ \enc -> do
      page <- addPage pdf
      setWidth page 420
      setHeight page 400
      outline <- createOutline pdf root enc (Encoder nullPtr)
      dst <- createDestination page
      destinationSetXYZ dst 0 (getHeight page) 1
      setDestination outline dst
      setFontAndSize page font 15
      drawGraph page
      beginText page
      setFontAndSize page font 20
      moveTextPos page 40 (400 - 50)
      showText page enc
      showText page " Encoding"
      endText page
      font2 <- case enc of
                 "Symbol-Set"       -> getFont pdf "Symbol" nullPtr
                 "ZapfDingbats-Set" -> getFont pdf "ZapfDingbats" nullPtr
                 otherwise          -> withCAString enc $ getFont pdf font_name

      setFontAndSize page font2 14
      drawFonts page

    saveToFile pdf "encoding_list.pdf"
    free pdf

encodings :: [String]
encodings =
    [ "StandardEncoding"
    , "MacRomanEncoding"
    , "WinAnsiEncoding"
    , "ISO8859-2"
    , "ISO8859-3"
    , "ISO8859-4"
    , "ISO8859-5"
    , "ISO8859-9"
    , "ISO8859-10"
    , "ISO8859-13"
    , "ISO8859-14"
    , "ISO8859-15"
    , "ISO8859-16"
    , "CP1250"
    , "CP1251"
    , "CP1252"
    , "CP1254"
    , "CP1257"
    , "KOI8-R"
    , "Symbol-Set"
    , "ZapfDingbats-Set"
    ]

foreign import ccall unsafe "utils.h draw_graph"
  drawGraph :: Page -> IO ()
foreign import ccall unsafe "utils.h draw_fonts"
  drawFonts :: Page -> IO ()

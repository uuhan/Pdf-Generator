{-# LANGUAGE LambdaCase      #-}
{-# LANGUAGE RecordWildCards #-}
module Main where

import           Foreign.Ptr
import           Graphics.PDF.LibHaru
import           Graphics.PDF.LibHaru.Doc
import           Graphics.PDF.LibHaru.Font
import           Graphics.PDF.LibHaru.Objects
import           Graphics.PDF.LibHaru.Page
import           Graphics.PDF.LibHaru.Types
import           Graphics.PDF.LibHaru.Utils

import           Control.Monad
import           Data.Either
import           Foreign.Ptr
import           System.Environment           (getArgs)
import           System.Exit
import           Text.Parsec
import           Utils

main :: IO ()
main = do
    args <- getArgs
    unless (length args /= 0) $ do
      putStrLn "HsPDF <指令文件>"
      exitFailure
    strings <- lines <$> (readFile $ args !! 0)
    let cmds = rights $ map (\s -> parse cmd "" s) strings
        fontChosen = filter (\case FontChosen _ _ -> True
                                   _ -> False)
                            $ cmds
    pdf <- new error_handler
    font <- case fontChosen of
              []                    -> getFont pdf "Helvetica" nullPtr
              ((FontChosen _ f):xs) -> getFont pdf f nullPtr
    page <- addPage pdf
    setSize page PageSizeA4 PageLandscape

    -- loop cmd
    forM_ cmds $ \cmd -> write cmd page font pdf

    saveToFile pdf "demo.pdf"
    free pdf

write (WriteT p s) = text p s
write (WriteP p s) = picture p s

text :: Pos -> String -> Page -> Font -> Doc -> IO ()
text Pos{..} string page font _ = do
    beginText page
    setFontAndSize page font 20
    moveTextPos page x y
    showText page string
    endText page
    return ()

picture :: Pos -> FilePath -> Page -> Font -> Doc -> IO ()
picture Pos{..} file page _ pdf = do
    image <- loadPngImageFromFile pdf file
    let iw = realToFrac $ imageGetWidth image
        ih = realToFrac $ imageGetHeight image
    drawImage page image x y iw ih
    return ()

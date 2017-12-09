module Graphics.PDF.LibHaru.Utils where

import           Graphics.PDF.LibHaru.Doc
import           Graphics.PDF.LibHaru.Objects
import           Graphics.PDF.LibHaru.Types

foreign import ccall unsafe "utils.h &error_handler"
  error_handler :: ErrorHandler

foreign import ccall unsafe "utils.h print_grid"
  printGrid :: Doc -> Page -> IO ()

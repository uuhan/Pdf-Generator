module Graphics.PDF.LibHaru.Utils where

import           Graphics.PDF.LibHaru.Types

foreign import ccall unsafe "utils.h &error_handler"
  error_handler :: ErrorHandler

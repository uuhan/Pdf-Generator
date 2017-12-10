module Graphics.PDF.LibHaru.Internal where

import           Foreign.Marshal.Utils
import           Foreign.Ptr
import           Foreign.Storable

withCast :: Storable a => a -> (Ptr () -> IO b) -> IO b
withCast a h = with a $ \ptr -> do
  h $ castPtr ptr


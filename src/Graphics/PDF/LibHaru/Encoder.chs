module Graphics.PDF.LibHaru.Encoder where

import Foreign.Ptr
import Foreign.C.Types
import Foreign.C.String
import Foreign.Storable
import Foreign.Marshal.Alloc

import Data.Word (Word32, Word16)

{#import Graphics.PDF.LibHaru.Types#}

#include "hpdf.h"
#include "hpdf_encoder.h"

{#context prefix = "HPDF_Encoder"#}

{#pointer HPDF_Encoder as Encoder newtype#}

{# fun unsafe GetType as ^
  {
    `Encoder'
  } -> `EncoderType'
#}

{# fun unsafe GetByteType as ^
  {
    `Encoder', `String', `Word32'
  } -> `ByteType'
#}

{# fun unsafe GetUnicode as ^
  {
    `Encoder', `Word32'
  } -> `Word16'
#}

{# fun unsafe GetWritingMode as ^
  {
    `Encoder'
  } -> `WritingMode'
#}

module Graphics.PDF.LibHaru.Annotation.LinkAnnot where

import Foreign.Ptr
import Foreign.C.Types
import Foreign.C.String
import Foreign.Storable
import Foreign.Marshal.Alloc

import Data.Word (Word16)

{#import Graphics.PDF.LibHaru.Types#}
{#import Graphics.PDF.LibHaru.Objects#}
{#import Graphics.PDF.LibHaru.Error#}

#include "hpdf.h"

{#context prefix = "HPDF_LinkAnnot"#}

{# fun unsafe SetHighlightMode as ^
  {
    id `Annotation', `AnnotHighlightMode'
  } -> `ErrorCode'
#}

{# fun unsafe SetBorderStyle as ^
  {
    id `Annotation', `Float', `Word16', `Word16'
  } -> `ErrorCode'
#}

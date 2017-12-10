module Graphics.PDF.LibHaru.Annotation.TextAnnot where

import Foreign.Ptr
import Foreign.C.Types
import Foreign.C.String
import Foreign.Storable
import Foreign.Marshal.Alloc

import Data.Word (Word64)

{#import Graphics.PDF.LibHaru.Types#}
{#import Graphics.PDF.LibHaru.Objects#}

#include "hpdf.h"

{#context prefix = "HPDF_TextAnnot"#}

{# fun unsafe SetIcon as ^
  {
    id `Annotation', `AnnotIcon'
  } -> `Word64'
#}

{# fun unsafe SetOpened as ^
  {
    id `Annotation', `Bool'
  } -> `Word64'
#}

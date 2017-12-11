module Graphics.PDF.LibHaru.Annotation.TextAnnot where

import Foreign.Ptr
import Foreign.C.Types
import Foreign.C.String
import Foreign.Storable
import Foreign.Marshal.Alloc

{#import Graphics.PDF.LibHaru.Types#}
{#import Graphics.PDF.LibHaru.Objects#}
{#import Graphics.PDF.LibHaru.Error#}

#include "hpdf.h"

{#context prefix = "HPDF_TextAnnot"#}

{# fun unsafe SetIcon as ^
  {
    id `Annotation', `AnnotIcon'
  } -> `ErrorCode'
#}

{# fun unsafe SetOpened as ^
  {
    id `Annotation', `Bool'
  } -> `ErrorCode'
#}

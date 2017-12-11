module Graphics.PDF.LibHaru.Annotation.ProjectionAnnot where

import Foreign.Ptr
import Foreign.C.Types
import Foreign.C.String
import Foreign.Storable
import Foreign.Marshal.Alloc

import Graphics.PDF.LibHaru.Internal (withCast)

{#import Graphics.PDF.LibHaru.Types#}
{#import Graphics.PDF.LibHaru.Objects#}
{#import Graphics.PDF.LibHaru.Error#}

#include "hpdf.h"

{#context prefix = "HPDF_ProjectionAnnot"#}

{# fun unsafe SetExData as ^
  {
    id `Annotation', id `ExData'
  } -> `ErrorCode'
#}

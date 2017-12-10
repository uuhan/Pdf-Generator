module Graphics.PDF.LibHaru.Annotation.ProjectionAnnot where

import Foreign.Ptr
import Foreign.C.Types
import Foreign.C.String
import Foreign.Storable
import Foreign.Marshal.Alloc

import Data.Word (Word64)
import Graphics.PDF.LibHaru.Internal (withCast)

{#import Graphics.PDF.LibHaru.Types#}
{#import Graphics.PDF.LibHaru.Objects#}

#include "hpdf.h"

{#context prefix = "HPDF_ProjectionAnnot"#}

{# fun unsafe SetExData as ^
  {
    id `Annotation', id `ExData'
  } -> `Word64'
#}

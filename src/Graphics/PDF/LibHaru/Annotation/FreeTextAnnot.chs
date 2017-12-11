module Graphics.PDF.LibHaru.Annotation.FreeTextAnnot where

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

{#context prefix = "HPDF_FreeTextAnnot"#}

{# fun unsafe SetLineEndingStyle as ^
  {
    id `Annotation', `LineAnnotEndingStyle', `LineAnnotEndingStyle'
  } -> `ErrorCode'
#}

{# fun unsafe Set3PointCalloutLine as ^
  {
    id `Annotation', withCast* `Point', withCast* `Point', withCast* `Point'
  } -> `ErrorCode'
#}

{# fun unsafe Set2PointCalloutLine as ^
  {
    id `Annotation', withCast* `Point', withCast* `Point'
  } -> `ErrorCode'
#}

{# fun unsafe SetDefaultStyle as ^
  {
    id `Annotation', `String'
  } -> `ErrorCode'
#}

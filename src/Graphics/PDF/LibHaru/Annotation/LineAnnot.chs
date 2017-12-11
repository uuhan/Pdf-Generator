module Graphics.PDF.LibHaru.Annotation.LineAnnot where

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

{#context prefix = "HPDF_LineAnnot"#}

{# fun unsafe SetPosition as setLinePosition
  {
    id `Annotation'
    , withCast* `Point', `LineAnnotEndingStyle'
    , withCast* `Point', `LineAnnotEndingStyle'
  } -> `ErrorCode'
#}

{# fun unsafe SetLeader as ^
  {
    id `Annotation', `Int', `Int', `Int'
  } -> `ErrorCode'
#}

{# fun unsafe SetCaption as ^
  {
    id `Annotation', `Bool', `LineAnnotCapPosition', `Int', `Int'
  } -> `ErrorCode'
#}

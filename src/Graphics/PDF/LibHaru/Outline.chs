module Graphics.PDF.LibHaru.Outline where

import Foreign.Ptr
import Foreign.C.Types
import Foreign.C.String
import Foreign.Storable
import Foreign.Marshal.Alloc

{#import Graphics.PDF.LibHaru.Types#}
{#import Graphics.PDF.LibHaru.Objects#}
{#import Graphics.PDF.LibHaru.Error#}

#include "hpdf.h"
{#context prefix = "HPDF_Outline"#}

{# fun unsafe SetOpened as ^
  {
    id `Outline', `Bool'
  } -> `ErrorCode'
#}

{# fun unsafe SetDestination as ^
  {
    id `Outline', id `Destination'
  } -> `ErrorCode'
#}

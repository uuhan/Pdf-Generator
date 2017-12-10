module Graphics.PDF.LibHaru.Outline where

import Foreign.Ptr
import Foreign.C.Types
import Foreign.C.String
import Foreign.Storable
import Foreign.Marshal.Alloc

import Data.Word (Word64)

{#import Graphics.PDF.LibHaru.Types#}
{#import Graphics.PDF.LibHaru.Objects#}

#include "hpdf.h"
{#context prefix = "HPDF_Outline"#}

{# fun unsafe SetOpened as ^
  {
    id `Outline', `Bool'
  } -> `Word64'
#}

{# fun unsafe SetDestination as ^
  {
    id `Outline', id `Destination'
  } -> `Word64'
#}

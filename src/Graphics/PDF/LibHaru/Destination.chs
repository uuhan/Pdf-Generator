module Graphics.PDF.LibHaru.Destination where

import Foreign.Ptr
import Foreign.C.Types
import Foreign.C.String
import Foreign.Storable
import Foreign.Marshal.Alloc

{#import Graphics.PDF.LibHaru.Types#}
{#import Graphics.PDF.LibHaru.Objects#}
{#import Graphics.PDF.LibHaru.Error#}

#include "hpdf.h"
{#context prefix = "HPDF_Destination"#}

{# fun unsafe SetXYZ as ^
  {
    id `Destination', `Float', `Float', `Float'
  } -> `ErrorCode'
#}

{# fun unsafe SetFit as ^
  {
    id `Destination'
  } -> `ErrorCode'
#}

{# fun unsafe SetFitH as ^
  {
    id `Destination', `Float'
  } -> `ErrorCode'
#}

{# fun unsafe SetFitV as ^
  {
    id `Destination', `Float'
  } -> `ErrorCode'
#}

{# fun unsafe SetFitR as ^
  {
    id `Destination', `Float', `Float', `Float', `Float'
  } -> `ErrorCode'
#}

{# fun unsafe SetFitB as ^
  {
    id `Destination'
  } -> `ErrorCode'
#}

{# fun unsafe SetFitBH as ^
  {
    id `Destination', `Float'
  } -> `ErrorCode'
#}

{# fun unsafe SetFitBV as ^
  {
    id `Destination', `Float'
  } -> `ErrorCode'
#}

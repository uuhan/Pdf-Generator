module Graphics.PDF.LibHaru.Destination where

import Foreign.Ptr
import Foreign.C.Types
import Foreign.C.String
import Foreign.Storable
import Foreign.Marshal.Alloc

import Data.Word (Word64)

{#import Graphics.PDF.LibHaru.Types#}
{#import Graphics.PDF.LibHaru.Objects#}

#include "hpdf.h"
{#context prefix = "HPDF_Destination"#}

{# fun unsafe SetXYZ as ^
  {
    id `Destination', `Float', `Float', `Float'
  } -> `Word64'
#}

{# fun unsafe SetFit as ^
  {
    id `Destination'
  } -> `Word64'
#}

{# fun unsafe SetFitH as ^
  {
    id `Destination', `Float'
  } -> `Word64'
#}

{# fun unsafe SetFitV as ^
  {
    id `Destination', `Float'
  } -> `Word64'
#}

{# fun unsafe SetFitR as ^
  {
    id `Destination', `Float', `Float', `Float', `Float'
  } -> `Word64'
#}

{# fun unsafe SetFitB as ^
  {
    id `Destination'
  } -> `Word64'
#}

{# fun unsafe SetFitBH as ^
  {
    id `Destination', `Float'
  } -> `Word64'
#}

{# fun unsafe SetFitBV as ^
  {
    id `Destination', `Float'
  } -> `Word64'
#}

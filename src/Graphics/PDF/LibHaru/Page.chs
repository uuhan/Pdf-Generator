module Graphics.PDF.LibHaru.Page where

import Data.Word (Word64)

import Foreign.Ptr
import Foreign.C.Types
import Foreign.C.String
import Foreign.Storable
import Foreign.Marshal.Alloc

{#import Graphics.PDF.LibHaru.Objects#}

#include "hpdf.h"

{#context prefix = "HPDF_Page"#}

{# fun unsafe SetWidth as ^
  { id `Page'
  , `Float'
  } -> `Word64'
#}

{# fun unsafe SetHeight as ^
  { id `Page'
  , `Float'
  } -> `Word64'
#}

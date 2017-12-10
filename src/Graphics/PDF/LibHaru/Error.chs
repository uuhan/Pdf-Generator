module Graphics.PDF.LibHaru.Error where

import Foreign.Ptr
import Foreign.C.Types
import Foreign.C.String
import Foreign.Storable
import Foreign.Marshal.Alloc

{#import Graphics.PDF.LibHaru.Types#}

#include "hpdf_error.h"

{#context prefix = "HPDF"#}

{#pointer Error newtype#}

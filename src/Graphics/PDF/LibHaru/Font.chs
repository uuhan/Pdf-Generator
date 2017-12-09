module Graphics.PDF.LibHaru.Font where

import Foreign.Ptr
import Foreign.C.Types
import Foreign.C.String
import Foreign.Storable
import Foreign.Marshal.Alloc

{#import Graphics.PDF.LibHaru.Objects#}
#include "hpdf_font.h"

{#context prefix = "HPDF"#}

type Font = Dict

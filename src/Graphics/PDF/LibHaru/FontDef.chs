module Graphics.PDF.LibHaru.FontDef where

import Foreign.Ptr
import Foreign.C.Types
import Foreign.C.String
import Foreign.Storable
import Foreign.Marshal.Alloc

#include "hpdf_fontdef.h"
{#context prefix = "HPDF"#}

{#pointer FontDef newtype#}

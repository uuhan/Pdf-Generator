module Graphics.PDF.LibHaru.MMgr where

import Foreign.Ptr
import Foreign.C.Types
import Foreign.C.String
import Foreign.Storable
import Foreign.Marshal.Alloc

#include "hpdf_mmgr.h"

{#context prefix = "HPDF_MMgr"#}

{#pointer HPDF_MMgr as MMgr newtype#}

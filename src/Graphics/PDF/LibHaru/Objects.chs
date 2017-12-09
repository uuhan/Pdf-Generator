module Graphics.PDF.LibHaru.Objects where

import Foreign.Ptr
import Foreign.C.Types
import Foreign.C.String
import Foreign.Storable
import Foreign.Marshal.Alloc

#include "hpdf_objects.h"

{#context prefix = "HPDF"#}

type Page = {#type Page#}

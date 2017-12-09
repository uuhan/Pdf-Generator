module Graphics.PDF.LibHaru.Types where

import Foreign.Ptr
import Foreign.C.Types
import Foreign.C.String
import Foreign.Storable
import Foreign.Marshal.Alloc

#include "hpdf_types.h"

{#context prefix = "HPDF"#}

-- type ErrorHandler = {#type Error_Handler#}

{#pointer Error_Handler as ErrorHandler newtype#}

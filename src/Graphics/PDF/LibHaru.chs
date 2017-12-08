module Graphics.PDF.LibHaru where

import Foreign.Ptr
import Foreign.C.Types
import Foreign.C.String
import Foreign.Storable

#include "hpdf.h"

{#context prefix = "HPDF"#}

type ErrorHandler = {#type Error_Handler#}

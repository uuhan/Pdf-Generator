module Graphics.PDF.LibHaru.Doc where

import Foreign.Ptr
import Foreign.C.Types
import Foreign.C.String
import Foreign.Storable
import Foreign.Marshal.Alloc

#include "hpdf_doc.h"

{#context prefix = "HPDF"#}

{#pointer Doc as Doc newtype#}

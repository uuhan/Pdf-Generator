module Graphics.PDF.LibHaru.Annotation.PopupAnnot where

import Foreign.Ptr
import Foreign.C.Types
import Foreign.C.String
import Foreign.Storable
import Foreign.Marshal.Alloc

import Data.Word (Word64)

{#import Graphics.PDF.LibHaru.Types#}
{#import Graphics.PDF.LibHaru.Objects#}

#include "hpdf.h"

{#context prefix = "HPDF_PopupAnnot"#}

-- TODO: conflict with TextAnnot
{# fun unsafe SetOpened as setPopupOpened
  {
    id `Annotation', `Bool'
  } -> `Word64'
#}

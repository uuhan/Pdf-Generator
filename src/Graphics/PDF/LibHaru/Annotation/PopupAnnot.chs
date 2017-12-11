module Graphics.PDF.LibHaru.Annotation.PopupAnnot where

import Foreign.Ptr
import Foreign.C.Types
import Foreign.C.String
import Foreign.Storable
import Foreign.Marshal.Alloc

{#import Graphics.PDF.LibHaru.Types#}
{#import Graphics.PDF.LibHaru.Objects#}
{#import Graphics.PDF.LibHaru.Error#}

#include "hpdf.h"

{#context prefix = "HPDF_PopupAnnot"#}

-- TODO: conflict with TextAnnot
{# fun unsafe SetOpened as setPopupOpened
  {
    id `Annotation', `Bool'
  } -> `ErrorCode'
#}

module Graphics.PDF.LibHaru.Annotation.MarkupAnnot where

import Foreign.Ptr
import Foreign.C.Types
import Foreign.C.String
import Foreign.Storable
import Foreign.Marshal.Alloc

import Data.Word (Word64)
import Graphics.PDF.LibHaru.Internal (withCast)

{#import Graphics.PDF.LibHaru.Types#}
{#import Graphics.PDF.LibHaru.Objects#}

#include "hpdf.h"

{#context prefix = "HPDF_MarkupAnnot"#}

{# fun unsafe SetTitle as ^
  {
    id `Annotation', `String'
  } -> `Word64'
#}

{# fun unsafe SetSubject as ^
  {
    id `Annotation', `String'
  } -> `Word64'
#}

{# fun unsafe SetCreationDate as ^
  {
    id `Annotation', withCast* `Date'
  } -> `Word64'
#}

{# fun unsafe SetTransparency as ^
  {
    id `Annotation', `Float'
  } -> `Word64'
#}

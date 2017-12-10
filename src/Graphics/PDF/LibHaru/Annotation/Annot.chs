module Graphics.PDF.LibHaru.Annotation.Annot where

import Foreign.Ptr
import Foreign.C.Types
import Foreign.C.String
import Foreign.Storable
import Foreign.Marshal.Alloc

import Data.Word (Word64)
import Graphics.PDF.LibHaru.Internal (withCast)

{#import Graphics.PDF.LibHaru.Types#}
{#import Graphics.PDF.LibHaru.Objects#}
{#import Graphics.PDF.LibHaru.MMgr#}

#include "hpdf.h"

{#context prefix = "HPDF_Annot"#}

{# fun unsafe SetRGBColor as ^
  {
    id `Annotation', withCast* `RGBColor'
  } -> `Word64'
#}

{# fun unsafe SetCMYKColor as ^
  {
    id `Annotation', withCast* `RGBColor'
  } -> `Word64'
#}

{# fun unsafe SetGrayColor as ^
  {
    id `Annotation', `Float'
  } -> `Word64'
#}

{# fun unsafe SetNoColor as ^
  {
    id `Annotation'
  } -> `Word64'
#}

{# fun unsafe Set3DView as ^
  {
    `MMgr', id `Annotation', id `Annotation', `Dict'
  } -> `Word64'
#}

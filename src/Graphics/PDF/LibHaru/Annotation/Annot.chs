module Graphics.PDF.LibHaru.Annotation.Annot where

import Foreign.Ptr
import Foreign.C.Types
import Foreign.C.String
import Foreign.Storable
import Foreign.Marshal.Alloc

import Graphics.PDF.LibHaru.Internal (withCast)

{#import Graphics.PDF.LibHaru.Types#}
{#import Graphics.PDF.LibHaru.Objects#}
{#import Graphics.PDF.LibHaru.Error#}
{#import Graphics.PDF.LibHaru.MMgr#}

#include "hpdf.h"

{#context prefix = "HPDF_Annot"#}

{# fun unsafe SetRGBColor as ^
  {
    id `Annotation', withCast* `RGBColor'
  } -> `ErrorCode'
#}

{# fun unsafe SetCMYKColor as ^
  {
    id `Annotation', withCast* `RGBColor'
  } -> `ErrorCode'
#}

{# fun unsafe SetGrayColor as ^
  {
    id `Annotation', `Float'
  } -> `ErrorCode'
#}

{# fun unsafe SetNoColor as ^
  {
    id `Annotation'
  } -> `ErrorCode'
#}

{# fun unsafe Set3DView as ^
  {
    `MMgr', id `Annotation', id `Annotation', `Dict'
  } -> `ErrorCode'
#}

module Graphics.PDF.LibHaru.Page where

import Data.Word (Word64, Word32, Word16)

import Foreign.Ptr
import Foreign.C.Types
import Foreign.C.String
import Foreign.Storable
import Foreign.Marshal.Alloc

{#import Graphics.PDF.LibHaru.Types#}
{#import Graphics.PDF.LibHaru.Objects#}
{#import Graphics.PDF.LibHaru.Font#}

#include "hpdf.h"

{#context prefix = "HPDF_Page"#}

{# fun unsafe SetWidth as ^
  { id `Page'
  , `Float'
  } -> `Word64'
#}

{# fun unsafe SetHeight as ^
  { id `Page'
  , `Float'
  } -> `Word64'
#}

{# fun pure GetWidth as ^
  { id `Page'
  } -> `Float'
#}

{# fun pure GetHeight as ^
  { id `Page'
  } -> `Float'
#}

{# fun unsafe SetSize as ^
  { id `Page', `PageSizes', `PageDirection' } -> `Word64'
#}

{# fun unsafe SetRotate as ^
  {
    id `Page', `Word16'
  } -> `Word64'
#}

{# fun unsafe SetZoom as ^
  {
    id `Page', `Float'
  } -> `Word64'
#}

{# fun unsafe CreateDestination as ^
  { id `Page' } -> `Destination' id
#}

{# fun unsafe BeginText as ^
  { id `Page' } -> `Word64'
#}

{# fun unsafe TextWidth as ^
  { id `Page', `String' } -> `Float'
#}

{# fun unsafe SetFontAndSize as ^
  { id `Page', id `Font', `Float' } -> `Word64'
#}

{# fun unsafe MoveTextPos as ^
  { id `Page', `Float', `Float' } -> `Word64'
#}

{# fun unsafe ShowText as ^
  { id `Page', `String' } -> `Word64'
#}

{# fun unsafe EndText as ^
  { id `Page' } -> `Word64'
#}

{# fun unsafe SetLineWidth as ^
  { id `Page', `Float' } -> `Word64'
#}

{# fun unsafe DrawImage as ^
  { id `Page' , id `Image' , `Float' , `Float' , `Float' , `Float' } -> `Word64'
#}

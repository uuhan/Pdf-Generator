module Graphics.PDF.LibHaru where

import Foreign.Ptr
import Foreign.C.Types
import Foreign.C.String
import Foreign.Storable
import Foreign.Marshal.Alloc

import Data.Word (Word64)

{#import Graphics.PDF.LibHaru.Doc#}
{#import Graphics.PDF.LibHaru.Font#}
{#import Graphics.PDF.LibHaru.Objects#}

#include "hpdf.h"

{#context prefix = "HPDF"#}

type ErrorHandler = {#type Error_Handler#}

{# fun unsafe New as ^
  { id `ErrorHandler'
  , alloca- `()'
  } -> `Doc' id
#}

{# fun unsafe SaveToFile as ^
  { id `Doc'
  , `String'
  } -> `Word64'
#}

{# fun unsafe AddPage as ^
  { id `Doc' } -> `Page' id
#}

{# fun unsafe GetFont as ^
  { id `Doc'
  , `String'
  , alloca- `()'
  } -> `Font' id
#}

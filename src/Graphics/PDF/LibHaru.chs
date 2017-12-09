module Graphics.PDF.LibHaru where

import Foreign.Ptr
import Foreign.C.Types
import Foreign.C.String
import Foreign.Storable
import Foreign.Marshal.Alloc

import Data.Word (Word64, Word32)

{#import Graphics.PDF.LibHaru.Types#}
{#import Graphics.PDF.LibHaru.Doc#}
{#import Graphics.PDF.LibHaru.Font#}
{#import Graphics.PDF.LibHaru.Objects#}

#include "hpdf.h"
#include "utils.h"

{#context prefix = "HPDF"#}

{# fun unsafe New as ^
  { id `ErrorHandler' , alloca- `()' } -> `Doc' id
#}

{# fun unsafe SaveToFile as ^
  { id `Doc' , `String' } -> `Word64'
#}

{# fun unsafe AddPage as ^
  { id `Doc' } -> `Page' id
#}

{# fun unsafe GetFont as ^
  { id `Doc' , `String' , alloca- `()' } -> `Font' id
#}

{# fun unsafe SetCompressionMode as ^
  { id `Doc' , `Int' } -> `Word64'
#}

{# fun unsafe Destination_SetXYZ as ^
  { id `Destination'
  , `Float'
  , `Float'
  , `Float'
  } ->  `Word64'
#}

{# fun unsafe SetOpenAction as ^
  { id `Doc'
  , id `Destination'
  } -> `Word64'
#}

{# fun unsafe LoadPngImageFromFile as ^
  { id `Doc', `String' } -> `Image' id
#}

{# fun pure Image_GetHeight as ^
  { id `Image' } -> `Word32'
#}

{# fun pure Image_GetWidth as ^
  { id `Image' } -> `Word32'
#}

{# fun unsafe Free as ^
  { id `Doc' } -> `()'
#}

-- | Utils
{# fun unsafe show_description as ^
  { id `Page'
  , `Float'
  , `Float'
  , `String'
  } -> `()'
#}

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

{# fun unsafe SetIntent as ^
  {
    id `Annotation', `AnnotIntent'
  } -> `Word64'
#}

{# fun unsafe SetPopup as ^
  {
    id `Annotation', id `Annotation'
  } -> `Word64'
#}

{# fun unsafe SetRectDiff as ^
  {
    id `Annotation', withCast* `Rect'
  } -> `Word64'
#}

{# fun unsafe SetCloudEffect as ^
  {
    id `Annotation', `Int'
  } -> `Word64'
#}

{# fun unsafe SetInteriorRGBColor as ^
  {
    id `Annotation', withCast* `RGBColor'
  } -> `Word64'
#}

{# fun unsafe SetInteriorCMYKColor as ^
  {
    id `Annotation', withCast* `CMYKColor'
  } -> `Word64'
#}

{# fun unsafe SetInteriorGrayColor as ^
  {
    id `Annotation', `Float'
  } -> `Word64'
#}

{# fun unsafe SetInteriorTransparent as ^
  {
    id `Annotation'
  } -> `Word64'
#}

{# fun unsafe HPDF_TextMarkupAnnot_SetQuadPoints as setQuadPoints
  {
    id `Annotation',
    withCast* `Point', withCast* `Point',
    withCast* `Point', withCast* `Point'
  } -> `Word64'
#}

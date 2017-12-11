module Graphics.PDF.LibHaru.Annotation.MarkupAnnot where

import Foreign.Ptr
import Foreign.C.Types
import Foreign.C.String
import Foreign.Storable
import Foreign.Marshal.Alloc

import Graphics.PDF.LibHaru.Internal (withCast)

{#import Graphics.PDF.LibHaru.Types#}
{#import Graphics.PDF.LibHaru.Objects#}
{#import Graphics.PDF.LibHaru.Error#}

#include "hpdf.h"

{#context prefix = "HPDF_MarkupAnnot"#}

{# fun unsafe SetTitle as ^
  {
    id `Annotation', `String'
  } -> `ErrorCode'
#}

{# fun unsafe SetSubject as ^
  {
    id `Annotation', `String'
  } -> `ErrorCode'
#}

{# fun unsafe SetCreationDate as ^
  {
    id `Annotation', withCast* `Date'
  } -> `ErrorCode'
#}

{# fun unsafe SetTransparency as ^
  {
    id `Annotation', `Float'
  } -> `ErrorCode'
#}

{# fun unsafe SetIntent as ^
  {
    id `Annotation', `AnnotIntent'
  } -> `ErrorCode'
#}

{# fun unsafe SetPopup as ^
  {
    id `Annotation', id `Annotation'
  } -> `ErrorCode'
#}

{# fun unsafe SetRectDiff as ^
  {
    id `Annotation', withCast* `Rect'
  } -> `ErrorCode'
#}

{# fun unsafe SetCloudEffect as ^
  {
    id `Annotation', `Int'
  } -> `ErrorCode'
#}

{# fun unsafe SetInteriorRGBColor as ^
  {
    id `Annotation', withCast* `RGBColor'
  } -> `ErrorCode'
#}

{# fun unsafe SetInteriorCMYKColor as ^
  {
    id `Annotation', withCast* `CMYKColor'
  } -> `ErrorCode'
#}

{# fun unsafe SetInteriorGrayColor as ^
  {
    id `Annotation', `Float'
  } -> `ErrorCode'
#}

{# fun unsafe SetInteriorTransparent as ^
  {
    id `Annotation'
  } -> `ErrorCode'
#}

{# fun unsafe HPDF_TextMarkupAnnot_SetQuadPoints as setQuadPoints
  {
    id `Annotation'
    , withCast* `Point', withCast* `Point'
    , withCast* `Point', withCast* `Point'
  } -> `ErrorCode'
#}

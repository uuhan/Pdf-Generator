module Graphics.PDF.LibHaru.Page
  where

import Data.Word (Word32, Word16)

import Foreign.Ptr
import Foreign.C.Types
import Foreign.C.String
import Foreign.Storable
import Foreign.Marshal.Alloc
import Foreign.Marshal.Utils

import Graphics.PDF.LibHaru.Internal (withCast)

{#import Graphics.PDF.LibHaru.Types#}
{#import Graphics.PDF.LibHaru.Objects#}
{#import Graphics.PDF.LibHaru.Error#}
{#import Graphics.PDF.LibHaru.Encoder#}
{#import Graphics.PDF.LibHaru.Font#}

#include "hpdf.h"

{#context prefix = "HPDF_Page"#}

{# fun unsafe SetWidth as ^
  { id `Page'
  , `Float'
  } -> `ErrorCode'
#}

{# fun unsafe SetHeight as ^
  { id `Page'
  , `Float'
  } -> `ErrorCode'
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
  { id `Page', `PageSizes', `PageDirection' } -> `ErrorCode'
#}

{# fun unsafe SetRotate as ^
  {
    id `Page', `Word16'
  } -> `ErrorCode'
#}

{# fun unsafe SetZoom as ^
  {
    id `Page', `Float'
  } -> `ErrorCode'
#}

{# fun unsafe CreateDestination as ^
  { id `Page' } -> `Destination' id
#}

{# fun unsafe BeginText as ^
  { id `Page' } -> `ErrorCode'
#}

{# fun unsafe TextWidth as ^
  { id `Page', `String' } -> `Float'
#}

{# fun unsafe SetFontAndSize as ^
  { id `Page', id `Font', `Float' } -> `ErrorCode'
#}

{# fun unsafe MoveTextPos as ^
  { id `Page', `Float', `Float' } -> `ErrorCode'
#}

{# fun unsafe ShowText as ^
  { id `Page', `String' } -> `ErrorCode'
#}

{# fun unsafe EndText as ^
  { id `Page' } -> `ErrorCode'
#}

{# fun unsafe SetLineWidth as ^
  { id `Page', `Float' } -> `ErrorCode'
#}

{# fun unsafe DrawImage as ^
  { id `Page' , id `Image' , `Float' , `Float' , `Float' , `Float' } -> `ErrorCode'
#}

{# fun unsafe Create3DAnnot as ^
  {
    id `Page', withCast* `Rect', id `U3D'
  } -> `Annotation' id
#}

{# fun unsafe CreateTextAnnot as ^
  {
    id `Page', withCast* `Rect', `String', `Encoder'
  } -> `Annotation' id
#}

{# fun unsafe CreateFreeTextAnnot as ^
  {
    id `Page', withCast* `Rect', `String', `Encoder'
  } -> `Annotation' id
#}

{# fun unsafe CreateLineAnnot as ^
  {
    id `Page', `String', `Encoder'
  } -> `Annotation' id
#}

{# fun unsafe CreateLinkAnnot as ^
  {
    id `Page', withCast* `Rect', id `Destination'
  } -> `Annotation' id
#}

{# fun unsafe CreateURILinkAnnot as ^
  {
    id `Page', withCast* `Rect', `String'
  } -> `Annotation' id
#}

{# fun unsafe CreateTextMarkupAnnot as ^
  {
    id `Page', withCast* `Rect', `String', `Encoder', `AnnotType'
  } -> `Annotation' id
#}

{# fun unsafe CreateHighlightAnnot as ^
  {
    id `Page', withCast* `Rect', `String', `Encoder'
  } -> `Annotation' id
#}

{# fun unsafe CreateUnderlineAnnot as ^
  {
    id `Page', withCast* `Rect', `String', `Encoder'
  } -> `Annotation' id
#}

{# fun unsafe CreateSquigglyAnnot as ^
  {
    id `Page', withCast* `Rect', `String', `Encoder'
  } -> `Annotation' id
#}

{# fun unsafe CreateStrikeOutAnnot as ^
  {
    id `Page', withCast* `Rect', `String', `Encoder'
  } -> `Annotation' id
#}

{# fun unsafe CreatePopupAnnot as ^
  {
    id `Page', withCast* `Rect', id `Annotation'
  } -> `Annotation' id
#}

{# fun unsafe CreateStampAnnot as ^
  {
    id `Page', withCast* `Rect', `StampAnnotName', `String', `Encoder'
  } -> `Annotation' id
#}

{# fun unsafe CreateProjectionAnnot as ^
  {
    id `Page', withCast* `Rect', `String', `Encoder'
  } -> `Annotation' id
#}

{# fun unsafe CreateSquareAnnot as ^
  {
    id `Page', withCast* `Rect', `String', `Encoder'
  } -> `Annotation' id
#}

{# fun unsafe CreateCircleAnnot as ^
  {
    id `Page', withCast* `Rect', `String', `Encoder'
  } -> `Annotation' id
#}

{# fun unsafe Circle as ^
  {
    id `Page'
    , `Float', `Float' , `Float'
  } -> `ErrorCode'
#}

{# fun unsafe Ellipse as ^
  {
    id `Page'
    , `Float', `Float'
    , `Float', `Float'
  } -> `ErrorCode'
#}

{# fun unsafe Arc as ^
  {
    id `Page'
    , `Float', `Float'
    , `Float'
    , `Float', `Float'
  } -> `ErrorCode'
#}

{# fun unsafe TextOut as ^
  {
    id `Page'
    , `Float', `Float'
    , `String'
  } -> `ErrorCode'
#}

{# fun unsafe TextRect as ^
  {
    id `Page'
    , `Float', `Float'
    , `Float', `Float'
    , `String'
    , `TextAlignment'
    , `Word32'
  } -> `ErrorCode'
#}

{# fun unsafe SetSlideShow as ^
  {
    id `Page'
    , `TransitionStyle'
    , `Float', `Float'
  } -> `ErrorCode'
#}

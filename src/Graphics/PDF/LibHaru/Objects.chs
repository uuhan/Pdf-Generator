module Graphics.PDF.LibHaru.Objects where

import Foreign.Ptr
import Foreign.C.Types
import Foreign.C.String
import Foreign.Storable
import Foreign.Marshal.Alloc

#include "hpdf_objects.h"

{#context prefix = "HPDF"#}

{#pointer Dict  newtype#}
{#pointer Array newtype#}

type EmbeddedFile = Dict
type NameDict     = Dict
type NameTree     = Dict
type Pages        = Dict
type Page         = Dict
type Annotation   = Dict
type Measure3D    = Dict
type ExData       = Dict
type XObject      = Dict
type Image        = Dict
type Outline      = Dict
type EncryptDict  = Dict
type Action       = Dict
type ExtGState    = Dict
type U3D          = Dict
type OutputIntent = Dict
type JavaScript   = Dict

type Destination = Array

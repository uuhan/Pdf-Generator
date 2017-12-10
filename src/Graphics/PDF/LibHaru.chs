module Graphics.PDF.LibHaru where

import Foreign.Ptr
import Foreign.C.Types
import Foreign.C.String
import Foreign.Storable
import Foreign.Marshal.Alloc
import Foreign.Marshal.Utils

import Data.Word (Word32, Word64)

{#import Graphics.PDF.LibHaru.Types#}
{#import Graphics.PDF.LibHaru.Error#}
{#import Graphics.PDF.LibHaru.Encoder#}
{#import Graphics.PDF.LibHaru.Doc#}
{#import Graphics.PDF.LibHaru.Font#}
{#import Graphics.PDF.LibHaru.FontDef#}
{#import Graphics.PDF.LibHaru.Objects#}

#include "hpdf.h"
#include "utils.h"

{#context prefix = "HPDF"#}

{# fun unsafe NewEx as ^
  { `ErrorHandler'
  , `AllocFunc'
  , `FreeFunc'
  , `Word32'
  , alloca- `()' } -> `Doc'
#}

{# fun unsafe New as ^
  { `ErrorHandler' , alloca- `()' } -> `Doc'
#}

{# fun unsafe SetErrorHandler as ^
  {
    `Doc', `ErrorHandler'
  } -> `Word64'
#}

{# fun unsafe NewDoc as ^
  {
    `Doc'
  } -> `Word64'
#}

{# fun unsafe FreeDoc as ^
  {
    `Doc'
  } -> `()'
#}

{# fun unsafe HasDoc as ^
  {
    `Doc'
  } -> `Bool'
#}

{# fun unsafe SaveToFile as ^
  { `Doc' , `String' } -> `Word64'
#}

{# fun unsafe GetError as ^
  {
    `Doc'
  } -> `Word64'
#}

{# fun unsafe GetErrorDetail as ^
  {
    `Doc'
  } -> `Word64'
#}

{# fun unsafe ResetError as ^
  {
    `Doc'
  } -> `()'
#}

{# fun unsafe CheckError as ^
  {
    `Error'
  } -> `Word64'
#}

{# fun unsafe SetPagesConfiguration as ^
  {
    `Doc', `Word32'
  } -> `Word64'
#}

{# fun unsafe GetPageByIndex as ^
  {
    `Doc', `Word32'
  } -> `Page' id
#}

{# fun pure GetPageLayout as ^
  {
    `Doc'
  } -> `PageLayout' -- enum
#}

{# fun unsafe SetPageLayout as ^
  {
    `Doc', `PageLayout'
  } -> `()'
#}

{# fun pure GetPageMode as ^
  {
    `Doc'
  } -> `PageMode'
#}

{# fun unsafe SetPageMode as ^
  {
    `Doc', `PageMode'
  } -> `()'
#}

{# fun pure GetViewerPreference as ^
  {
    `Doc'
  } -> `Word32'
#}

{# fun unsafe SetViewerPreference as ^
  {
    `Doc', `Word32'
  } -> `()'
#}

{# fun unsafe SetOpenAction as ^
  {
    `Doc', id `Destination'
  } -> `Word64'
#}

{# fun unsafe FreeDocAll as ^
  {
    `Doc'
  } -> `()'
#}

{# fun unsafe SaveToStream as ^
  {
    `Doc'
  } -> `Word64'
#}

-- {# fun unsafe GetContents as ^
--   {
--     `Doc', `[Int]', `[Word32]'
--   } -> `Word64'
-- #}

{# fun unsafe GetStreamSize as ^
  {
    `Doc'
  } -> `Word32'
#}

-- {# fun unsafe ReadFromStream as ^
--   {
--     `Doc', `[Int]', `[Word32]'
--   } -> `Word64'
-- #}

{# fun unsafe ResetStream as ^
  {
    `Doc'
  } -> `Word64'
#}

{# fun unsafe GetCurrentPage as ^
  {
    `Doc'
  } -> `Page' id
#}

{# fun unsafe AddPage as ^
  { `Doc' } -> `Page' id
#}

{# fun unsafe AddPageLabel as ^
  {
    `Doc', `Word32', `PageNumStyle', `Word32', `String'
  } -> `Word64'
#}

{# fun unsafe UseJPFonts as ^
  {
    `Doc'
  } -> `Word64'
#}

{# fun unsafe UseKRFonts as ^
  {
    `Doc'
  } -> `Word64'
#}

{# fun unsafe UseCNSFonts as ^
  {
    `Doc'
  } -> `Word64'
#}

{# fun unsafe UseCNTFonts as ^
  {
    `Doc'
  } -> `Word64'
#}

{# fun unsafe UseJPEncodings as ^
  {
    `Doc'
  } -> `Word64'
#}

{# fun unsafe UseKREncodings as ^
  {
    `Doc'
  } -> `Word64'
#}

{# fun unsafe UseCNSEncodings as ^
  {
    `Doc'
  } -> `Word64'
#}

{# fun unsafe UseCNTEncodings as ^
  {
    `Doc'
  } -> `Word64'
#}

{# fun unsafe UseUTFEncodings as ^
  {
    `Doc'
  } -> `Word64'
#}

{# fun unsafe InsertPage as ^
  {
    `Doc', id `Page'
  } -> `Page' id
#}

{# fun unsafe GetFont as ^
  { `Doc' , `String' , `CString' } -> `Font' id
#}

{# fun unsafe LoadType1FontFromFile as ^
  {
    `Doc', `String', `String'
  } -> `String'
#}

{# fun unsafe GetTTFontDefFromFile as ^
  {
    `Doc', `String', `Bool'
  } -> `FontDef'
#}

{# fun unsafe LoadTTFontFromFile as ^
  {
    `Doc', `String', `Bool'
  } -> `String'
#}

{# fun unsafe LoadTTFontFromFile2 as ^
  {
    `Doc', `String', `Word32', `Bool'
  } -> `String'
#}

{# fun unsafe SetCompressionMode as ^
  { `Doc' , `Int' } -> `Word64'
#}

{# fun unsafe Destination_SetXYZ as ^
  { id `Destination' , `Float' , `Float' , `Float' } ->  `Word64'
#}

{# fun unsafe LoadPngImageFromFile as ^
  { `Doc', `String' } -> `Image' id
#}

{# fun pure Image_GetHeight as ^
  { id `Image' } -> `Word32'
#}

{# fun pure Image_GetWidth as ^
  { id `Image' } -> `Word32'
#}

{# fun unsafe Free as ^
  { `Doc' } -> `()'
#}

{# fun unsafe AttachFile as ^
  { `Doc', withCString* `FilePath' } -> `EmbeddedFile' id
#}

-- outline
{# fun unsafe CreateOutline as ^
  {
    `Doc', id `Outline', `String', `Encoder'
  } -> `Outline' id
#}

-- encoder
{# fun unsafe GetEncoder as ^
  {
    `Doc', `String'
  } -> `Encoder'
#}

{# fun unsafe GetCurrentEncoder as ^
  {
    `Doc'
  } -> `Encoder'
#}

{# fun unsafe SetCurrentEncoder as ^
  {
    `Doc', `String'
  } -> `Word64'
#}

{# fun pure GetVersion as ^
  {} -> `String'
#}

{# fun unsafe show_description as ^
  { id `Page' , `Float' , `Float' , `String' } -> `()'
#}

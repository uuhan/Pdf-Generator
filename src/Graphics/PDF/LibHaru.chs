module Graphics.PDF.LibHaru where

import Foreign.Ptr
import Foreign.C.Types
import Foreign.C.String
import Foreign.Storable
import Foreign.Marshal.Alloc
import Foreign.Marshal.Utils

import Data.Word (Word32)

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
  } -> `ErrorCode'
#}

{# fun unsafe NewDoc as ^
  {
    `Doc'
  } -> `ErrorCode'
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
  { `Doc' , `String' } -> `ErrorCode'
#}

{# fun unsafe GetError as ^
  {
    `Doc'
  } -> `ErrorCode'
#}

{# fun unsafe GetErrorDetail as ^
  {
    `Doc'
  } -> `ErrorCode'
#}

{# fun unsafe ResetError as ^
  {
    `Doc'
  } -> `()'
#}

{# fun unsafe CheckError as ^
  {
    `Error'
  } -> `ErrorCode'
#}

{# fun unsafe SetPagesConfiguration as ^
  {
    `Doc', `Word32'
  } -> `ErrorCode'
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
  } -> `ErrorCode'
#}

{# fun unsafe FreeDocAll as ^
  {
    `Doc'
  } -> `()'
#}

{# fun unsafe SaveToStream as ^
  {
    `Doc'
  } -> `ErrorCode'
#}

-- {# fun unsafe GetContents as ^
--   {
--     `Doc', `[Int]', `[Word32]'
--   } -> `ErrorCode'
-- #}

{# fun unsafe GetStreamSize as ^
  {
    `Doc'
  } -> `Word32'
#}

-- {# fun unsafe ReadFromStream as ^
--   {
--     `Doc', `[Int]', `[Word32]'
--   } -> `ErrorCode'
-- #}

{# fun unsafe ResetStream as ^
  {
    `Doc'
  } -> `ErrorCode'
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
  } -> `ErrorCode'
#}

{# fun unsafe UseJPFonts as ^
  {
    `Doc'
  } -> `ErrorCode'
#}

{# fun unsafe UseKRFonts as ^
  {
    `Doc'
  } -> `ErrorCode'
#}

{# fun unsafe UseCNSFonts as ^
  {
    `Doc'
  } -> `ErrorCode'
#}

{# fun unsafe UseCNTFonts as ^
  {
    `Doc'
  } -> `ErrorCode'
#}

{# fun unsafe UseJPEncodings as ^
  {
    `Doc'
  } -> `ErrorCode'
#}

{# fun unsafe UseKREncodings as ^
  {
    `Doc'
  } -> `ErrorCode'
#}

{# fun unsafe UseCNSEncodings as ^
  {
    `Doc'
  } -> `ErrorCode'
#}

{# fun unsafe UseCNTEncodings as ^
  {
    `Doc'
  } -> `ErrorCode'
#}

{# fun unsafe UseUTFEncodings as ^
  {
    `Doc'
  } -> `ErrorCode'
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
  { `Doc' , `Int' } -> `ErrorCode'
#}

{# fun unsafe Destination_SetXYZ as ^
  { id `Destination' , `Float' , `Float' , `Float' } ->  `ErrorCode'
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
  } -> `ErrorCode'
#}

{# fun pure GetVersion as ^
  {} -> `String'
#}

{# fun unsafe show_description as ^
  { id `Page' , `Float' , `Float' , `String' } -> `()'
#}

-- encryption
{# fun unsafe SetPassword as ^
  {
    `Doc', `String', `String'
  } -> `ErrorCode'
#}

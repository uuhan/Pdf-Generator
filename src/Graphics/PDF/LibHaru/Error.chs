module Graphics.PDF.LibHaru.Error where

import Foreign.Ptr
import Foreign.C.Types
import Foreign.C.String
import Foreign.Storable
import Foreign.Marshal.Alloc

{#import Graphics.PDF.LibHaru.Types#}

#include "hpdf_error.h"

{#context prefix = "HPDF"#}

{#enum define ErrorCode
  { HPDF_ARRAY_COUNT_ERR              as ArrayCountErr
  , HPDF_ARRAY_ITEM_NOT_FOUND         as ArrayItemNotFound
  , HPDF_ARRAY_ITEM_UNEXPECTED_TYPE   as ItemUnexpectedType
  , HPDF_BINARY_LENGTH_ERR            as BinaryLengthErr
  , HPDF_CANNOT_GET_PALLET            as CannotGetPallet
  , HPDF_DICT_COUNT_ERR               as DictCountErr
  , HPDF_DICT_ITEM_NOT_FOUND          as DictItemNotFound
  , HPDF_DICT_ITEM_UNEXPECTED_TYPE    as DictItemUnexpectedType
  , HPDF_DICT_STREAM_LENGTH_NOT_FOUND as DictStreamLengthNotFound
  , HPDF_DOC_ENCRYPTDICT_NOT_FOUND    as DocEncryptdictNotFound
  , HPDF_DOC_INVALID_OBJECT           as DocInvalidObject
  , HPDF_DUPLICATE_REGISTRATION       as DuplicateRegistration
  , HPDF_EXCEED_JWW_CODE_NUM_LIMIT    as ExceedJWWCodeNumLimit
  , HPDF_ENCRYPT_INVALID_PASSWORD     as EncryptInvalidPassword
  , HPDF_ERR_UNKNOWN_CLASS            as ErrUnknownClass
  , HPDF_EXCEED_GSTATE_LIMIT          as ExceedGstateLimit
  , HPDF_FAILD_TO_ALLOC_MEM           as FaildToAllocMem
  , HPDF_FILE_IO_ERROR                as FileIOError
  , HPDF_FILE_OPEN_ERROR              as FileOpenError
  , HPDF_FONT_EXISTS                  as FontExists
  , HPDF_FONT_INVALID_WIDTHS_TABLE    as FontInvalidWidthsTable
  , HPDF_INVALID_AFM_HEADER           as InvalidAFMHeader
  , HPDF_INVALID_ANNOTATION           as InvalidAnnotation
  , HPDF_INVALID_BIT_PER_COMPONENT    as InvalidBitPerComponent
  , HPDF_INVALID_CHAR_MATRICS_DATA    as InvalidCharMatricsData
  , HPDF_INVALID_COLOR_SPACE          as InvalidColorSpace
  , HPDF_INVALID_COMPRESSION_MODE     as InvalidCompressioMode
  , HPDF_INVALID_DATE_TIME            as InvalidDateTime
  , HPDF_INVALID_DESTINATION          as InvalidDestination
  , HPDF_INVALID_DOCUMENT             as InvalidDocument
  , HPDF_INVALID_DOCUMENT_STATE       as InvalidDocumentState
  , HPDF_INVALID_ENCODER              as InvalidEncoder
  , HPDF_INVALID_ENCODER_TYPE         as InvalidEncoderType
  , HPDF_INVALID_ENCODING_NAME        as InvalidEncoderName
  , HPDF_INVALID_ENCRYPT_KEY_LEN      as InvalidEncryptKeyLen
  , HPDF_INVALID_FONTDEF_DATA         as InvalidFontDefData
  , HPDF_INVALID_FONTDEF_TYPE         as InvalidFontDefType
  , HPDF_INVALID_FONT_NAME            as InvalidFontName
  , HPDF_INVALID_IMAGE                as InvalidImage
  , HPDF_INVALID_JPEG_DATA            as InvalidJpegData
  , HPDF_INVALID_N_DATA               as InvalidNData
  , HPDF_INVALID_OBJECT               as InvalidObject
  , HPDF_INVALID_OBJ_ID               as InvalidObjID
  , HPDF_INVALID_OPERATION            as InvalidOperation
  , HPDF_INVALID_OUTLINE              as InvalidOutline
  , HPDF_INVALID_PAGE                 as InvalidPage
  , HPDF_INVALID_PAGES                as InvalidPages
  , HPDF_INVALID_PARAMETER            as InvalidParameter
  , HPDF_INVALID_PNG_IMAGE            as InvalidPngImage
  , HPDF_INVALID_STREAM               as InvalidStream
  , HPDF_MISSING_FILE_NAME_ENTRY      as MissingFileNameEntry
  , HPDF_INVALID_TTC_FILE             as InvalidTTCFile
  , HPDF_INVALID_TTC_INDEX            as InvalidTTCIndex
  , HPDF_INVALID_WX_DATA              as InvalidWxData
  , HPDF_ITEM_NOT_FOUND               as ItemNotFound
  , HPDF_LIBPNG_ERROR                 as LibpngError
  , HPDF_NAME_INVALID_VALUE           as NameInvalidValue
  , HPDF_NAME_OUT_OF_RANGE            as NameOutOfRange
  , HPDF_PAGE_INVALID_PARAM_COUNT     as PageInvalidParamCount
  , HPDF_PAGES_MISSING_KIDS_ENTRY     as PagesMissingKidsEntry
  , HPDF_PAGE_CANNOT_FIND_OBJECT      as PageCannotFindObject
  , HPDF_PAGE_CANNOT_GET_ROOT_PAGES   as PageCannotGetRootPages
  , HPDF_PAGE_CANNOT_RESTORE_GSTATE   as PageCannotRestoreGstate
  , HPDF_PAGE_CANNOT_SET_PARENT       as PageCannotSetParent
  , HPDF_PAGE_FONT_NOT_FOUND          as PageFontNotFound
  , HPDF_PAGE_INVALID_FONT            as PageInvalidFont
  , HPDF_PAGE_INVALID_FONT_SIZE       as PageInvalidFontSize
  , HPDF_PAGE_INVALID_GMODE           as PageInvalidGmode
  , HPDF_PAGE_INVALID_INDEX           as PageInvalidIndex
  , HPDF_PAGE_INVALID_ROTATE_VALUE    as PageInvalidRotateValue
  , HPDF_PAGE_INVALID_SIZE            as PageInvalidSize
  , HPDF_PAGE_INVALID_XOBJECT         as PageInvalidXObject
  , HPDF_PAGE_OUT_OF_RANGE            as PageOutOfRange
  , HPDF_REAL_OUT_OF_RANGE            as RealOutOfRange
  , HPDF_STREAM_EOF                   as StreamEOF
  , HPDF_STREAM_READLN_CONTINUE       as StreamReadlnContinue
  , HPDF_STRING_OUT_OF_RANGE          as StringOutOfRange
  , HPDF_THIS_FUNC_WAS_SKIPPED        as ThisFuncWasSkipped
  , HPDF_TTF_CANNOT_EMBEDDING_FONT    as TTFCannotEmbeddingFont
  , HPDF_TTF_INVALID_CMAP             as TTFInvalidCMAP
  , HPDF_TTF_INVALID_FOMAT            as TTFInvalidFormat
  , HPDF_TTF_MISSING_TABLE            as TTFMissingTable
  , HPDF_UNSUPPORTED_FONT_TYPE        as UnsupportedFontType
  , HPDF_UNSUPPORTED_FUNC             as UnsupportedFunc
  , HPDF_UNSUPPORTED_JPEG_FORMAT      as UnsupportedJpegFormat
  , HPDF_UNSUPPORTED_TYPE1_FONT       as UnsupportedType1Font
  , HPDF_XREF_COUNT_ERR               as XrefCountErr
  , HPDF_ZLIB_ERROR                   as ZlibError
  , HPDF_INVALID_PAGE_INDEX           as InvalidPageIndex
  , HPDF_INVALID_URI                  as InvalidURI
  , HPDF_PAGE_LAYOUT_OUT_OF_RANGE     as PageLayoutOutOfRange
  , HPDF_PAGE_MODE_OUT_OF_RANGE       as PageModeOutOfRange
  , HPDF_PAGE_NUM_STYLE_OUT_OF_RANGE  as PageNumStyleOutOfRange
  , HPDF_ANNOT_INVALID_ICON           as AnnotInvalidIcon
  , HPDF_ANNOT_INVALID_BORDER_STYLE   as AnnotInvalidBorderStyle
  , HPDF_PAGE_INVALID_DIRECTION       as PageInvalidDirection
  , HPDF_INVALID_FONT                 as InvalidFont
  , HPDF_PAGE_INSUFFICIENT_SPACE      as PageInsufficientSpace
  , HPDF_PAGE_INVALID_DISPLAY_TIME    as PageInvalidDisplayTIme
  , HPDF_PAGE_INVALID_TRANSITION_TIME as PageInvalidTransitionTime
  , HPDF_INVALID_PAGE_SLIDESHOW_TYPE  as InvalidPageSlideshowType
  , HPDF_EXT_GSTATE_OUT_OF_RANGE      as ExtGstateOutOfRange
  , HPDF_INVALID_EXT_GSTATE           as InvalidExtGstate
  , HPDF_EXT_GSTATE_READ_ONLY         as ExtGstateReadOnly
  , HPDF_INVALID_U3D_DATA             as InvalidU3DData
  , HPDF_NAME_CANNOT_GET_NAMES        as NameCannotGetNames
  , HPDF_INVALID_ICC_COMPONENT_NUM    as InvalidICCComponentNum
  }
  deriving(Eq, Ord, Show)#}

{#pointer Error newtype#}

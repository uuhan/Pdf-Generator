{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE DuplicateRecordFields #-}
module Graphics.PDF.LibHaru.Types where

import Foreign.Ptr
import Foreign.C.Types
import Foreign.C.String
import Foreign.Storable
import Foreign.Marshal.Alloc

#include "hpdf_types.h"

{#context prefix = "HPDF"#}

-- | OS integer
type INT      = {#type INT#}
type UINT     = {#type UINT#}
-- | 32bit integer
type INT32    = {#type INT32#}
type UINT32   = {#type UINT32#}
-- | 16bit integer
type INT16    = {#type INT16#}
type UINT16   = {#type UINT16#}
-- | 8bit integer
type INT8     = {#type INT8#}
type UINT8    = {#type UINT8#}
-- | 8bit binary
type BYTE     = {#type BYTE#}
-- | float type (32bit IEEE754)
type REAL     = {#type REAL#}
-- | float type (64bit IEEE754)
type DOUBLE   = {#type DOUBLE#}
-- | boolean type
type BOOL     = {#type BOOL#}
-- | error-no type (32bit)
type STATUS   = {#type STATUS#}
-- | charactor-code (16bit)
type CID      = {#type CID#}
type UNICODE  = {#type UNICODE#}

data Position = Position
              { x :: REAL
              , y :: REAL
              }

data Rect = Rect
          { left   :: REAL
          , bottom :: REAL
          , right  :: REAL
          , top    :: REAL
          }
instance Storable Rect where
  alignment _ = {#alignof Rect#}
  sizeOf _ = {#sizeof Rect#}
  peek ptr = do
    left <- {#get Rect->left#} ptr
    bottom <- {#get Rect->bottom#} ptr
    right <- {#get Rect->right#} ptr
    top <- {#get Rect->top#} ptr
    return Rect{..}
  poke ptr Rect{..} = do
    {#set Rect->left#} ptr left
    {#set Rect->bottom#} ptr bottom
    {#set Rect->right#} ptr right
    {#set Rect->top#} ptr top

data Point3D = Point3D
             { x :: REAL
             , y :: REAL
             , z :: REAL
             }

data Date = Date
          { year        :: INT
          , month       :: INT
          , day         :: INT
          , hour        :: INT
          , minutes     :: INT
          , seconds     :: INT
          , ind         :: CChar
          , off_hour    :: INT
          , off_minutes :: INT
          }

data TextWidth = TextWidth
               { numchars :: UINT
               , numwords :: UINT
               , width    :: UINT
               , numspace :: UINT
               }

data DashMode = DashMode
              { ptn     :: [UINT16]
              , num_ptn :: UINT
              , phase   :: UINT
              }

data RGBColor = RGBColor
              { r :: REAL
              , g :: REAL
              , b :: REAL
              }
instance Storable RGBColor where
  alignment _ = {#alignof RGBColor#}
  sizeOf _ = {#sizeof RGBColor#}
  peek ptr = do
    r <- {#get RGBColor->r#} ptr
    g <- {#get RGBColor->g#} ptr
    b <- {#get RGBColor->b#} ptr
    return RGBColor{..}
  poke ptr RGBColor{..} = do
    {#set RGBColor->r#} ptr r
    {#set RGBColor->g#} ptr g
    {#set RGBColor->b#} ptr b

data CMYKColor = CMYKColor
              { c :: REAL
              , m :: REAL
              , y :: REAL
              , k :: REAL
              }
instance Storable CMYKColor where
  alignment _ = {#alignof CMYKColor#}
  sizeOf _ = {#sizeof CMYKColor#}
  peek ptr = do
    c <- {#get CMYKColor->c#} ptr
    m <- {#get CMYKColor->m#} ptr
    y <- {#get CMYKColor->y#} ptr
    k <- {#get CMYKColor->k#} ptr
    return CMYKColor{..}
  poke ptr CMYKColor{..} = do
    {#set CMYKColor->c#} ptr c
    {#set CMYKColor->m#} ptr m
    {#set CMYKColor->y#} ptr y
    {#set CMYKColor->k#} ptr k

{#pointer Error_Handler as ErrorHandler newtype#}
{#pointer Alloc_Func    as AllocFunc    newtype#}
{#pointer Free_Func     as FreeFunc     newtype#}

-- | 信息类型
{#enum InfoType             {underscoreToCase} deriving (Show)#}

-- | PDF-A Types
{#enum PDFAType             {underscoreToCase} deriving (Show)#}

-- | PDF ver
{#enum PDFVer               {underscoreToCase} deriving (Show)#}

-- | encrypt mode
{#enum EncryptMode          {underscoreToCase} deriving (Show)#}

{#enum ColorSpace           {underscoreToCase} deriving (Show)#}
{#enum LineCap              {underscoreToCase} deriving (Show)#}
{#enum LineJoin             {underscoreToCase} deriving (Show)#}
{#enum TextRenderingMode    {underscoreToCase} deriving (Show)#}
{#enum WritingMode          {underscoreToCase} deriving (Show)#}
{#enum PageLayout           {underscoreToCase} deriving (Show)#}
{#enum PageMode             {underscoreToCase} deriving (Show)#}
{#enum PageNumStyle         {underscoreToCase} deriving (Show)#}
{#enum DestinationType      {underscoreToCase} deriving (Show)#}
{#enum AnnotType            {underscoreToCase} deriving (Show)#}
{#enum AnnotFlgs            {underscoreToCase} deriving (Show)#}
{#enum AnnotHighlightMode   {underscoreToCase} deriving (Show)#}
{#enum AnnotIcon            {underscoreToCase} deriving (Show)#}
{#enum AnnotIntent          {underscoreToCase} deriving (Show)#}
{#enum LineAnnotEndingStyle {underscoreToCase} deriving (Show)#}
{#enum LineAnnotCapPosition {underscoreToCase} deriving (Show)#}
{#enum StampAnnotName       {underscoreToCase} deriving (Show)#}
{#enum BSSubtype            {underscoreToCase} deriving (Show)#}
{#enum BlendMode            {underscoreToCase} deriving (Show)#}
{#enum TransitionStyle      {underscoreToCase} deriving (Show)#}
{#enum EncoderType          {underscoreToCase} deriving (Show)#}
{#enum ByteType             {underscoreToCase} deriving (Show)#}
{#enum TextAlignment        {underscoreToCase} deriving (Show)#}
{#enum NameDictKey          {underscoreToCase} deriving (Show)#}

-- | 纸张大小
{#enum PageSizes            {underscoreToCase} deriving (Show)#}

-- | 纸张朝向
{#enum PageDirection        {underscoreToCase} deriving (Show)#}


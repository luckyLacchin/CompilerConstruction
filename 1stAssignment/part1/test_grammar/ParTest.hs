{-# OPTIONS_GHC -w #-}
{-# OPTIONS -XMagicHash -XBangPatterns -XTypeSynonymInstances -XFlexibleInstances -cpp #-}
#if __GLASGOW_HASKELL__ >= 710
{-# OPTIONS_GHC -XPartialTypeSignatures #-}
#endif
{-# OPTIONS_GHC -fno-warn-incomplete-patterns -fno-warn-overlapping-patterns #-}
{-# LANGUAGE PatternSynonyms #-}

module ParTest
  ( happyError
  , myLexer
  , pProgram
  , pListDef
  , pDef
  , pListArg
  , pArg
  , pConst
  , pInitialization
  , pStm
  , pVar
  , pListStm
  , pExp15
  , pExp10
  , pExp
  , pExp1
  , pExp2
  , pExp3
  , pExp4
  , pExp5
  , pExp6
  , pExp7
  , pExp8
  , pExp9
  , pExp11
  , pExp12
  , pExp13
  , pExp14
  , pListExp
  , pQualConst
  , pTemplateInst
  , pTypeList
  , pType
  , pLiteral
  , pListId
  ) where

import Prelude

import qualified AbsTest
import LexTest
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import qualified GHC.Exts as Happy_GHC_Exts
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.1.1

newtype HappyAbsSyn  = HappyAbsSyn HappyAny
#if __GLASGOW_HASKELL__ >= 607
type HappyAny = Happy_GHC_Exts.Any
#else
type HappyAny = forall a . a
#endif
newtype HappyWrap36 = HappyWrap36 (AbsTest.Chars)
happyIn36 :: (AbsTest.Chars) -> (HappyAbsSyn )
happyIn36 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap36 x)
{-# INLINE happyIn36 #-}
happyOut36 :: (HappyAbsSyn ) -> HappyWrap36
happyOut36 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut36 #-}
newtype HappyWrap37 = HappyWrap37 (AbsTest.Strings)
happyIn37 :: (AbsTest.Strings) -> (HappyAbsSyn )
happyIn37 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap37 x)
{-# INLINE happyIn37 #-}
happyOut37 :: (HappyAbsSyn ) -> HappyWrap37
happyOut37 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut37 #-}
newtype HappyWrap38 = HappyWrap38 (AbsTest.Integers)
happyIn38 :: (AbsTest.Integers) -> (HappyAbsSyn )
happyIn38 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap38 x)
{-# INLINE happyIn38 #-}
happyOut38 :: (HappyAbsSyn ) -> HappyWrap38
happyOut38 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut38 #-}
newtype HappyWrap39 = HappyWrap39 (AbsTest.Id)
happyIn39 :: (AbsTest.Id) -> (HappyAbsSyn )
happyIn39 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap39 x)
{-# INLINE happyIn39 #-}
happyOut39 :: (HappyAbsSyn ) -> HappyWrap39
happyOut39 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut39 #-}
newtype HappyWrap40 = HappyWrap40 (AbsTest.Program)
happyIn40 :: (AbsTest.Program) -> (HappyAbsSyn )
happyIn40 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap40 x)
{-# INLINE happyIn40 #-}
happyOut40 :: (HappyAbsSyn ) -> HappyWrap40
happyOut40 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut40 #-}
newtype HappyWrap41 = HappyWrap41 ([AbsTest.Def])
happyIn41 :: ([AbsTest.Def]) -> (HappyAbsSyn )
happyIn41 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap41 x)
{-# INLINE happyIn41 #-}
happyOut41 :: (HappyAbsSyn ) -> HappyWrap41
happyOut41 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut41 #-}
newtype HappyWrap42 = HappyWrap42 (AbsTest.Def)
happyIn42 :: (AbsTest.Def) -> (HappyAbsSyn )
happyIn42 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap42 x)
{-# INLINE happyIn42 #-}
happyOut42 :: (HappyAbsSyn ) -> HappyWrap42
happyOut42 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut42 #-}
newtype HappyWrap43 = HappyWrap43 ([AbsTest.Arg])
happyIn43 :: ([AbsTest.Arg]) -> (HappyAbsSyn )
happyIn43 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap43 x)
{-# INLINE happyIn43 #-}
happyOut43 :: (HappyAbsSyn ) -> HappyWrap43
happyOut43 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut43 #-}
newtype HappyWrap44 = HappyWrap44 (AbsTest.Arg)
happyIn44 :: (AbsTest.Arg) -> (HappyAbsSyn )
happyIn44 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap44 x)
{-# INLINE happyIn44 #-}
happyOut44 :: (HappyAbsSyn ) -> HappyWrap44
happyOut44 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut44 #-}
newtype HappyWrap45 = HappyWrap45 (AbsTest.Const)
happyIn45 :: (AbsTest.Const) -> (HappyAbsSyn )
happyIn45 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap45 x)
{-# INLINE happyIn45 #-}
happyOut45 :: (HappyAbsSyn ) -> HappyWrap45
happyOut45 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut45 #-}
newtype HappyWrap46 = HappyWrap46 (AbsTest.Initialization)
happyIn46 :: (AbsTest.Initialization) -> (HappyAbsSyn )
happyIn46 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap46 x)
{-# INLINE happyIn46 #-}
happyOut46 :: (HappyAbsSyn ) -> HappyWrap46
happyOut46 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut46 #-}
newtype HappyWrap47 = HappyWrap47 (AbsTest.Stm)
happyIn47 :: (AbsTest.Stm) -> (HappyAbsSyn )
happyIn47 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap47 x)
{-# INLINE happyIn47 #-}
happyOut47 :: (HappyAbsSyn ) -> HappyWrap47
happyOut47 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut47 #-}
newtype HappyWrap48 = HappyWrap48 (AbsTest.Var)
happyIn48 :: (AbsTest.Var) -> (HappyAbsSyn )
happyIn48 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap48 x)
{-# INLINE happyIn48 #-}
happyOut48 :: (HappyAbsSyn ) -> HappyWrap48
happyOut48 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut48 #-}
newtype HappyWrap49 = HappyWrap49 ([AbsTest.Stm])
happyIn49 :: ([AbsTest.Stm]) -> (HappyAbsSyn )
happyIn49 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap49 x)
{-# INLINE happyIn49 #-}
happyOut49 :: (HappyAbsSyn ) -> HappyWrap49
happyOut49 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut49 #-}
newtype HappyWrap50 = HappyWrap50 (AbsTest.Exp)
happyIn50 :: (AbsTest.Exp) -> (HappyAbsSyn )
happyIn50 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap50 x)
{-# INLINE happyIn50 #-}
happyOut50 :: (HappyAbsSyn ) -> HappyWrap50
happyOut50 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut50 #-}
newtype HappyWrap51 = HappyWrap51 (AbsTest.Exp)
happyIn51 :: (AbsTest.Exp) -> (HappyAbsSyn )
happyIn51 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap51 x)
{-# INLINE happyIn51 #-}
happyOut51 :: (HappyAbsSyn ) -> HappyWrap51
happyOut51 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut51 #-}
newtype HappyWrap52 = HappyWrap52 (AbsTest.Exp)
happyIn52 :: (AbsTest.Exp) -> (HappyAbsSyn )
happyIn52 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap52 x)
{-# INLINE happyIn52 #-}
happyOut52 :: (HappyAbsSyn ) -> HappyWrap52
happyOut52 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut52 #-}
newtype HappyWrap53 = HappyWrap53 (AbsTest.Exp)
happyIn53 :: (AbsTest.Exp) -> (HappyAbsSyn )
happyIn53 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap53 x)
{-# INLINE happyIn53 #-}
happyOut53 :: (HappyAbsSyn ) -> HappyWrap53
happyOut53 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut53 #-}
newtype HappyWrap54 = HappyWrap54 (AbsTest.Exp)
happyIn54 :: (AbsTest.Exp) -> (HappyAbsSyn )
happyIn54 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap54 x)
{-# INLINE happyIn54 #-}
happyOut54 :: (HappyAbsSyn ) -> HappyWrap54
happyOut54 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut54 #-}
newtype HappyWrap55 = HappyWrap55 (AbsTest.Exp)
happyIn55 :: (AbsTest.Exp) -> (HappyAbsSyn )
happyIn55 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap55 x)
{-# INLINE happyIn55 #-}
happyOut55 :: (HappyAbsSyn ) -> HappyWrap55
happyOut55 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut55 #-}
newtype HappyWrap56 = HappyWrap56 (AbsTest.Exp)
happyIn56 :: (AbsTest.Exp) -> (HappyAbsSyn )
happyIn56 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap56 x)
{-# INLINE happyIn56 #-}
happyOut56 :: (HappyAbsSyn ) -> HappyWrap56
happyOut56 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut56 #-}
newtype HappyWrap57 = HappyWrap57 (AbsTest.Exp)
happyIn57 :: (AbsTest.Exp) -> (HappyAbsSyn )
happyIn57 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap57 x)
{-# INLINE happyIn57 #-}
happyOut57 :: (HappyAbsSyn ) -> HappyWrap57
happyOut57 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut57 #-}
newtype HappyWrap58 = HappyWrap58 (AbsTest.Exp)
happyIn58 :: (AbsTest.Exp) -> (HappyAbsSyn )
happyIn58 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap58 x)
{-# INLINE happyIn58 #-}
happyOut58 :: (HappyAbsSyn ) -> HappyWrap58
happyOut58 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut58 #-}
newtype HappyWrap59 = HappyWrap59 (AbsTest.Exp)
happyIn59 :: (AbsTest.Exp) -> (HappyAbsSyn )
happyIn59 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap59 x)
{-# INLINE happyIn59 #-}
happyOut59 :: (HappyAbsSyn ) -> HappyWrap59
happyOut59 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut59 #-}
newtype HappyWrap60 = HappyWrap60 (AbsTest.Exp)
happyIn60 :: (AbsTest.Exp) -> (HappyAbsSyn )
happyIn60 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap60 x)
{-# INLINE happyIn60 #-}
happyOut60 :: (HappyAbsSyn ) -> HappyWrap60
happyOut60 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut60 #-}
newtype HappyWrap61 = HappyWrap61 (AbsTest.Exp)
happyIn61 :: (AbsTest.Exp) -> (HappyAbsSyn )
happyIn61 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap61 x)
{-# INLINE happyIn61 #-}
happyOut61 :: (HappyAbsSyn ) -> HappyWrap61
happyOut61 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut61 #-}
newtype HappyWrap62 = HappyWrap62 (AbsTest.Exp)
happyIn62 :: (AbsTest.Exp) -> (HappyAbsSyn )
happyIn62 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap62 x)
{-# INLINE happyIn62 #-}
happyOut62 :: (HappyAbsSyn ) -> HappyWrap62
happyOut62 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut62 #-}
newtype HappyWrap63 = HappyWrap63 (AbsTest.Exp)
happyIn63 :: (AbsTest.Exp) -> (HappyAbsSyn )
happyIn63 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap63 x)
{-# INLINE happyIn63 #-}
happyOut63 :: (HappyAbsSyn ) -> HappyWrap63
happyOut63 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut63 #-}
newtype HappyWrap64 = HappyWrap64 (AbsTest.Exp)
happyIn64 :: (AbsTest.Exp) -> (HappyAbsSyn )
happyIn64 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap64 x)
{-# INLINE happyIn64 #-}
happyOut64 :: (HappyAbsSyn ) -> HappyWrap64
happyOut64 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut64 #-}
newtype HappyWrap65 = HappyWrap65 (AbsTest.Exp)
happyIn65 :: (AbsTest.Exp) -> (HappyAbsSyn )
happyIn65 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap65 x)
{-# INLINE happyIn65 #-}
happyOut65 :: (HappyAbsSyn ) -> HappyWrap65
happyOut65 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut65 #-}
newtype HappyWrap66 = HappyWrap66 ([AbsTest.Exp])
happyIn66 :: ([AbsTest.Exp]) -> (HappyAbsSyn )
happyIn66 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap66 x)
{-# INLINE happyIn66 #-}
happyOut66 :: (HappyAbsSyn ) -> HappyWrap66
happyOut66 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut66 #-}
newtype HappyWrap67 = HappyWrap67 (AbsTest.QualConst)
happyIn67 :: (AbsTest.QualConst) -> (HappyAbsSyn )
happyIn67 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap67 x)
{-# INLINE happyIn67 #-}
happyOut67 :: (HappyAbsSyn ) -> HappyWrap67
happyOut67 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut67 #-}
newtype HappyWrap68 = HappyWrap68 (AbsTest.TemplateInst)
happyIn68 :: (AbsTest.TemplateInst) -> (HappyAbsSyn )
happyIn68 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap68 x)
{-# INLINE happyIn68 #-}
happyOut68 :: (HappyAbsSyn ) -> HappyWrap68
happyOut68 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut68 #-}
newtype HappyWrap69 = HappyWrap69 (AbsTest.TypeList)
happyIn69 :: (AbsTest.TypeList) -> (HappyAbsSyn )
happyIn69 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap69 x)
{-# INLINE happyIn69 #-}
happyOut69 :: (HappyAbsSyn ) -> HappyWrap69
happyOut69 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut69 #-}
newtype HappyWrap70 = HappyWrap70 (AbsTest.Type)
happyIn70 :: (AbsTest.Type) -> (HappyAbsSyn )
happyIn70 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap70 x)
{-# INLINE happyIn70 #-}
happyOut70 :: (HappyAbsSyn ) -> HappyWrap70
happyOut70 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut70 #-}
newtype HappyWrap71 = HappyWrap71 (AbsTest.Literal)
happyIn71 :: (AbsTest.Literal) -> (HappyAbsSyn )
happyIn71 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap71 x)
{-# INLINE happyIn71 #-}
happyOut71 :: (HappyAbsSyn ) -> HappyWrap71
happyOut71 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut71 #-}
newtype HappyWrap72 = HappyWrap72 ([AbsTest.Id])
happyIn72 :: ([AbsTest.Id]) -> (HappyAbsSyn )
happyIn72 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap72 x)
{-# INLINE happyIn72 #-}
happyOut72 :: (HappyAbsSyn ) -> HappyWrap72
happyOut72 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut72 #-}
happyInTok :: (Token) -> (HappyAbsSyn )
happyInTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyInTok #-}
happyOutTok :: (HappyAbsSyn ) -> (Token)
happyOutTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOutTok #-}


happyExpList :: HappyAddr
happyExpList = HappyA# "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x6c\x41\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x6c\x41\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x6c\x41\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x7c\x41\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x7c\x41\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x80\x78\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x80\x78\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x78\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x78\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x78\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x78\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x78\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x78\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x78\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x78\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x78\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x78\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x78\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x78\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x78\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x78\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x78\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x78\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x78\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x6c\x41\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x6c\x41\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x38\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x78\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x80\x78\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x11\x00\x78\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x78\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x6c\x41\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x6c\x41\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x7c\x41\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x78\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x78\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x78\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x6c\x41\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x6c\x41\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x7c\x41\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x80\x78\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_pProgram","%start_pListDef","%start_pDef","%start_pListArg","%start_pArg","%start_pConst","%start_pInitialization","%start_pStm","%start_pVar","%start_pListStm","%start_pExp15","%start_pExp10","%start_pExp","%start_pExp1","%start_pExp2","%start_pExp3","%start_pExp4","%start_pExp5","%start_pExp6","%start_pExp7","%start_pExp8","%start_pExp9","%start_pExp11","%start_pExp12","%start_pExp13","%start_pExp14","%start_pListExp","%start_pQualConst","%start_pTemplateInst","%start_pTypeList","%start_pType","%start_pLiteral","%start_pListId","Chars","Strings","Integers","Id","Program","ListDef","Def","ListArg","Arg","Const","Initialization","Stm","Var","ListStm","Exp15","Exp10","Exp","Exp1","Exp2","Exp3","Exp4","Exp5","Exp6","Exp7","Exp8","Exp9","Exp11","Exp12","Exp13","Exp14","ListExp","QualConst","TemplateInst","TypeList","Type","Literal","ListId","'('","')'","','","'::'","';'","'<'","'<<'","'='","'>'","'>>'","'bool'","'char'","'const'","'double'","'int'","'return'","'void'","'{'","'}'","L_Chars","L_Strings","L_Integers","L_Id","%eof"]
        bit_start = st Prelude.* 96
        bit_end = (st Prelude.+ 1) Prelude.* 96
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..95]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

happyActOffsets :: HappyAddr
happyActOffsets = HappyA# "\x17\x02\x17\x02\x17\x02\x62\x01\x62\x01\xfc\xff\x17\x00\xf9\x02\x00\x00\xe7\x02\x02\x03\x02\x03\x02\x03\x02\x03\x02\x03\x02\x03\x02\x03\x02\x03\x02\x03\x02\x03\x02\x03\x02\x03\x02\x03\x02\x03\x02\x03\x02\x03\x02\x03\x0a\x00\x0a\x00\x17\x02\x17\x02\x3c\x00\x0a\x00\x0f\x00\x00\x00\x42\x00\x2e\x00\x00\x00\x00\x00\x00\x00\x00\x00\x2e\x00\x00\x00\x00\x00\x00\x00\x2e\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x2e\x00\x66\x00\x6e\x00\x5b\x00\x00\x00\xbe\x00\x00\x00\x60\x00\x72\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x75\x00\x87\x00\x00\x00\x02\x03\x76\x00\x76\x00\x76\x00\x76\x00\x76\x00\x76\x00\x76\x00\x76\x00\x76\x00\x76\x00\x76\x00\x76\x00\x76\x00\x76\x00\xf0\x00\x76\x00\xd9\x02\x8a\x00\x7f\x00\x93\x00\x10\x03\x81\x00\x81\x00\x81\x00\x02\x03\x81\x00\x00\x00\x81\x00\x17\x02\x9a\x00\xa2\x00\xaf\x00\xa3\x00\x9c\x00\xbd\x00\x17\x02\xbd\x00\x00\x00\x00\x00\xd6\x00\x62\x01\xd7\x00\xc9\x00\x00\x00\x2b\x00\xdc\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x03\x02\x03\xe1\x00\xcf\x00\x02\x03\x17\x02\x17\x02\xcf\x00\x00\x00\x00\x00\xf2\x00\x00\x00\xf3\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x62\x01\x00\x01\x00\x00\xf1\x00\xf1\x02\xf4\x00\x00\x00\x00\x00"#

happyGotoOffsets :: HappyAddr
happyGotoOffsets = HappyA# "\x97\x00\xbb\x00\x74\x00\xba\x01\x95\x01\xfb\x00\xfc\x00\x6d\x00\xf9\x00\x01\x00\xd6\x02\x65\x02\xd9\x00\x69\x01\x8d\x01\xb1\x01\xd5\x01\xf9\x01\x1d\x02\x2f\x02\x41\x02\x53\x02\x77\x02\xad\x02\xbf\x02\xc4\x02\x91\x00\x4c\x00\x02\x00\x2c\x00\x73\x00\x06\x00\x07\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xfd\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x25\x00\x00\x00\x00\x00\x00\x00\x21\x01\x00\x00\x00\x00\x00\x00\x45\x01\x00\x00\x00\x00\x00\x00\xbc\x00\x06\x01\x00\x00\x00\x00\x00\x00\x07\x01\x00\x00\xdf\x00\x00\x00\x00\x00\x00\x00\x00\x00\xde\x01\x11\x01\x1a\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x89\x02\x9b\x02\x00\x00\x27\x00\xb5\x00\x50\x00\x9b\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x02\x00\x00\x00\x00\x00\x00\x49\x00\x00\x00\x00\x00\x00\x00"#

happyAdjustOffset :: Happy_GHC_Exts.Int# -> Happy_GHC_Exts.Int#
happyAdjustOffset off = off

happyDefActions :: HappyAddr
happyDefActions = HappyA# "\xd9\xff\xd9\xff\x00\x00\xd6\xff\x00\x00\x00\x00\x00\x00\xc8\xff\xc8\xff\xc8\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xb1\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xde\xff\x9f\xff\x00\x00\xdb\xff\xa0\xff\xa1\xff\xa2\xff\x00\x00\xdd\xff\xdc\xff\xa3\xff\x00\x00\xa8\xff\xa4\xff\xa7\xff\xa6\xff\xa5\xff\x00\x00\xaa\xff\x00\x00\x00\x00\xae\xff\x00\x00\xb2\xff\xb6\xff\xb0\xff\xbf\xff\xbe\xff\xbd\xff\xbc\xff\xbb\xff\xba\xff\xb9\xff\xb8\xff\xb7\xff\xc0\xff\xb5\xff\xb4\xff\xb3\xff\x00\x00\xc4\xff\xc5\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xc8\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xcf\xff\x00\x00\x00\x00\xd3\xff\x00\x00\xd5\xff\x00\x00\x00\x00\x00\x00\xd9\xff\x00\x00\xda\xff\xd8\xff\x00\x00\xd6\xff\xd2\xff\x00\x00\xce\xff\xc5\xff\x00\x00\xc9\xff\xcc\xff\xcb\xff\xc6\xff\x00\x00\x00\x00\x00\x00\x00\x00\xb1\xff\x00\x00\x00\x00\x00\x00\x9e\xff\xa9\xff\x00\x00\xaf\xff\xad\xff\xac\xff\xc3\xff\xc2\xff\xc1\xff\xca\xff\xd0\xff\xd1\xff\xd4\xff\xd6\xff\x00\x00\xab\xff\x00\x00\xc8\xff\x00\x00\xd7\xff"#

happyCheck :: HappyAddr
happyCheck = HappyA# "\xff\xff\x00\x00\x01\x00\x02\x00\x03\x00\x03\x00\x00\x00\x01\x00\x02\x00\x0d\x00\x03\x00\x03\x00\x0b\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\x08\x00\x1f\x00\x17\x00\x20\x00\x14\x00\x23\x00\x00\x00\x01\x00\x02\x00\x03\x00\x23\x00\x03\x00\x24\x00\x24\x00\x02\x00\x03\x00\x03\x00\x0b\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\x18\x00\x1f\x00\x03\x00\x18\x00\x20\x00\x23\x00\x00\x00\x01\x00\x02\x00\x03\x00\x21\x00\x22\x00\x03\x00\x14\x00\x15\x00\x16\x00\x03\x00\x0b\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\x07\x00\x1f\x00\x03\x00\x0a\x00\x1f\x00\x23\x00\x00\x00\x01\x00\x02\x00\x03\x00\x21\x00\x22\x00\x18\x00\x06\x00\x03\x00\x03\x00\x03\x00\x0b\x00\x0c\x00\x06\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\x04\x00\x1f\x00\x18\x00\x18\x00\x05\x00\x23\x00\x00\x00\x01\x00\x02\x00\x03\x00\x22\x00\x22\x00\x18\x00\x05\x00\x18\x00\x03\x00\x04\x00\x05\x00\x06\x00\x03\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x17\x00\x03\x00\x17\x00\x23\x00\x00\x00\x01\x00\x02\x00\x03\x00\x22\x00\x18\x00\x18\x00\x21\x00\x22\x00\x03\x00\x03\x00\x05\x00\x06\x00\x04\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x18\x00\x18\x00\x01\x00\x23\x00\x00\x00\x01\x00\x02\x00\x03\x00\x22\x00\x22\x00\x08\x00\x17\x00\x05\x00\x03\x00\x02\x00\x05\x00\x06\x00\x17\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\x07\x00\x1f\x00\x06\x00\x0a\x00\x09\x00\x23\x00\x00\x00\x01\x00\x02\x00\x03\x00\x22\x00\x02\x00\x12\x00\x09\x00\x0c\x00\x0a\x00\x13\x00\x18\x00\x03\x00\x03\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\x0a\x00\x1f\x00\x03\x00\xff\xff\xff\xff\x23\x00\x00\x00\x01\x00\x02\x00\x03\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\xff\xff\x1f\x00\xff\xff\xff\xff\xff\xff\x23\x00\x00\x00\x01\x00\x02\x00\x03\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\xff\xff\x1f\x00\xff\xff\xff\xff\xff\xff\x23\x00\x00\x00\x01\x00\x02\x00\x03\x00\x0b\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\xff\xff\x11\x00\xff\xff\xff\xff\xff\xff\x0e\x00\x0f\x00\x17\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\xff\xff\x1f\x00\xff\xff\xff\xff\xff\xff\x23\x00\x00\x00\x01\x00\x02\x00\x03\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x03\x00\xff\xff\xff\xff\x0e\x00\x0f\x00\x08\x00\x09\x00\x12\x00\x13\x00\x14\x00\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\xff\xff\x1f\x00\xff\xff\xff\xff\xff\xff\x23\x00\x00\x00\x01\x00\x02\x00\x03\x00\xff\xff\xff\xff\x22\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x03\x00\xff\xff\x0e\x00\x0f\x00\x07\x00\x08\x00\x09\x00\x13\x00\x14\x00\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\xff\xff\x1f\x00\xff\xff\xff\xff\xff\xff\x23\x00\x00\x00\x01\x00\x02\x00\x03\x00\xff\xff\xff\xff\xff\xff\x22\x00\xff\xff\xff\xff\xff\xff\xff\xff\x03\x00\xff\xff\x0e\x00\x0f\x00\x07\x00\x08\x00\x09\x00\xff\xff\x14\x00\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\xff\xff\x1f\x00\xff\xff\xff\xff\xff\xff\x23\x00\x00\x00\x01\x00\x02\x00\x03\x00\xff\xff\xff\xff\xff\xff\x22\x00\xff\xff\xff\xff\xff\xff\xff\xff\x03\x00\xff\xff\x0e\x00\x0f\x00\x07\x00\x08\x00\x09\x00\xff\xff\xff\xff\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\xff\xff\x1f\x00\xff\xff\xff\xff\xff\xff\x23\x00\x00\x00\x01\x00\x02\x00\x03\x00\xff\xff\x0b\x00\x0c\x00\x22\x00\x0e\x00\x0f\x00\xff\xff\x11\x00\xff\xff\xff\xff\x0e\x00\x0f\x00\xff\xff\x17\x00\x00\x00\x01\x00\x02\x00\x03\x00\x16\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\xff\xff\x1f\x00\x0e\x00\x0f\x00\xff\xff\x23\x00\x00\x00\x01\x00\x02\x00\x03\x00\xff\xff\x17\x00\x18\x00\x19\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\xff\xff\x1f\x00\x0e\x00\x0f\x00\xff\xff\x23\x00\x00\x00\x01\x00\x02\x00\x03\x00\xff\xff\xff\xff\x18\x00\x19\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\xff\xff\x1f\x00\x0e\x00\x0f\x00\xff\xff\x23\x00\x00\x00\x01\x00\x02\x00\x03\x00\xff\xff\xff\xff\xff\xff\x19\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\xff\xff\x1f\x00\x0e\x00\x0f\x00\xff\xff\x23\x00\x00\x00\x01\x00\x02\x00\x03\x00\xff\xff\xff\xff\xff\xff\xff\xff\x1a\x00\x1b\x00\x1c\x00\x1d\x00\xff\xff\x1f\x00\x0e\x00\xff\xff\xff\xff\x23\x00\x00\x00\x01\x00\x02\x00\x03\x00\xff\xff\xff\xff\xff\xff\xff\xff\x1a\x00\x1b\x00\x1c\x00\x1d\x00\xff\xff\x1f\x00\x0e\x00\xff\xff\xff\xff\x23\x00\x00\x00\x01\x00\x02\x00\x03\x00\xff\xff\xff\xff\xff\xff\xff\xff\x1a\x00\x1b\x00\x1c\x00\x1d\x00\xff\xff\x1f\x00\x0e\x00\xff\xff\xff\xff\x23\x00\x00\x00\x01\x00\x02\x00\x03\x00\xff\xff\xff\xff\xff\xff\xff\xff\x1a\x00\x1b\x00\x1c\x00\x1d\x00\xff\xff\x1f\x00\x0e\x00\xff\xff\xff\xff\x23\x00\x00\x00\x01\x00\x02\x00\x03\x00\xff\xff\x00\x00\x01\x00\x02\x00\x03\x00\x1b\x00\x1c\x00\x1d\x00\xff\xff\x1f\x00\x0e\x00\xff\xff\xff\xff\x23\x00\xff\xff\x0e\x00\xff\xff\xff\xff\xff\xff\x00\x00\x01\x00\x02\x00\x03\x00\x01\x00\x1c\x00\x1d\x00\xff\xff\x1f\x00\xff\xff\xff\xff\x1d\x00\x23\x00\x1f\x00\x0e\x00\xff\xff\xff\xff\x23\x00\x01\x00\x10\x00\xff\xff\xff\xff\x13\x00\x14\x00\x15\x00\x16\x00\x17\x00\x18\x00\x01\x00\xff\xff\xff\xff\x1f\x00\xff\xff\x10\x00\xff\xff\x23\x00\x01\x00\x14\x00\x15\x00\x16\x00\x17\x00\x18\x00\xff\xff\x10\x00\xff\xff\x01\x00\x13\x00\x14\x00\x15\x00\x16\x00\x17\x00\x10\x00\xff\xff\xff\xff\xff\xff\x14\x00\x15\x00\x16\x00\x17\x00\x01\x00\xff\xff\xff\xff\xff\xff\x05\x00\x14\x00\x15\x00\x16\x00\x17\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x14\x00\x15\x00\x16\x00\x17\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff"#

happyTable :: HappyAddr
happyTable = HappyA# "\x00\x00\x26\x00\x27\x00\x28\x00\x37\x00\x35\x00\x26\x00\x27\x00\x28\x00\x68\x00\x23\x00\x23\x00\x5d\x00\x5e\x00\x5f\x00\x39\x00\x3a\x00\x60\x00\x3c\x00\x3d\x00\x3e\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x43\x00\x44\x00\x45\x00\x46\x00\x47\x00\x48\x00\x66\x00\x4a\x00\x26\x00\x36\x00\x23\x00\x4b\x00\x26\x00\x27\x00\x28\x00\x37\x00\x29\x00\x8b\x00\x24\x00\x87\x00\xc5\xff\xc5\xff\x2c\x00\x5d\x00\x5e\x00\x7e\x00\x39\x00\x3a\x00\x60\x00\x3c\x00\x3d\x00\x3e\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x43\x00\x44\x00\x45\x00\x46\x00\x47\x00\x48\x00\xc5\xff\x4a\x00\x87\x00\xff\xff\x8c\x00\x4b\x00\x26\x00\x27\x00\x28\x00\x37\x00\x33\x00\x34\x00\x37\x00\x23\x00\x2b\x00\x2c\x00\x2c\x00\x5d\x00\x5e\x00\x99\x00\x39\x00\x3a\x00\x60\x00\x3c\x00\x3d\x00\x3e\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x43\x00\x44\x00\x45\x00\x46\x00\x47\x00\x48\x00\x80\x00\x4a\x00\x86\x00\x81\x00\x38\x00\x4b\x00\x26\x00\x27\x00\x28\x00\x37\x00\x89\x00\x34\x00\xff\xff\x85\x00\x84\x00\x2c\x00\x2c\x00\x63\x00\x5e\x00\x6d\x00\x39\x00\x3a\x00\x60\x00\x3c\x00\x3d\x00\x3e\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x43\x00\x44\x00\x45\x00\x46\x00\x47\x00\x48\x00\x83\x00\x4a\x00\xff\xff\xff\xff\x7e\x00\x4b\x00\x26\x00\x27\x00\x28\x00\x37\x00\x2d\x00\x6e\x00\xff\xff\x7d\x00\xff\xff\x2c\x00\x71\x00\x72\x00\x70\x00\x2c\x00\x39\x00\x3a\x00\x3b\x00\x3c\x00\x3d\x00\x3e\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x43\x00\x44\x00\x45\x00\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x26\x00\x76\x00\x26\x00\x4b\x00\x26\x00\x27\x00\x28\x00\x37\x00\x6e\x00\xff\xff\xff\xff\x88\x00\x34\x00\x2c\x00\x2c\x00\x6f\x00\x70\x00\x83\x00\x39\x00\x3a\x00\x3b\x00\x3c\x00\x3d\x00\x3e\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x43\x00\x44\x00\x45\x00\x46\x00\x47\x00\x48\x00\x8a\x00\x4a\x00\xff\xff\xff\xff\x95\x00\x4b\x00\x26\x00\x27\x00\x28\x00\x37\x00\x6e\x00\x77\x00\x66\x00\x26\x00\x91\x00\x2c\x00\x8e\x00\x73\x00\x70\x00\x26\x00\x39\x00\x3a\x00\x5a\x00\x3c\x00\x3d\x00\x3e\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x43\x00\x44\x00\x45\x00\x46\x00\x47\x00\x48\x00\x80\x00\x4a\x00\x85\x00\x81\x00\x97\x00\x4b\x00\x26\x00\x27\x00\x28\x00\x37\x00\x6e\x00\x98\x00\x99\x00\x66\x00\x62\x00\x64\x00\x9b\x00\xff\xff\x76\x00\x74\x00\x39\x00\x3a\x00\x81\x00\x3c\x00\x3d\x00\x3e\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x43\x00\x44\x00\x45\x00\x46\x00\x47\x00\x48\x00\x92\x00\x4a\x00\x91\x00\x00\x00\x00\x00\x4b\x00\x26\x00\x27\x00\x28\x00\x37\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x39\x00\x3a\x00\x7a\x00\x3c\x00\x3d\x00\x3e\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x43\x00\x44\x00\x45\x00\x46\x00\x47\x00\x48\x00\x00\x00\x4a\x00\x00\x00\x00\x00\x00\x00\x4b\x00\x26\x00\x27\x00\x28\x00\x37\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x39\x00\x3a\x00\x78\x00\x3c\x00\x3d\x00\x3e\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x43\x00\x44\x00\x45\x00\x46\x00\x47\x00\x48\x00\x00\x00\x4a\x00\x00\x00\x00\x00\x00\x00\x79\x00\x26\x00\x27\x00\x28\x00\x37\x00\x2f\x00\x30\x00\x68\x00\x31\x00\x32\x00\x00\x00\x33\x00\x00\x00\x00\x00\x00\x00\x39\x00\x3a\x00\x26\x00\x59\x00\x3d\x00\x3e\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x43\x00\x44\x00\x45\x00\x46\x00\x47\x00\x48\x00\x00\x00\x4a\x00\x00\x00\x00\x00\x00\x00\x4b\x00\x26\x00\x27\x00\x28\x00\x37\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x2c\x00\x00\x00\x00\x00\x39\x00\x3a\x00\x68\x00\x69\x00\x58\x00\x3e\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x43\x00\x44\x00\x45\x00\x46\x00\x47\x00\x48\x00\x00\x00\x4a\x00\x00\x00\x00\x00\x00\x00\x4b\x00\x26\x00\x27\x00\x28\x00\x37\x00\x00\x00\x00\x00\x6a\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x2c\x00\x00\x00\x39\x00\x3a\x00\x6b\x00\x6c\x00\x69\x00\x57\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x43\x00\x44\x00\x45\x00\x46\x00\x47\x00\x48\x00\x00\x00\x4a\x00\x00\x00\x00\x00\x00\x00\x4b\x00\x26\x00\x27\x00\x28\x00\x37\x00\x00\x00\x00\x00\x00\x00\x6a\x00\x00\x00\x00\x00\x00\x00\x00\x00\x2c\x00\x00\x00\x39\x00\x3a\x00\x93\x00\x6c\x00\x69\x00\x00\x00\x56\x00\x40\x00\x41\x00\x42\x00\x43\x00\x44\x00\x45\x00\x46\x00\x47\x00\x48\x00\x00\x00\x4a\x00\x00\x00\x00\x00\x00\x00\x4b\x00\x26\x00\x27\x00\x28\x00\x37\x00\x00\x00\x00\x00\x00\x00\x6a\x00\x00\x00\x00\x00\x00\x00\x00\x00\x2c\x00\x00\x00\x39\x00\x3a\x00\x95\x00\x6c\x00\x69\x00\x00\x00\x00\x00\x55\x00\x41\x00\x42\x00\x43\x00\x44\x00\x45\x00\x46\x00\x47\x00\x48\x00\x00\x00\x4a\x00\x00\x00\x00\x00\x00\x00\x4b\x00\x26\x00\x27\x00\x28\x00\x37\x00\x00\x00\x2f\x00\x30\x00\x6a\x00\x31\x00\x32\x00\x00\x00\x33\x00\x00\x00\x00\x00\x39\x00\x3a\x00\x00\x00\x26\x00\x26\x00\x27\x00\x28\x00\x37\x00\x54\x00\x42\x00\x43\x00\x44\x00\x45\x00\x46\x00\x47\x00\x48\x00\x00\x00\x4a\x00\x39\x00\x3a\x00\x00\x00\x4b\x00\x26\x00\x27\x00\x28\x00\x37\x00\x00\x00\x53\x00\x43\x00\x44\x00\x45\x00\x46\x00\x47\x00\x48\x00\x00\x00\x4a\x00\x39\x00\x3a\x00\x00\x00\x4b\x00\x26\x00\x27\x00\x28\x00\x37\x00\x00\x00\x00\x00\x52\x00\x44\x00\x45\x00\x46\x00\x47\x00\x48\x00\x00\x00\x4a\x00\x39\x00\x3a\x00\x00\x00\x4b\x00\x26\x00\x27\x00\x28\x00\x37\x00\x00\x00\x00\x00\x00\x00\x51\x00\x45\x00\x46\x00\x47\x00\x48\x00\x00\x00\x4a\x00\x39\x00\x5b\x00\x00\x00\x4b\x00\x26\x00\x27\x00\x28\x00\x37\x00\x00\x00\x00\x00\x00\x00\x00\x00\x45\x00\x46\x00\x47\x00\x48\x00\x00\x00\x4a\x00\x39\x00\x00\x00\x00\x00\x4b\x00\x26\x00\x27\x00\x28\x00\x37\x00\x00\x00\x00\x00\x00\x00\x00\x00\x50\x00\x46\x00\x47\x00\x48\x00\x00\x00\x4a\x00\x39\x00\x00\x00\x00\x00\x4b\x00\x26\x00\x27\x00\x28\x00\x37\x00\x00\x00\x00\x00\x00\x00\x00\x00\x8f\x00\x46\x00\x47\x00\x48\x00\x00\x00\x4a\x00\x39\x00\x00\x00\x00\x00\x4b\x00\x26\x00\x27\x00\x28\x00\x37\x00\x00\x00\x00\x00\x00\x00\x00\x00\x8e\x00\x46\x00\x47\x00\x48\x00\x00\x00\x4a\x00\x39\x00\x00\x00\x00\x00\x4b\x00\x26\x00\x27\x00\x28\x00\x37\x00\x00\x00\x26\x00\x27\x00\x28\x00\x37\x00\x4f\x00\x47\x00\x48\x00\x00\x00\x4a\x00\x39\x00\x00\x00\x00\x00\x4b\x00\x00\x00\x39\x00\x00\x00\x00\x00\x00\x00\x26\x00\x27\x00\x28\x00\x37\x00\x4d\x00\x4e\x00\x48\x00\x00\x00\x4a\x00\x00\x00\x00\x00\x4d\x00\x4b\x00\x4a\x00\x5c\x00\x00\x00\x00\x00\x4b\x00\x4d\x00\x62\x00\x00\x00\x00\x00\xc7\xff\x23\x00\x2b\x00\x2c\x00\x26\x00\xc7\xff\x4d\x00\x00\x00\x00\x00\x4a\x00\x00\x00\x62\x00\x00\x00\x4b\x00\x4d\x00\x23\x00\x2b\x00\x2c\x00\x26\x00\xc7\xff\x00\x00\x62\x00\x00\x00\x4d\x00\xc7\xff\x23\x00\x2b\x00\x2c\x00\x26\x00\x62\x00\x00\x00\x00\x00\x00\x00\x23\x00\x2b\x00\x2c\x00\x26\x00\x4d\x00\x00\x00\x00\x00\x00\x00\x7c\x00\x23\x00\x2b\x00\x2c\x00\x26\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x23\x00\x2b\x00\x2c\x00\x26\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyReduceArr = Happy_Data_Array.array (33, 97) [
	(33 , happyReduce_33),
	(34 , happyReduce_34),
	(35 , happyReduce_35),
	(36 , happyReduce_36),
	(37 , happyReduce_37),
	(38 , happyReduce_38),
	(39 , happyReduce_39),
	(40 , happyReduce_40),
	(41 , happyReduce_41),
	(42 , happyReduce_42),
	(43 , happyReduce_43),
	(44 , happyReduce_44),
	(45 , happyReduce_45),
	(46 , happyReduce_46),
	(47 , happyReduce_47),
	(48 , happyReduce_48),
	(49 , happyReduce_49),
	(50 , happyReduce_50),
	(51 , happyReduce_51),
	(52 , happyReduce_52),
	(53 , happyReduce_53),
	(54 , happyReduce_54),
	(55 , happyReduce_55),
	(56 , happyReduce_56),
	(57 , happyReduce_57),
	(58 , happyReduce_58),
	(59 , happyReduce_59),
	(60 , happyReduce_60),
	(61 , happyReduce_61),
	(62 , happyReduce_62),
	(63 , happyReduce_63),
	(64 , happyReduce_64),
	(65 , happyReduce_65),
	(66 , happyReduce_66),
	(67 , happyReduce_67),
	(68 , happyReduce_68),
	(69 , happyReduce_69),
	(70 , happyReduce_70),
	(71 , happyReduce_71),
	(72 , happyReduce_72),
	(73 , happyReduce_73),
	(74 , happyReduce_74),
	(75 , happyReduce_75),
	(76 , happyReduce_76),
	(77 , happyReduce_77),
	(78 , happyReduce_78),
	(79 , happyReduce_79),
	(80 , happyReduce_80),
	(81 , happyReduce_81),
	(82 , happyReduce_82),
	(83 , happyReduce_83),
	(84 , happyReduce_84),
	(85 , happyReduce_85),
	(86 , happyReduce_86),
	(87 , happyReduce_87),
	(88 , happyReduce_88),
	(89 , happyReduce_89),
	(90 , happyReduce_90),
	(91 , happyReduce_91),
	(92 , happyReduce_92),
	(93 , happyReduce_93),
	(94 , happyReduce_94),
	(95 , happyReduce_95),
	(96 , happyReduce_96),
	(97 , happyReduce_97)
	]

happy_n_terms = 25 :: Prelude.Int
happy_n_nonterms = 37 :: Prelude.Int

happyReduce_33 = happySpecReduce_1  0# happyReduction_33
happyReduction_33 happy_x_1
	 =  case happyOutTok happy_x_1 of { (PT _ (T_Chars happy_var_1)) -> 
	happyIn36
		 (AbsTest.Chars happy_var_1
	)}

happyReduce_34 = happySpecReduce_1  1# happyReduction_34
happyReduction_34 happy_x_1
	 =  case happyOutTok happy_x_1 of { (PT _ (T_Strings happy_var_1)) -> 
	happyIn37
		 (AbsTest.Strings happy_var_1
	)}

happyReduce_35 = happySpecReduce_1  2# happyReduction_35
happyReduction_35 happy_x_1
	 =  case happyOutTok happy_x_1 of { (PT _ (T_Integers happy_var_1)) -> 
	happyIn38
		 (AbsTest.Integers happy_var_1
	)}

happyReduce_36 = happySpecReduce_1  3# happyReduction_36
happyReduction_36 happy_x_1
	 =  case happyOutTok happy_x_1 of { (PT _ (T_Id happy_var_1)) -> 
	happyIn39
		 (AbsTest.Id happy_var_1
	)}

happyReduce_37 = happySpecReduce_1  4# happyReduction_37
happyReduction_37 happy_x_1
	 =  case happyOut41 happy_x_1 of { (HappyWrap41 happy_var_1) -> 
	happyIn40
		 (AbsTest.PDefs happy_var_1
	)}

happyReduce_38 = happySpecReduce_0  5# happyReduction_38
happyReduction_38  =  happyIn41
		 ([]
	)

happyReduce_39 = happySpecReduce_2  5# happyReduction_39
happyReduction_39 happy_x_2
	happy_x_1
	 =  case happyOut42 happy_x_1 of { (HappyWrap42 happy_var_1) -> 
	case happyOut41 happy_x_2 of { (HappyWrap41 happy_var_2) -> 
	happyIn41
		 ((:) happy_var_1 happy_var_2
	)}}

happyReduce_40 = happyReduce 8# 6# happyReduction_40
happyReduction_40 (happy_x_8 `HappyStk`
	happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut70 happy_x_1 of { (HappyWrap70 happy_var_1) -> 
	case happyOut39 happy_x_2 of { (HappyWrap39 happy_var_2) -> 
	case happyOut43 happy_x_4 of { (HappyWrap43 happy_var_4) -> 
	case happyOut49 happy_x_7 of { (HappyWrap49 happy_var_7) -> 
	happyIn42
		 (AbsTest.DFun happy_var_1 happy_var_2 happy_var_4 happy_var_7
	) `HappyStk` happyRest}}}}

happyReduce_41 = happySpecReduce_0  7# happyReduction_41
happyReduction_41  =  happyIn43
		 ([]
	)

happyReduce_42 = happySpecReduce_1  7# happyReduction_42
happyReduction_42 happy_x_1
	 =  case happyOut44 happy_x_1 of { (HappyWrap44 happy_var_1) -> 
	happyIn43
		 ((:[]) happy_var_1
	)}

happyReduce_43 = happySpecReduce_3  7# happyReduction_43
happyReduction_43 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut44 happy_x_1 of { (HappyWrap44 happy_var_1) -> 
	case happyOut43 happy_x_3 of { (HappyWrap43 happy_var_3) -> 
	happyIn43
		 ((:) happy_var_1 happy_var_3
	)}}

happyReduce_44 = happySpecReduce_1  8# happyReduction_44
happyReduction_44 happy_x_1
	 =  case happyOut70 happy_x_1 of { (HappyWrap70 happy_var_1) -> 
	happyIn44
		 (AbsTest.ADeclType happy_var_1
	)}

happyReduce_45 = happySpecReduce_2  8# happyReduction_45
happyReduction_45 happy_x_2
	happy_x_1
	 =  case happyOut70 happy_x_1 of { (HappyWrap70 happy_var_1) -> 
	case happyOut39 happy_x_2 of { (HappyWrap39 happy_var_2) -> 
	happyIn44
		 (AbsTest.ADeclId happy_var_1 happy_var_2
	)}}

happyReduce_46 = happySpecReduce_3  8# happyReduction_46
happyReduction_46 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut70 happy_x_1 of { (HappyWrap70 happy_var_1) -> 
	case happyOut39 happy_x_2 of { (HappyWrap39 happy_var_2) -> 
	case happyOut46 happy_x_3 of { (HappyWrap46 happy_var_3) -> 
	happyIn44
		 (AbsTest.ADeclInit happy_var_1 happy_var_2 happy_var_3
	)}}}

happyReduce_47 = happySpecReduce_3  8# happyReduction_47
happyReduction_47 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut45 happy_x_1 of { (HappyWrap45 happy_var_1) -> 
	case happyOut70 happy_x_2 of { (HappyWrap70 happy_var_2) -> 
	case happyOut39 happy_x_3 of { (HappyWrap39 happy_var_3) -> 
	happyIn44
		 (AbsTest.ADeclConst happy_var_1 happy_var_2 happy_var_3
	)}}}

happyReduce_48 = happySpecReduce_1  9# happyReduction_48
happyReduction_48 happy_x_1
	 =  happyIn45
		 (AbsTest.Cst
	)

happyReduce_49 = happySpecReduce_2  10# happyReduction_49
happyReduction_49 happy_x_2
	happy_x_1
	 =  case happyOut52 happy_x_2 of { (HappyWrap52 happy_var_2) -> 
	happyIn46
		 (AbsTest.InitExp happy_var_2
	)}

happyReduce_50 = happySpecReduce_2  10# happyReduction_50
happyReduction_50 happy_x_2
	happy_x_1
	 =  case happyOut71 happy_x_2 of { (HappyWrap71 happy_var_2) -> 
	happyIn46
		 (AbsTest.InitLiteral happy_var_2
	)}

happyReduce_51 = happySpecReduce_2  11# happyReduction_51
happyReduction_51 happy_x_2
	happy_x_1
	 =  case happyOut52 happy_x_1 of { (HappyWrap52 happy_var_1) -> 
	happyIn47
		 (AbsTest.Sexp happy_var_1
	)}

happyReduce_52 = happySpecReduce_2  11# happyReduction_52
happyReduction_52 happy_x_2
	happy_x_1
	 =  case happyOut48 happy_x_1 of { (HappyWrap48 happy_var_1) -> 
	happyIn47
		 (AbsTest.SVarDecl happy_var_1
	)}

happyReduce_53 = happySpecReduce_3  11# happyReduction_53
happyReduction_53 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut52 happy_x_2 of { (HappyWrap52 happy_var_2) -> 
	happyIn47
		 (AbsTest.SReturn happy_var_2
	)}

happyReduce_54 = happySpecReduce_2  11# happyReduction_54
happyReduction_54 happy_x_2
	happy_x_1
	 =  happyIn47
		 (AbsTest.SReturnVoid
	)

happyReduce_55 = happySpecReduce_0  12# happyReduction_55
happyReduction_55  =  happyIn48
		 (AbsTest.VarDec
	)

happyReduce_56 = happySpecReduce_0  13# happyReduction_56
happyReduction_56  =  happyIn49
		 ([]
	)

happyReduce_57 = happySpecReduce_2  13# happyReduction_57
happyReduction_57 happy_x_2
	happy_x_1
	 =  case happyOut47 happy_x_1 of { (HappyWrap47 happy_var_1) -> 
	case happyOut49 happy_x_2 of { (HappyWrap49 happy_var_2) -> 
	happyIn49
		 ((:) happy_var_1 happy_var_2
	)}}

happyReduce_58 = happySpecReduce_1  14# happyReduction_58
happyReduction_58 happy_x_1
	 =  case happyOut71 happy_x_1 of { (HappyWrap71 happy_var_1) -> 
	happyIn50
		 (AbsTest.Elit happy_var_1
	)}

happyReduce_59 = happySpecReduce_1  14# happyReduction_59
happyReduction_59 happy_x_1
	 =  case happyOut67 happy_x_1 of { (HappyWrap67 happy_var_1) -> 
	happyIn50
		 (AbsTest.EQual happy_var_1
	)}

happyReduce_60 = happySpecReduce_3  14# happyReduction_60
happyReduction_60 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut52 happy_x_2 of { (HappyWrap52 happy_var_2) -> 
	happyIn50
		 (happy_var_2
	)}

happyReduce_61 = happySpecReduce_3  15# happyReduction_61
happyReduction_61 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut51 happy_x_1 of { (HappyWrap51 happy_var_1) -> 
	case happyOut62 happy_x_3 of { (HappyWrap62 happy_var_3) -> 
	happyIn51
		 (AbsTest.EShiftR happy_var_1 happy_var_3
	)}}

happyReduce_62 = happySpecReduce_3  15# happyReduction_62
happyReduction_62 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut51 happy_x_1 of { (HappyWrap51 happy_var_1) -> 
	case happyOut62 happy_x_3 of { (HappyWrap62 happy_var_3) -> 
	happyIn51
		 (AbsTest.EShiftL happy_var_1 happy_var_3
	)}}

happyReduce_63 = happySpecReduce_1  15# happyReduction_63
happyReduction_63 happy_x_1
	 =  case happyOut62 happy_x_1 of { (HappyWrap62 happy_var_1) -> 
	happyIn51
		 (happy_var_1
	)}

happyReduce_64 = happySpecReduce_1  16# happyReduction_64
happyReduction_64 happy_x_1
	 =  case happyOut53 happy_x_1 of { (HappyWrap53 happy_var_1) -> 
	happyIn52
		 (happy_var_1
	)}

happyReduce_65 = happySpecReduce_1  17# happyReduction_65
happyReduction_65 happy_x_1
	 =  case happyOut54 happy_x_1 of { (HappyWrap54 happy_var_1) -> 
	happyIn53
		 (happy_var_1
	)}

happyReduce_66 = happySpecReduce_1  18# happyReduction_66
happyReduction_66 happy_x_1
	 =  case happyOut55 happy_x_1 of { (HappyWrap55 happy_var_1) -> 
	happyIn54
		 (happy_var_1
	)}

happyReduce_67 = happySpecReduce_1  19# happyReduction_67
happyReduction_67 happy_x_1
	 =  case happyOut56 happy_x_1 of { (HappyWrap56 happy_var_1) -> 
	happyIn55
		 (happy_var_1
	)}

happyReduce_68 = happySpecReduce_1  20# happyReduction_68
happyReduction_68 happy_x_1
	 =  case happyOut57 happy_x_1 of { (HappyWrap57 happy_var_1) -> 
	happyIn56
		 (happy_var_1
	)}

happyReduce_69 = happySpecReduce_1  21# happyReduction_69
happyReduction_69 happy_x_1
	 =  case happyOut58 happy_x_1 of { (HappyWrap58 happy_var_1) -> 
	happyIn57
		 (happy_var_1
	)}

happyReduce_70 = happySpecReduce_1  22# happyReduction_70
happyReduction_70 happy_x_1
	 =  case happyOut59 happy_x_1 of { (HappyWrap59 happy_var_1) -> 
	happyIn58
		 (happy_var_1
	)}

happyReduce_71 = happySpecReduce_1  23# happyReduction_71
happyReduction_71 happy_x_1
	 =  case happyOut60 happy_x_1 of { (HappyWrap60 happy_var_1) -> 
	happyIn59
		 (happy_var_1
	)}

happyReduce_72 = happySpecReduce_1  24# happyReduction_72
happyReduction_72 happy_x_1
	 =  case happyOut61 happy_x_1 of { (HappyWrap61 happy_var_1) -> 
	happyIn60
		 (happy_var_1
	)}

happyReduce_73 = happySpecReduce_1  25# happyReduction_73
happyReduction_73 happy_x_1
	 =  case happyOut51 happy_x_1 of { (HappyWrap51 happy_var_1) -> 
	happyIn61
		 (happy_var_1
	)}

happyReduce_74 = happySpecReduce_1  26# happyReduction_74
happyReduction_74 happy_x_1
	 =  case happyOut63 happy_x_1 of { (HappyWrap63 happy_var_1) -> 
	happyIn62
		 (happy_var_1
	)}

happyReduce_75 = happySpecReduce_1  27# happyReduction_75
happyReduction_75 happy_x_1
	 =  case happyOut64 happy_x_1 of { (HappyWrap64 happy_var_1) -> 
	happyIn63
		 (happy_var_1
	)}

happyReduce_76 = happySpecReduce_1  28# happyReduction_76
happyReduction_76 happy_x_1
	 =  case happyOut65 happy_x_1 of { (HappyWrap65 happy_var_1) -> 
	happyIn64
		 (happy_var_1
	)}

happyReduce_77 = happySpecReduce_1  29# happyReduction_77
happyReduction_77 happy_x_1
	 =  case happyOut50 happy_x_1 of { (HappyWrap50 happy_var_1) -> 
	happyIn65
		 (happy_var_1
	)}

happyReduce_78 = happySpecReduce_0  30# happyReduction_78
happyReduction_78  =  happyIn66
		 ([]
	)

happyReduce_79 = happySpecReduce_1  30# happyReduction_79
happyReduction_79 happy_x_1
	 =  case happyOut52 happy_x_1 of { (HappyWrap52 happy_var_1) -> 
	happyIn66
		 ((:[]) happy_var_1
	)}

happyReduce_80 = happySpecReduce_3  30# happyReduction_80
happyReduction_80 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut52 happy_x_1 of { (HappyWrap52 happy_var_1) -> 
	case happyOut66 happy_x_3 of { (HappyWrap66 happy_var_3) -> 
	happyIn66
		 ((:) happy_var_1 happy_var_3
	)}}

happyReduce_81 = happySpecReduce_1  31# happyReduction_81
happyReduction_81 happy_x_1
	 =  case happyOut39 happy_x_1 of { (HappyWrap39 happy_var_1) -> 
	happyIn67
		 (AbsTest.QualConstId happy_var_1
	)}

happyReduce_82 = happySpecReduce_3  31# happyReduction_82
happyReduction_82 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut67 happy_x_1 of { (HappyWrap67 happy_var_1) -> 
	case happyOut39 happy_x_3 of { (HappyWrap39 happy_var_3) -> 
	happyIn67
		 (AbsTest.QualConstRecId happy_var_1 happy_var_3
	)}}

happyReduce_83 = happySpecReduce_3  31# happyReduction_83
happyReduction_83 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut67 happy_x_1 of { (HappyWrap67 happy_var_1) -> 
	case happyOut68 happy_x_3 of { (HappyWrap68 happy_var_3) -> 
	happyIn67
		 (AbsTest.QualConstTem happy_var_1 happy_var_3
	)}}

happyReduce_84 = happyReduce 4# 32# happyReduction_84
happyReduction_84 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut39 happy_x_1 of { (HappyWrap39 happy_var_1) -> 
	case happyOut69 happy_x_3 of { (HappyWrap69 happy_var_3) -> 
	happyIn68
		 (AbsTest.TempInst happy_var_1 happy_var_3
	) `HappyStk` happyRest}}

happyReduce_85 = happySpecReduce_1  33# happyReduction_85
happyReduction_85 happy_x_1
	 =  case happyOut70 happy_x_1 of { (HappyWrap70 happy_var_1) -> 
	happyIn69
		 (AbsTest.TypList happy_var_1
	)}

happyReduce_86 = happySpecReduce_3  33# happyReduction_86
happyReduction_86 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut70 happy_x_1 of { (HappyWrap70 happy_var_1) -> 
	case happyOut69 happy_x_3 of { (HappyWrap69 happy_var_3) -> 
	happyIn69
		 (AbsTest.TypeListRec happy_var_1 happy_var_3
	)}}

happyReduce_87 = happySpecReduce_1  34# happyReduction_87
happyReduction_87 happy_x_1
	 =  happyIn70
		 (AbsTest.Tbool
	)

happyReduce_88 = happySpecReduce_1  34# happyReduction_88
happyReduction_88 happy_x_1
	 =  happyIn70
		 (AbsTest.Tdouble
	)

happyReduce_89 = happySpecReduce_1  34# happyReduction_89
happyReduction_89 happy_x_1
	 =  happyIn70
		 (AbsTest.Tint
	)

happyReduce_90 = happySpecReduce_1  34# happyReduction_90
happyReduction_90 happy_x_1
	 =  happyIn70
		 (AbsTest.Tvoid
	)

happyReduce_91 = happySpecReduce_1  34# happyReduction_91
happyReduction_91 happy_x_1
	 =  happyIn70
		 (AbsTest.Tchar
	)

happyReduce_92 = happySpecReduce_1  34# happyReduction_92
happyReduction_92 happy_x_1
	 =  case happyOut39 happy_x_1 of { (HappyWrap39 happy_var_1) -> 
	happyIn70
		 (AbsTest.PlainIdent happy_var_1
	)}

happyReduce_93 = happySpecReduce_1  35# happyReduction_93
happyReduction_93 happy_x_1
	 =  case happyOut38 happy_x_1 of { (HappyWrap38 happy_var_1) -> 
	happyIn71
		 (AbsTest.LiteralIntegers happy_var_1
	)}

happyReduce_94 = happySpecReduce_1  35# happyReduction_94
happyReduction_94 happy_x_1
	 =  case happyOut37 happy_x_1 of { (HappyWrap37 happy_var_1) -> 
	happyIn71
		 (AbsTest.LiteralStrings happy_var_1
	)}

happyReduce_95 = happySpecReduce_1  35# happyReduction_95
happyReduction_95 happy_x_1
	 =  case happyOut36 happy_x_1 of { (HappyWrap36 happy_var_1) -> 
	happyIn71
		 (AbsTest.LiteralChars happy_var_1
	)}

happyReduce_96 = happySpecReduce_1  36# happyReduction_96
happyReduction_96 happy_x_1
	 =  case happyOut39 happy_x_1 of { (HappyWrap39 happy_var_1) -> 
	happyIn72
		 ((:[]) happy_var_1
	)}

happyReduce_97 = happySpecReduce_3  36# happyReduction_97
happyReduction_97 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut39 happy_x_1 of { (HappyWrap39 happy_var_1) -> 
	case happyOut72 happy_x_3 of { (HappyWrap72 happy_var_3) -> 
	happyIn72
		 ((:) happy_var_1 happy_var_3
	)}}

happyNewToken action sts stk [] =
	happyDoAction 24# notHappyAtAll action sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = happyDoAction i tk action sts stk tks in
	case tk of {
	PT _ (TS _ 1) -> cont 1#;
	PT _ (TS _ 2) -> cont 2#;
	PT _ (TS _ 3) -> cont 3#;
	PT _ (TS _ 4) -> cont 4#;
	PT _ (TS _ 5) -> cont 5#;
	PT _ (TS _ 6) -> cont 6#;
	PT _ (TS _ 7) -> cont 7#;
	PT _ (TS _ 8) -> cont 8#;
	PT _ (TS _ 9) -> cont 9#;
	PT _ (TS _ 10) -> cont 10#;
	PT _ (TS _ 11) -> cont 11#;
	PT _ (TS _ 12) -> cont 12#;
	PT _ (TS _ 13) -> cont 13#;
	PT _ (TS _ 14) -> cont 14#;
	PT _ (TS _ 15) -> cont 15#;
	PT _ (TS _ 16) -> cont 16#;
	PT _ (TS _ 17) -> cont 17#;
	PT _ (TS _ 18) -> cont 18#;
	PT _ (TS _ 19) -> cont 19#;
	PT _ (T_Chars happy_dollar_dollar) -> cont 20#;
	PT _ (T_Strings happy_dollar_dollar) -> cont 21#;
	PT _ (T_Integers happy_dollar_dollar) -> cont 22#;
	PT _ (T_Id happy_dollar_dollar) -> cont 23#;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 24# tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

happyThen :: () => Err a -> (a -> Err b) -> Err b
happyThen = ((>>=))
happyReturn :: () => a -> Err a
happyReturn = (return)
happyThen1 m k tks = ((>>=)) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> Err a
happyReturn1 = \a tks -> (return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> Err a
happyError' = (\(tokens, _) -> happyError tokens)
pProgram tks = happySomeParser where
 happySomeParser = happyThen (happyParse 0# tks) (\x -> happyReturn (let {(HappyWrap40 x') = happyOut40 x} in x'))

pListDef tks = happySomeParser where
 happySomeParser = happyThen (happyParse 1# tks) (\x -> happyReturn (let {(HappyWrap41 x') = happyOut41 x} in x'))

pDef tks = happySomeParser where
 happySomeParser = happyThen (happyParse 2# tks) (\x -> happyReturn (let {(HappyWrap42 x') = happyOut42 x} in x'))

pListArg tks = happySomeParser where
 happySomeParser = happyThen (happyParse 3# tks) (\x -> happyReturn (let {(HappyWrap43 x') = happyOut43 x} in x'))

pArg tks = happySomeParser where
 happySomeParser = happyThen (happyParse 4# tks) (\x -> happyReturn (let {(HappyWrap44 x') = happyOut44 x} in x'))

pConst tks = happySomeParser where
 happySomeParser = happyThen (happyParse 5# tks) (\x -> happyReturn (let {(HappyWrap45 x') = happyOut45 x} in x'))

pInitialization tks = happySomeParser where
 happySomeParser = happyThen (happyParse 6# tks) (\x -> happyReturn (let {(HappyWrap46 x') = happyOut46 x} in x'))

pStm tks = happySomeParser where
 happySomeParser = happyThen (happyParse 7# tks) (\x -> happyReturn (let {(HappyWrap47 x') = happyOut47 x} in x'))

pVar tks = happySomeParser where
 happySomeParser = happyThen (happyParse 8# tks) (\x -> happyReturn (let {(HappyWrap48 x') = happyOut48 x} in x'))

pListStm tks = happySomeParser where
 happySomeParser = happyThen (happyParse 9# tks) (\x -> happyReturn (let {(HappyWrap49 x') = happyOut49 x} in x'))

pExp15 tks = happySomeParser where
 happySomeParser = happyThen (happyParse 10# tks) (\x -> happyReturn (let {(HappyWrap50 x') = happyOut50 x} in x'))

pExp10 tks = happySomeParser where
 happySomeParser = happyThen (happyParse 11# tks) (\x -> happyReturn (let {(HappyWrap51 x') = happyOut51 x} in x'))

pExp tks = happySomeParser where
 happySomeParser = happyThen (happyParse 12# tks) (\x -> happyReturn (let {(HappyWrap52 x') = happyOut52 x} in x'))

pExp1 tks = happySomeParser where
 happySomeParser = happyThen (happyParse 13# tks) (\x -> happyReturn (let {(HappyWrap53 x') = happyOut53 x} in x'))

pExp2 tks = happySomeParser where
 happySomeParser = happyThen (happyParse 14# tks) (\x -> happyReturn (let {(HappyWrap54 x') = happyOut54 x} in x'))

pExp3 tks = happySomeParser where
 happySomeParser = happyThen (happyParse 15# tks) (\x -> happyReturn (let {(HappyWrap55 x') = happyOut55 x} in x'))

pExp4 tks = happySomeParser where
 happySomeParser = happyThen (happyParse 16# tks) (\x -> happyReturn (let {(HappyWrap56 x') = happyOut56 x} in x'))

pExp5 tks = happySomeParser where
 happySomeParser = happyThen (happyParse 17# tks) (\x -> happyReturn (let {(HappyWrap57 x') = happyOut57 x} in x'))

pExp6 tks = happySomeParser where
 happySomeParser = happyThen (happyParse 18# tks) (\x -> happyReturn (let {(HappyWrap58 x') = happyOut58 x} in x'))

pExp7 tks = happySomeParser where
 happySomeParser = happyThen (happyParse 19# tks) (\x -> happyReturn (let {(HappyWrap59 x') = happyOut59 x} in x'))

pExp8 tks = happySomeParser where
 happySomeParser = happyThen (happyParse 20# tks) (\x -> happyReturn (let {(HappyWrap60 x') = happyOut60 x} in x'))

pExp9 tks = happySomeParser where
 happySomeParser = happyThen (happyParse 21# tks) (\x -> happyReturn (let {(HappyWrap61 x') = happyOut61 x} in x'))

pExp11 tks = happySomeParser where
 happySomeParser = happyThen (happyParse 22# tks) (\x -> happyReturn (let {(HappyWrap62 x') = happyOut62 x} in x'))

pExp12 tks = happySomeParser where
 happySomeParser = happyThen (happyParse 23# tks) (\x -> happyReturn (let {(HappyWrap63 x') = happyOut63 x} in x'))

pExp13 tks = happySomeParser where
 happySomeParser = happyThen (happyParse 24# tks) (\x -> happyReturn (let {(HappyWrap64 x') = happyOut64 x} in x'))

pExp14 tks = happySomeParser where
 happySomeParser = happyThen (happyParse 25# tks) (\x -> happyReturn (let {(HappyWrap65 x') = happyOut65 x} in x'))

pListExp tks = happySomeParser where
 happySomeParser = happyThen (happyParse 26# tks) (\x -> happyReturn (let {(HappyWrap66 x') = happyOut66 x} in x'))

pQualConst tks = happySomeParser where
 happySomeParser = happyThen (happyParse 27# tks) (\x -> happyReturn (let {(HappyWrap67 x') = happyOut67 x} in x'))

pTemplateInst tks = happySomeParser where
 happySomeParser = happyThen (happyParse 28# tks) (\x -> happyReturn (let {(HappyWrap68 x') = happyOut68 x} in x'))

pTypeList tks = happySomeParser where
 happySomeParser = happyThen (happyParse 29# tks) (\x -> happyReturn (let {(HappyWrap69 x') = happyOut69 x} in x'))

pType tks = happySomeParser where
 happySomeParser = happyThen (happyParse 30# tks) (\x -> happyReturn (let {(HappyWrap70 x') = happyOut70 x} in x'))

pLiteral tks = happySomeParser where
 happySomeParser = happyThen (happyParse 31# tks) (\x -> happyReturn (let {(HappyWrap71 x') = happyOut71 x} in x'))

pListId tks = happySomeParser where
 happySomeParser = happyThen (happyParse 32# tks) (\x -> happyReturn (let {(HappyWrap72 x') = happyOut72 x} in x'))

happySeq = happyDontSeq


type Err = Either String

happyError :: [Token] -> Err a
happyError ts = Left $
  "syntax error at " ++ tokenPos ts ++
  case ts of
    []      -> []
    [Err _] -> " due to lexer error"
    t:_     -> " before `" ++ (prToken t) ++ "'"

myLexer :: String -> [Token]
myLexer = tokens
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $













-- Do not remove this comment. Required to fix CPP parsing when using GCC and a clang-compiled alex.
#if __GLASGOW_HASKELL__ > 706
#define LT(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.<# m)) :: Prelude.Bool)
#define GTE(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.>=# m)) :: Prelude.Bool)
#define EQ(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.==# m)) :: Prelude.Bool)
#else
#define LT(n,m) (n Happy_GHC_Exts.<# m)
#define GTE(n,m) (n Happy_GHC_Exts.>=# m)
#define EQ(n,m) (n Happy_GHC_Exts.==# m)
#endif



















data Happy_IntList = HappyCons Happy_GHC_Exts.Int# Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept 0# tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
        (happyTcHack j (happyTcHack st)) (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action



happyDoAction i tk st
        = {- nothing -}
          case action of
                0#           -> {- nothing -}
                                     happyFail (happyExpListPerState ((Happy_GHC_Exts.I# (st)) :: Prelude.Int)) i tk st
                -1#          -> {- nothing -}
                                     happyAccept i tk st
                n | LT(n,(0# :: Happy_GHC_Exts.Int#)) -> {- nothing -}
                                                   (happyReduceArr Happy_Data_Array.! rule) i tk st
                                                   where rule = (Happy_GHC_Exts.I# ((Happy_GHC_Exts.negateInt# ((n Happy_GHC_Exts.+# (1# :: Happy_GHC_Exts.Int#))))))
                n                 -> {- nothing -}
                                     happyShift new_state i tk st
                                     where new_state = (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#))
   where off    = happyAdjustOffset (indexShortOffAddr happyActOffsets st)
         off_i  = (off Happy_GHC_Exts.+# i)
         check  = if GTE(off_i,(0# :: Happy_GHC_Exts.Int#))
                  then EQ(indexShortOffAddr happyCheck off_i, i)
                  else Prelude.False
         action
          | check     = indexShortOffAddr happyTable off_i
          | Prelude.otherwise = indexShortOffAddr happyDefActions st




indexShortOffAddr (HappyA# arr) off =
        Happy_GHC_Exts.narrow16Int# i
  where
        i = Happy_GHC_Exts.word2Int# (Happy_GHC_Exts.or# (Happy_GHC_Exts.uncheckedShiftL# high 8#) low)
        high = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr (off' Happy_GHC_Exts.+# 1#)))
        low  = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr off'))
        off' = off Happy_GHC_Exts.*# 2#




{-# INLINE happyLt #-}
happyLt x y = LT(x,y)


readArrayBit arr bit =
    Bits.testBit (Happy_GHC_Exts.I# (indexShortOffAddr arr ((unbox_int bit) `Happy_GHC_Exts.iShiftRA#` 4#))) (bit `Prelude.mod` 16)
  where unbox_int (Happy_GHC_Exts.I# x) = x






data HappyAddr = HappyA# Happy_GHC_Exts.Addr#


-----------------------------------------------------------------------------
-- HappyState data type (not arrays)













-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state 0# tk st sts stk@(x `HappyStk` _) =
     let i = (case Happy_GHC_Exts.unsafeCoerce# x of { (Happy_GHC_Exts.I# (i)) -> i }) in
--     trace "shifting the error token" $
     happyDoAction i tk new_state (HappyCons (st) (sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state (HappyCons (st) (sts)) ((happyInTok (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_0 nt fn j tk st@((action)) sts stk
     = happyGoto nt j tk st (HappyCons (st) (sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@((HappyCons (st@(action)) (_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_2 nt fn j tk _ (HappyCons (_) (sts@((HappyCons (st@(action)) (_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_3 nt fn j tk _ (HappyCons (_) ((HappyCons (_) (sts@((HappyCons (st@(action)) (_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) sts of
         sts1@((HappyCons (st1@(action)) (_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (happyGoto nt j tk st1 sts1 r)

happyMonadReduce k nt fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons (st) (sts)) of
        sts1@((HappyCons (st1@(action)) (_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> happyGoto nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons (st) (sts)) of
        sts1@((HappyCons (st1@(action)) (_))) ->
         let drop_stk = happyDropStk k stk

             off = happyAdjustOffset (indexShortOffAddr happyGotoOffsets st1)
             off_i = (off Happy_GHC_Exts.+# nt)
             new_state = indexShortOffAddr happyTable off_i




          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop 0# l = l
happyDrop n (HappyCons (_) (t)) = happyDrop (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) t

happyDropStk 0# l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Happy_GHC_Exts.-# (1#::Happy_GHC_Exts.Int#)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction


happyGoto nt j tk st = 
   {- nothing -}
   happyDoAction j tk new_state
   where off = happyAdjustOffset (indexShortOffAddr happyGotoOffsets st)
         off_i = (off Happy_GHC_Exts.+# nt)
         new_state = indexShortOffAddr happyTable off_i




-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist 0# tk old_st _ stk@(x `HappyStk` _) =
     let i = (case Happy_GHC_Exts.unsafeCoerce# x of { (Happy_GHC_Exts.I# (i)) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (action) sts stk =
--      trace "entering error recovery" $
        happyDoAction 0# tk action sts ((Happy_GHC_Exts.unsafeCoerce# (Happy_GHC_Exts.I# (i))) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions


happyTcHack :: Happy_GHC_Exts.Int# -> a -> a
happyTcHack x y = y
{-# INLINE happyTcHack #-}


-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.


{-# NOINLINE happyDoAction #-}
{-# NOINLINE happyTable #-}
{-# NOINLINE happyCheck #-}
{-# NOINLINE happyActOffsets #-}
{-# NOINLINE happyGotoOffsets #-}
{-# NOINLINE happyDefActions #-}

{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.

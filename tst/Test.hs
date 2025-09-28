--
-- Test
-- ⚠

import Test.HUnit (Counts, Test (TestList), runTestTT)
import qualified System.Filer.Fiso.ModeThinkerUT as System_Filer_Fiso_ModeThinkerUT (testList)
import qualified System.Filer.Fiso.PathReaderUT as System_Filer_Fiso_PathReaderUT (testList)
import qualified Text.Markdown.Writing.AElementsUT as Text_Markdown_Writing_AElementsUT (testList)
import qualified Text.Markdown.Writing.AElementzUT as Text_Markdown_Writing_AElementzUT (testList)
import qualified Text.Markdown.Writing.EElementsUT as Text_Markdown_Writing_EElementsUT (testList)
import qualified Text.Markdown.Writing.IElementsUT as Text_Markdown_Writing_IElementsUT (testList)
import qualified Text.Markdown.Writing.OElementsUT as Text_Markdown_Writing_OElementsUT (testList)
import qualified System.ExiterIT as System_ExiterIT (testList)
import qualified System.Filer.ExceptionIT as System_Filer_ExceptionIT (testList)
import qualified System.Filer.File.CreatorIT as System_Filer_File_CreatorIT (testList)
import qualified System.Filer.File.DeleterIT as System_Filer_File_DeleterIT (testList)
import qualified System.Filer.File.RecreatorIT as System_Filer_File_RecreatorIT (testList)
import qualified System.Filer.File.ReviewerIT as System_Filer_File_ReviewerIT (testList)
import qualified System.Filer.File.UpdaterIT as System_Filer_File_UpdaterIT (testList)
import qualified System.Filer.Fiso.FileCheckerIT as System_Filer_Fiso_FileCheckerIT (testList)
import qualified System.Filer.Fiso.FileOffsetterIT as System_Filer_Fiso_FileOffsetterIT (testList)
import qualified System.Filer.Fiso.ModeReaderIT as System_Filer_Fiso_ModeReaderIT (testList)
import qualified System.Filer.Fiso.ModeWriterIT as System_Filer_Fiso_ModeWriterIT (testList)
import qualified System.Filer.Fiso.TypeReaderIT as System_Filer_Fiso_TypeReaderIT (testList)
import qualified System.Filer.Fold.CreatorIT as System_Filer_Fold_CreatorIT (testList)
import qualified System.Filer.Fold.DeleterIT as System_Filer_Fold_DeleterIT (testList)
import qualified System.Filer.Link.CreatorIT as System_Filer_Link_CreatorIT (testList)
import qualified System.Filer.Link.DeleterIT as System_Filer_Link_DeleterIT (testList)
import qualified System.Filer.Link.RecreatorIT as System_Filer_Link_RecreatorIT (testList)
import qualified System.Filer.Link.ReviewerIT as System_Filer_Link_ReviewerIT (testList)
import qualified Text.Markdown.Reading.AElementsIT as Text_Markdown_Reading_AElementsIT (testList)
import qualified Text.Markdown.Reading.AElementzIT as Text_Markdown_Reading_AElementzIT (testList)
import qualified Text.Markdown.Reading.EElementsIT as Text_Markdown_Reading_EElementsIT (testList)
import qualified Text.Markdown.Reading.FileContIT as Text_Markdown_Reading_FileContIT (testList)
import qualified Text.Markdown.Reading.FilePathIT as Text_Markdown_Reading_FilePathIT (testList)
import qualified Text.Markdown.Reading.IElementsIT as Text_Markdown_Reading_IElementsIT (testList)
import qualified Text.Markdown.Writing.FileContIT as Text_Markdown_Writing_FileContIT (testList)

main :: IO Counts
main =
    runTestTT testList

testList :: Test
testList =
    TestList [
        System_Filer_Fiso_ModeThinkerUT.testList,
        System_Filer_Fiso_PathReaderUT.testList,
        Text_Markdown_Writing_AElementsUT.testList,
        Text_Markdown_Writing_AElementzUT.testList,
        Text_Markdown_Writing_EElementsUT.testList,
        Text_Markdown_Writing_IElementsUT.testList,
        Text_Markdown_Writing_OElementsUT.testList,
        System_ExiterIT.testList,
        System_Filer_ExceptionIT.testList,
        System_Filer_File_CreatorIT.testList,
        System_Filer_File_DeleterIT.testList,
        System_Filer_File_RecreatorIT.testList,
        System_Filer_File_ReviewerIT.testList,
        System_Filer_File_UpdaterIT.testList,
        System_Filer_Fiso_FileCheckerIT.testList,
        System_Filer_Fiso_FileOffsetterIT.testList,
        System_Filer_Fiso_ModeReaderIT.testList,
        System_Filer_Fiso_ModeWriterIT.testList,
        System_Filer_Fiso_TypeReaderIT.testList,
        System_Filer_Fold_CreatorIT.testList,
        System_Filer_Fold_DeleterIT.testList,
        System_Filer_Link_CreatorIT.testList,
        System_Filer_Link_DeleterIT.testList,
        System_Filer_Link_RecreatorIT.testList,
        System_Filer_Link_ReviewerIT.testList,
        Text_Markdown_Reading_AElementsIT.testList,
        Text_Markdown_Reading_AElementzIT.testList,
        Text_Markdown_Reading_EElementsIT.testList,
        Text_Markdown_Reading_FileContIT.testList,
        Text_Markdown_Reading_FilePathIT.testList,
        Text_Markdown_Reading_IElementsIT.testList,
        Text_Markdown_Writing_FileContIT.testList]


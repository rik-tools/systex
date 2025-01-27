-- ⚠
-- Test
import Test.HUnit (Counts, Test (TestList), runTestTT)
import qualified System.ExiterIT as System_ExiterIT (testList)
import qualified System.Filer.ExceptionIT as System_Filer_ExceptionIT (testList)
import qualified System.Filer.Fiso.TypeReaderIT as System_Filer_Fiso_TypeReaderIT (testList)
import qualified System.Filer.Fiso.ModeReaderIT as System_Filer_Fiso_ModeReaderIT (testList)
import qualified System.Filer.Fiso.ModeWriterIT as System_Filer_Fiso_ModeWriterIT (testList)
import qualified System.Filer.Fold.CreatorIT as System_Filer_Fold_CreatorIT (testList)
import qualified System.Filer.Fold.DeleterIT as System_Filer_Fold_DeleterIT (testList)
import qualified System.Filer.File.CreatorIT as System_Filer_File_CreatorIT (testList)
import qualified System.Filer.File.DeleterIT as System_Filer_File_DeleterIT (testList)
import qualified System.Filer.File.RecreatorIT as System_Filer_File_RecreatorIT (testList)
import qualified System.Filer.File.ReviewerIT as System_Filer_File_ReviewerIT (testList)
import qualified System.Filer.File.UpdaterIT as System_Filer_File_UpdaterIT (testList)
import qualified System.Filer.Link.CreatorIT as System_Filer_Link_CreatorIT (testList)
import qualified System.Filer.Link.DeleterIT as System_Filer_Link_DeleterIT (testList)
import qualified System.Filer.Link.RecreatorIT as System_Filer_Link_RecreatorIT (testList)
import qualified System.Filer.Link.ReviewerIT as System_Filer_Link_ReviewerIT (testList)
import qualified System.Filer.Fiso.PathReaderUT as System_Filer_Fiso_PathReaderUT (testList)
import qualified System.Filer.Fiso.ModeThinkerUT as System_Filer_Fiso_ModeThinkerUT (testList)

--
main :: IO Counts
main = runTestTT testList

--
testList :: Test
testList = TestList [
    System_Filer_Fiso_PathReaderUT.testList,
    System_Filer_Fiso_ModeThinkerUT.testList,
    System_ExiterIT.testList,
    System_Filer_ExceptionIT.testList,
    System_Filer_Fiso_TypeReaderIT.testList,
    System_Filer_Fiso_ModeReaderIT.testList,
    System_Filer_Fiso_ModeWriterIT.testList,
    System_Filer_Fold_CreatorIT.testList,
    System_Filer_Fold_DeleterIT.testList,
    System_Filer_File_CreatorIT.testList,
    System_Filer_File_DeleterIT.testList,
    System_Filer_File_RecreatorIT.testList,
    System_Filer_File_ReviewerIT.testList,
    System_Filer_File_UpdaterIT.testList,
    System_Filer_Link_CreatorIT.testList,
    System_Filer_Link_DeleterIT.testList,
    System_Filer_Link_RecreatorIT.testList,
    System_Filer_Link_ReviewerIT.testList]

--

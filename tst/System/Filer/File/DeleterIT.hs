module System.Filer.File.DeleterIT (testList)
where
-- ⚠

    import Control.Exception (catch)
    import System.Filer.Exception (FilerException)
    import System.Filer.File.Deleter (deleteFile)
    import Test.HUnit (Test (TestCase, TestList), assertEqual)

--
    testList :: Test
    testList = TestList (
        deleteFileCases)

-- deleteFile :: FilePath -> IO ()
    deleteFileCases :: [Test]
    deleteFileCases = [
        TestCase (assertEqual
            "should deleteFile for filePath with fisoType PFile"
            ()
            =<< deleteFile "tmp/file"),
        TestCase (assertEqual
            "should not deleteFile for filePath with fisoType Null"
            ()
            =<< catch (deleteFile "///") handleFE),
        TestCase (assertEqual
            "should deleteFile for filePath with fisoType None"
            ()
            =<< deleteFile "tmp/file"),
        TestCase (assertEqual
            "should not deleteFile for filePath with fisoType PFold"
            ()
            =<< catch (deleteFile "tmp") handleFE)]

--
    handleFE :: FilerException -> IO ()
    handleFE filerException = putStrLn (show filerException) >> return ()

--

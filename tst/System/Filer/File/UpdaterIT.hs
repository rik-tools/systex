module System.Filer.File.UpdaterIT (testList)
where
-- ⚠

    import Control.Exception (catch)
    import System.Filer.Exception (FilerException)
    import System.Filer.File.Updater (updateFile)
    import Test.HUnit (Test (TestCase, TestList), assertEqual)

--
    testList :: Test
    testList = TestList (
        updateFileCases)

-- updateFile :: FilePath -> FileCont -> IO ()
    updateFileCases :: [Test]
    updateFileCases = [
        TestCase (assertEqual
            "should updateFile for filePath with fisoType None"
            ()
            =<< updateFile "tmp/file" "⚠\ncontent"),
        TestCase (assertEqual
            "should not updateFile for filePath with fisoType Null"
            ()
            =<< catch (updateFile "///" "whatever") handleFE),
        TestCase (assertEqual
            "should not updateFile for filePath with fisoType PFold"
            ()
            =<< catch (updateFile "tmp" "whatever") handleFE),
        TestCase (assertEqual
            "should updateFile for filePath with fisoType PFile"
            ()
            =<< updateFile "tmp/file" "⚠\nnontent")]

--
    handleFE :: FilerException -> IO ()
    handleFE filerException = putStrLn (show filerException) >> return ()

--

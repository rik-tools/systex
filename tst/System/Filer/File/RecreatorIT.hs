module System.Filer.File.RecreatorIT (testList)
where
-- ⚠

    import Control.Exception (catch)
    import System.Filer.Exception (FilerException)
    import System.Filer.File.Recreator (recreateFile)
    import Test.HUnit (Test (TestCase, TestList), assertEqual)

--
    testList :: Test
    testList = TestList (
        recreateFileCases)

-- recreateFile :: FilePath -> FileCont -> IO ()
    recreateFileCases :: [Test]
    recreateFileCases = [
        TestCase (assertEqual
            "should recreateFile for filePath with fisoType None"
            ()
            =<< recreateFile "tmp/file" "content"),
        TestCase (assertEqual
            "should not recreateFile for filePath with fisoType Null"
            ()
            =<< catch (recreateFile "///" "whatever") handleFE),
        TestCase (assertEqual
            "should not recreateFile for filePath with fisoType PFold"
            ()
            =<< catch (recreateFile "tmp" "whatever") handleFE),
        TestCase (assertEqual
            "should recreateFile for filePath with fisoType PFile"
            ()
            =<< recreateFile "tmp/file" "⚠\nnontent")]

--
    handleFE :: FilerException -> IO ()
    handleFE filerException = putStrLn (show filerException) >> return ()

--

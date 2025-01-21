module System.Filer.File.CreatorIT (testList)
where
-- ⚠

    import Control.Exception (catch)
    import System.Filer.Exception (FilerException)
    import System.Filer.File.Creator (createFile)
    import Test.HUnit (Test (TestCase, TestList), assertEqual)

--
    testList :: Test
    testList = TestList (
        createFileCases)

-- createFile :: FilePath -> FileCont -> IO ()
    createFileCases :: [Test]
    createFileCases = [
        TestCase (assertEqual
            "should createFile for filePath with fisoType None"
            ()
            =<< createFile "tmp/file" "content"),
        TestCase (assertEqual
            "should not createFile for filePath with fisoType Null"
            ()
            =<< catch (createFile "///" "whatever") handleFE),
        TestCase (assertEqual
            "should not createFile for filePath with fisoType PFold"
            ()
            =<< catch (createFile "tmp" "whatever") handleFE),
        TestCase (assertEqual
            "should not createFile for filePath with fisoType PFile"
            ()
            =<< catch (createFile "tmp/file" "whatever") handleFE)]

--
    handleFE :: FilerException -> IO ()
    handleFE filerException = putStrLn (show filerException) >> return ()

--

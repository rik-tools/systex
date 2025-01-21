module System.Filer.File.ReviewerIT (testList)
where
-- ⚠

    import Control.Exception (catch)
    import System.Filer.Domain (FileCont)
    import System.Filer.Exception (FilerException)
    import System.Filer.File.Reviewer (fileCont)
    import Test.HUnit (Test (TestCase, TestList), assertEqual)

--
    testList :: Test
    testList = TestList (
        fileContCases)

-- fileCont :: FilePath -> IO FileCont
    fileContCases :: [Test]
    fileContCases = [
        TestCase (assertEqual
            "should not return fileCont for filePath with fisoType None"
            ""
            =<< catch (fileCont "nonexistent") handleFE),
        TestCase (assertEqual
            "should not return fileCont for filePath with fisoType Null"
            ""
            =<< catch (fileCont "///") handleFE),
        TestCase (assertEqual
            "should not return fileCont for filePath with fisoType PFold"
            ""
            =<< catch (fileCont "tmp") handleFE),
        TestCase (assertEqual
            "should return fileCont for filePath with fisoType PFile"
            "⚠\nnontent"
            =<< fileCont "tmp/file")]

--
    handleFE :: FilerException -> IO FileCont
    handleFE filerException = putStrLn (show filerException) >> return ""

--

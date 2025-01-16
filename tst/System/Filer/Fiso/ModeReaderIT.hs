module System.Filer.Fiso.ModeReaderIT (testList)
where
-- ⚠

    import Control.Exception (catch)
    import System.Filer.Domain (FisoMode)
    import System.Filer.Exception (FilerException)
    import System.Filer.Fiso.ModeReader (fisoMode)
    import Test.HUnit (Test (TestCase, TestList), assertEqual)

--
    testList :: Test
    testList = TestList (
        fisoModeCases)

-- fisoMode :: FilePath -> IO FisoMode
    fisoModeCases :: [Test]
    fisoModeCases = [
        TestCase (assertEqual
            "should not return fisoMode from filePath Null"
            ""
            =<< catch (fisoMode "/") handleFE),
        TestCase (assertEqual
            "should not return fisoMode from filePath None"
            ""
            =<< catch (fisoMode "nonexistent-fiso") handleFE),
        TestCase (assertEqual
            "should return fisoMode from filePath PFold"
            "700"
            =<< fisoMode "src"),
        TestCase (assertEqual
            "should return fisoMode from filePath PFile"
            "600"
            =<< fisoMode "readme.md")]

--
    handleFE :: FilerException -> IO FisoMode
    handleFE filerException = putStrLn (show filerException) >> return ""

--

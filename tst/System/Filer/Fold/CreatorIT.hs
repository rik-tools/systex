module System.Filer.Fold.CreatorIT (testList)
where
-- ⚠

    import Control.Exception (catch)
    import System.Filer.Exception (FilerException)
    import System.Filer.Fold.Creator (createFold)
    import Test.HUnit (Test (TestCase, TestList), assertEqual)

--
    testList :: Test
    testList = TestList (
        createFoldCases)

-- createFold :: FilePath -> IO ()
    createFoldCases :: [Test]
    createFoldCases = [
        TestCase (assertEqual
            "should createFold for filePath with fisoType None"
            ()
            =<< createFold "tmp"),
        TestCase (assertEqual
            "should not createFold for filePath with fisoType Null"
            ()
            =<< catch (createFold "///") handleFE),
        TestCase (assertEqual
            "should createFold for filePath with fisoType PFold"
            ()
            =<< createFold "tmp"),
        TestCase (assertEqual
            "should not createFold for filePath with fisoType PFile"
            ()
            =<< catch (createFold ".directory") handleFE)]

--
    handleFE :: FilerException -> IO ()
    handleFE filerException = putStrLn (show filerException) >> return ()

--

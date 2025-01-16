module System.Filer.Fold.DeleterIT (testList)
where
-- ⚠

    import Control.Exception (catch)
    import System.Filer.Exception (FilerException)
    import System.Filer.Fold.Deleter (deleteFold)
    import Test.HUnit (Test (TestCase, TestList), assertEqual)

--
    testList :: Test
    testList = TestList (
        deleteFoldCases)

-- deleteFold :: FilePath -> IO ()
    deleteFoldCases :: [Test]
    deleteFoldCases = [
        TestCase (assertEqual
            "should deleteFold for filePath with fisoType PFold"
            ()
            =<< deleteFold "tmp"),
        TestCase (assertEqual
            "should not deleteFold for filePath with fisoType Null"
            ()
            =<< catch (deleteFold "///") handleFE),
        TestCase (assertEqual
            "should deleteFold for filePath with fisoType None"
            ()
            =<< deleteFold "tmp"),
        TestCase (assertEqual
            "should not deleteFold for filePath with fisoType PFile"
            ()
            =<< catch (deleteFold ".directory") handleFE)]

--
    handleFE :: FilerException -> IO ()
    handleFE filerException = putStrLn (show filerException) >> return ()

--

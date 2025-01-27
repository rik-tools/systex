module System.Filer.Link.DeleterIT (testList)
where
-- ⚠

    import Control.Exception (catch)
    import System.Filer.Exception (FilerException)
    import System.Filer.Link.Deleter (deleteLink)
    import Test.HUnit (Test (TestCase, TestList), assertEqual)

--
    testList :: Test
    testList = TestList (
        deleteLinkCases)

-- deleteLink :: FilePath -> IO ()
    deleteLinkCases :: [Test]
    deleteLinkCases = [
        TestCase (assertEqual
            "should deleteLink for filePath with fisoType VFile"
            ()
            =<< deleteLink "tmp/link-0"),
        TestCase (assertEqual
            "should not deleteLink for filePath with fisoType Null"
            ()
            =<< catch (deleteLink "///") handleFE),
        TestCase (assertEqual
            "should deleteLink for filePath with fisoType None"
            ()
            =<< deleteLink "tmp/nonexistent"),
        TestCase (assertEqual
            "should not deleteLink for filePath with fisoType PFold"
            ()
            =<< catch (deleteLink "tmp") handleFE)]

--
    handleFE :: FilerException -> IO ()
    handleFE filerException = putStrLn (show filerException) >> return ()

--

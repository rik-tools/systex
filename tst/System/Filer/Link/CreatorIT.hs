module System.Filer.Link.CreatorIT (testList)
where
-- ⚠

    import Control.Exception (catch)
    import System.Filer.Exception (FilerException)
    import System.Filer.Link.Creator (createLink)
    import Test.HUnit (Test (TestCase, TestList), assertEqual)

--
    testList :: Test
    testList = TestList (
        createLinkCases)

-- createLink :: FilePath -> FilePath -> IO ()
    createLinkCases :: [Test]
    createLinkCases = [
        TestCase (assertEqual
            "should createLink for linkPath with fisoType None"
            ()
            =<< createLink "tmp/link-0" ".directory"),
        TestCase (assertEqual
            "should not createLink for linkPath with fisoType Null"
            ()
            =<< catch (createLink "tmp/link-1" "whatever") handleFE),
        TestCase (assertEqual
            "should not createLink for linkPath with fisoType PFold"
            ()
            =<< catch (createLink "tmp" "whatever") handleFE),
        TestCase (assertEqual
            "should not createLink for linkPath with fisoType VFile"
            ()
            =<< catch (createLink "tmp/link-0" "whatever") handleFE)]

--
    handleFE :: FilerException -> IO ()
    handleFE filerException = putStrLn (show filerException) >> return ()

--

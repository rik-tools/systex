module System.Filer.Link.RecreatorIT (testList)
where
-- ⚠

    import Control.Exception (catch)
    import System.Filer.Exception (FilerException)
    import System.Filer.Link.Recreator (recreateLink)
    import Test.HUnit (Test (TestCase, TestList), assertEqual)

--
    testList :: Test
    testList = TestList (
        recreateLinkCases)

-- recreateLink :: FilePath -> FilePath -> IO ()
    recreateLinkCases :: [Test]
    recreateLinkCases = [
        TestCase (assertEqual
            "should recreateLink for linkPath with fisoType None"
            ()
            =<< recreateLink "tmp/link-4" ".directory"),
        TestCase (assertEqual
            "should not recreateLink for linkPath with fisoType Null"
            ()
            =<< catch (recreateLink "///" "whatever") handleFE),
        TestCase (assertEqual
            "should not recreateLink for linkPath with fisoType PFold"
            ()
            =<< catch (recreateLink "tmp" "whatever") handleFE),
        TestCase (assertEqual
            "should not recreateLink for linkPath with fisoType PFile"
            ()
            =<< catch (recreateLink ".directory" "whatever") handleFE)]

 --
    handleFE :: FilerException -> IO ()
    handleFE filerException = putStrLn (show filerException) >> return ()

 --

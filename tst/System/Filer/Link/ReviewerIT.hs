module System.Filer.Link.ReviewerIT (testList)
where
-- ⚠

    import Control.Exception (catch)
    import System.Filer.Domain (LinkCont)
    import System.Filer.Exception (FilerException)
    import System.Filer.Fiso.PathReader (basename)
    import System.Filer.Link.Reviewer (linkCont)
    import Test.HUnit (Test (TestCase, TestList), assertEqual)

--
    testList :: Test
    testList = TestList (
        linkContCases)

-- linkCont :: FilePath -> IO LinkCont
    linkContCases :: [Test]
    linkContCases = [
        TestCase (assertEqual
            "should not return linkCont for linkPath with fisoType None"
            ""
            =<< catch (linkCont "nonexistent") handleFE),
        TestCase (assertEqual
            "should not return linkCont for linkPath with fisoType Null"
            ""
            =<< catch (linkCont "///") handleFE),
        TestCase (assertEqual
            "should not return linkCont for linkPath with fisoType PFold"
            ""
            =<< catch (linkCont "tmp") handleFE),
        TestCase (assertEqual
            "should return linkCont for linkPath with fisoType VFile"
            ".directory"
            =<< (linkCont "tmp/link-4" >>= \cont -> return (basename cont)))]

--
    handleFE :: FilerException -> IO LinkCont
    handleFE filerException = putStrLn (show filerException) >> return ""

--

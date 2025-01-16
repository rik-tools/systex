module System.Filer.ExceptionIT (testList)
where
-- ⚠

    import Control.Exception (catch)
    import Test.HUnit (Test (TestCase, TestList), assertEqual)
    import System.Filer.Exception (FilerException, throwFE)

--
    testList :: Test
    testList = TestList (
        throwFECases)

-- throwFE :: String -> IO a
    throwFECases :: [Test]
    throwFECases = [
        TestCase (assertEqual
            "should return throwFE"
            "the message is ..."
            =<< catch (throwFE "the message is ...") handleFE)]

--
    handleFE :: FilerException -> IO String
    handleFE filerException = return (show filerException)

--

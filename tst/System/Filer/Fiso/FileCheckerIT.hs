module System.Filer.Fiso.FileCheckerIT (testList)
where
-- ⚠

    import Test.HUnit (Test (TestCase, TestList), assertEqual)
    import System.Filer.Fiso.FileChecker (existAsFiles)

--
    testList :: Test
    testList = TestList (
        existAsFilesCases)

-- existAsFiles :: [FilePref] -> FileSuff -> BaseVar -> IO Bool
    existAsFilesCases :: [Test]
    existAsFilesCases = [
        TestCase (assertEqual
            "should return existAsFiles"
            True
            =<< existAsFiles ["usr/use-filer"] "" "")]

--

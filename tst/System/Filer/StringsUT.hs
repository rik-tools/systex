module System.Filer.StringsUT (testList)
where
-- ⚠

    import Test.HUnit (Test (TestCase, TestList), assertEqual)
    import System.Filer.Strings (version)

--
    testList :: Test
    testList = TestList (
        versionCases)

-- version :: String
    versionCases :: [Test]
    versionCases = [
        TestCase (assertEqual
            "should return version"
            "0.2.0"
            version)]

--

module System.Filer.Fiso.PathReaderUT (testList)
where
-- ⚠

    import Test.HUnit (Test (TestCase, TestList), assertEqual)
    import System.Filer.Fiso.PathReader (basename, dirname)

--
    testList :: Test
    testList = TestList (
        basenameCases
        ++ dirnameCases)

-- basename :: FilePath -> FilePath
    basenameCases :: [Test]
    basenameCases = [
        TestCase (assertEqual
            "should return basename from empty"
            ""
            (basename "")),
        TestCase (assertEqual
            "should return basename from leaf"
            "leaf"
            (basename "leaf")),
        TestCase (assertEqual
            "should return basename from branch"
            "leaf"
            (basename "branch/leaf")),
        TestCase (assertEqual
            "should return basename from root"
            "leaf"
            (basename "root/branch/leaf"))]

-- dirname :: FilePath -> Maybe FilePath
    dirnameCases :: [Test]
    dirnameCases = [
        TestCase (assertEqual
            "should return dirname from empty"
            Nothing
            (dirname "")),
        TestCase (assertEqual
            "should return dirname from leaf"
            Nothing
            (dirname "leaf")),
        TestCase (assertEqual
            "should return dirname from branch"
            (Just "branch")
            (dirname "branch/leaf")),
        TestCase (assertEqual
            "should return dirname from root"
            (Just "root/branch")
            (dirname "root/branch/leaf"))]

--

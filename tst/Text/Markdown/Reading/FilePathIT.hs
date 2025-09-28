module Text.Markdown.Reading.FilePathIT (testList)
where
-- ⚠

    import Data (originalFP, fileCont)
    import Test.HUnit (Test (TestCase, TestList), assertEqual)
    import Text.Markdown.Reading.FilePath (promotedMD)

    testList :: Test
    testList = TestList promotedMDCases

    -- promotedMD :: FilePath -> IO FileCont
    promotedMDCases :: [Test]
    promotedMDCases = [
        TestCase (assertEqual
            "should return promotedMD"
            fileCont
            =<< promotedMD originalFP)]


module Text.Markdown.Writing.FileContIT (testList)
where
-- ⚠

    import Data (actualFP, fileCont)
    import Test.HUnit (Test (TestCase, TestList), assertEqual)
    import Text.Markdown.Writing.FileCont (demotedFP)

    testList :: Test
    testList = TestList (
        demotedFPCases)

-- demotedFP :: FilePath -> FileCont -> IO ()
    demotedFPCases :: [Test]
    demotedFPCases = [
        TestCase (assertEqual
            "should return demotedFP"
            ()
            =<< demotedFP actualFP fileCont)]


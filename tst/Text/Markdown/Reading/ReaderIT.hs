module Text.Markdown.Reading.ReaderIT (testList)
where
-- ⚠

    import Test.HUnit (Test (TestCase, TestList), assertEqual)
    import Text.Markdown.Reading.Reader (readingM)

--
    testList :: Test
    testList = TestList readingMCases

-- readingM :: FilePath -> IO FileCont
    readingMCases :: [Test]
    readingMCases = [
        TestCase (assertEqual
            "should return readingM"
            ""
            =<< readingM "var/empty.md")]

--


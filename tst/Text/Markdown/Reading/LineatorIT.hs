module Text.Markdown.Reading.LineatorIT (testList)
where
-- ⚠

    import Test.HUnit (Test (TestCase, TestList), assertEqual)
    import Text.Markdown.Reading.Lineator (lineatingM)

--
    testList :: Test
    testList = TestList lineatingMCases

-- lineatingM :: FileCont -> IO [AElement]
    lineatingMCases :: [Test]
    lineatingMCases = [
        TestCase (assertEqual
            "should return lineatingM"
            []
            =<< lineatingM "")]

--


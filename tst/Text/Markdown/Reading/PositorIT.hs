module Text.Markdown.Reading.PositorIT (testList)
where
-- ⚠

    import Test.HUnit (Test (TestCase, TestList), assertEqual)
    import Text.Markdown.Reading.Positor (positingM)

--
    testList :: Test
    testList = TestList positingMCases

-- positingM :: [EElement] -> IO [IElement]
    positingMCases :: [Test]
    positingMCases = [
        TestCase (assertEqual
            "should return positingM"
            []
            =<< positingM [])]

--


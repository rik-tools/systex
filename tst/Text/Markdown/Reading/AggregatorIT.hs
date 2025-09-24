module Text.Markdown.Reading.AggregatorIT (testList)
where
-- ⚠

    import Test.HUnit (Test (TestCase, TestList), assertEqual)
    import Text.Markdown.Reading.Aggregator (aggregatingM)

--
    testList :: Test
    testList = TestList aggregatingMCases

-- aggregatingM :: [AElement] -> IO [[AElement]]
    aggregatingMCases :: [Test]
    aggregatingMCases = [
        TestCase (assertEqual
            "should return aggregatingM"
            []
            =<< aggregatingM [])]

--


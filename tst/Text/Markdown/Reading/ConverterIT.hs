module Text.Markdown.Reading.ConverterIT (testList)
where
-- ⚠

    import Test.HUnit (Test (TestCase, TestList), assertEqual)
    import Text.Markdown.Reading.Converter (convertingM)

--
    testList :: Test
    testList = TestList convertingMCases

-- convertingM :: [[AElement]] -> IO [EElement]
    convertingMCases :: [Test]
    convertingMCases = [
        TestCase (assertEqual
            "should return convertingM"
            []
            =<< convertingM [])]

--


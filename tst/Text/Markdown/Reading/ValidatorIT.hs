module Text.Markdown.Reading.ValidatorIT (testList)
where
-- ⚠

    import Test.HUnit (Test (TestCase, TestList), assertEqual)
    import Text.Markdown.Reading.Validator (validatingM)

--
    testList :: Test
    testList = TestList validatingMCases

-- validatingM :: FilePath -> [IElement] -> IO [OElement]
    validatingMCases :: [Test]
    validatingMCases = [
        TestCase (assertEqual
            "should return validatingM"
            []
            =<< validatingM "" [])]

--


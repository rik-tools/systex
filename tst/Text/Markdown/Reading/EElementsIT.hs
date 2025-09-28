module Text.Markdown.Reading.EElementsIT (testList)
where
-- ⚠

    import Data (eElements, iElements)
    import Test.HUnit (Test (TestCase, TestList), assertEqual)
    import Text.Markdown.Reading.EElements (promotedIs)

    testList :: Test
    testList = TestList promotedIsCases

    -- promotedIs :: [EElement] -> IO [IElement]
    promotedIsCases :: [Test]
    promotedIsCases = [
        TestCase (assertEqual
            "should return promotedIs"
            iElements
            =<< promotedIs eElements)]


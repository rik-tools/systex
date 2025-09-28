module Text.Markdown.Writing.IElementsUT (testList)
where
-- ⚠

    import Data (iElements, eElements)
    import Test.HUnit (Test (TestCase, TestList), assertEqual)
    import Text.Markdown.Writing.IElements (demotedEs)

    testList :: Test
    testList = TestList (
        demotedEsCases)

-- demotedEs :: [IElement] -> [EElement]
    demotedEsCases :: [Test]
    demotedEsCases = [
        TestCase (assertEqual
            "should return demotedEs"
            eElements
            (demotedEs iElements))]


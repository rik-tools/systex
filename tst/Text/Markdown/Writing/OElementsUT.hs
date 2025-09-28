module Text.Markdown.Writing.OElementsUT (testList)
where
-- ⚠

    import Data (oElements, iElements)
    import Test.HUnit (Test (TestCase, TestList), assertEqual)
    import Text.Markdown.Writing.OElements (demotedIs)

    testList :: Test
    testList = TestList (
        demotedIsCases)

-- demotedIs :: [OElement] -> [IElement]
    demotedIsCases :: [Test]
    demotedIsCases = [
        TestCase (assertEqual
            "should return demotedIs"
            iElements
            (demotedIs oElements))]


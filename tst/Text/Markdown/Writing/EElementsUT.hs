module Text.Markdown.Writing.EElementsUT (testList)
where
-- ⚠

    import Data (eElements, aElementz)
    import Test.HUnit (Test (TestCase, TestList), assertEqual)
    import Text.Markdown.Writing.EElements (demotedAz)

    testList :: Test
    testList = TestList (
        demotedAzCases)

-- demotedAz :: [EElement] -> [[AElement]]
    demotedAzCases :: [Test]
    demotedAzCases = [
        TestCase (assertEqual
            "should return demotedAz"
            aElementz
            (demotedAz eElements))]


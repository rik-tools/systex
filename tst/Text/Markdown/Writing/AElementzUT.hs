module Text.Markdown.Writing.AElementzUT (testList)
where
-- ⚠

    import Data (aElementz, aElements)
    import Test.HUnit (Test (TestCase, TestList), assertEqual)
    import Text.Markdown.Writing.AElementz (demotedAs)

    testList :: Test
    testList = TestList (
        demotedAsCases)

-- demotedAs :: [[AElement]] -> [AElement]
    demotedAsCases :: [Test]
    demotedAsCases = [
        TestCase (assertEqual
            "should return demotedAs"
            aElements
            (demotedAs aElementz))]


module Text.Markdown.Writing.AElementsUT (testList)
where
-- ⚠

    import Data (aElements, fileCont)
    import Test.HUnit (Test (TestCase, TestList), assertEqual)
    import Text.Markdown.Writing.AElements (demotedMD)

    testList :: Test
    testList = TestList (
        demotedMDCases)

-- demotedMD :: [AElement] -> FileCont
    demotedMDCases :: [Test]
    demotedMDCases = [
        TestCase (assertEqual
            "should return demotedMD"
            fileCont
            (demotedMD aElements))]


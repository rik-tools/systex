module Text.Markdown.Reading.IElementsIT (testList)
where
-- ⚠

    import Data (oElements, iElements)
    import Test.HUnit (Test (TestCase, TestList), assertEqual)
    import Text.Markdown.Reading.IElements (promotedOs)
    import Text.Markdown.Domain.IElement (IElement (IL))
    import Text.Markdown.Domain.OElement (OElement (OL))

    testList :: Test
    testList = TestList promotedOsCases

    -- promotedOs :: FilePath -> [IElement] -> IO [OElement]
    promotedOsCases :: [Test]
    promotedOsCases = [
        TestCase (assertEqual
            "should return promotedOs -- valid target"
            [OL (0, 0, 0, 0) "Empty" "/tmp/empty.md" True]
            =<< promotedOs "." [IL (0, 0, 0, 0) "Empty" "/tmp/empty.md"]),
        TestCase (assertEqual
            "should return promotedOs -- invalid target"
            [OL (0, 0, 0, 0) "Empty" "/tmp/full.md" False]
            =<< promotedOs "." [IL (0, 0, 0, 0) "Empty" "/tmp/full.md"]),
        TestCase (assertEqual
            "should return prometedOs"
            oElements
            =<< promotedOs "" iElements)]


module Text.Markdown.Reading.FileContIT (testList)
where
-- ⚠

    import Data (fileCont, aElements)
    import Test.HUnit (Test (TestCase, TestList), assertEqual)
    import Text.Markdown.Reading.FileCont (promotedAs)

    testList :: Test
    testList = TestList promotedAsCases

    -- promotedAs :: FileCont -> IO [AElement]
    promotedAsCases :: [Test]
    promotedAsCases = [
        TestCase (assertEqual
            "should return promotedAs"
            aElements
            =<< promotedAs fileCont)]


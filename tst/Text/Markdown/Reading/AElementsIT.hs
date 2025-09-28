module Text.Markdown.Reading.AElementsIT (testList)
where
-- ⚠

    import Data (aElements, aElementz)
    import Test.HUnit (Test (TestCase, TestList), assertEqual)
    import Text.Markdown.Reading.AElements (promotedAz)

    testList :: Test
    testList = TestList promotedAzCases

    -- promotedAz :: [AElement] -> IO [[AElement]]
    promotedAzCases :: [Test]
    promotedAzCases = [
        TestCase (assertEqual
            "should return promotedAz"
            aElementz
            =<< promotedAz aElements)]


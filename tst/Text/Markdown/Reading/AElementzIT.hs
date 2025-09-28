module Text.Markdown.Reading.AElementzIT (testList)
where
-- ⚠

    import Data (aElementz, eElements)
    import Test.HUnit (Test (TestCase, TestList), assertEqual)
    import Text.Markdown.Reading.AElementz (promotedEs)

    testList :: Test
    testList = TestList promotedEsCases

    -- promotedEs :: [[AElement]] -> IO [EElement]
    promotedEsCases :: [Test]
    promotedEsCases = [
        TestCase (assertEqual
            "should return promotedEs"
            eElements
            =<< promotedEs aElementz)]


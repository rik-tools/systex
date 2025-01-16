module System.Filer.Fiso.ModeThinkerUT (testList)
where
-- ⚠

    import Test.HUnit (Test (TestCase, TestList), assertEqual)
    import System.Filer.Fiso.ModeThinker (isFisoMode)

--
    testList :: Test
    testList = TestList (
        isFisoModeCases)

-- isFisoMode :: FisoMode -> Bool
    isFisoModeCases :: [Test]
    isFisoModeCases = [
        TestCase (assertEqual
            "should return not isFisoMode"
            False
            (isFisoMode "undefined")),
        TestCase (assertEqual
            "should return isFisoMode"
            True
            (isFisoMode "000"))]

--

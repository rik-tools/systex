module System.ExiterIT (testList)
where
-- ⚠

    import Test.HUnit (Test (TestList))

--
    testList :: Test
    testList = TestList (
        exitCases)

-- exit :: Int -> String -> IO a
    exitCases :: [Test]
    exitCases = []

--

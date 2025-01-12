-- ⚠
module LibraryUT (testList)
where

    import Test.HUnit (Test (TestCase, TestList), assertEqual)
    import Library (identity)

--
    testList :: Test
    testList = TestList (
        identityCases)

-- identity :: o -> o
    identityCases :: [Test]
    identityCases = [
        TestCase (assertEqual
            "should return identity"
            undefined
            (identity True))]

--

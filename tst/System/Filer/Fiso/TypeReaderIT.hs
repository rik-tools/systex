module System.Filer.Fiso.TypeReaderIT (testList)
where
-- ⚠

    import Test.HUnit (Test (TestCase, TestList), assertEqual)
    import System.Filer.Domain (FisoType (None, Null, PFold, PFile))
    import System.Filer.Fiso.TypeReader (fisoType)

--
    testList :: Test
    testList = TestList (
        fisoTypeCases)

-- fisoType :: FilePath -> IO FisoType
    fisoTypeCases :: [Test]
    fisoTypeCases = [
        TestCase (assertEqual
            "should return fisoType for filePath of root"
            Null
            =<< fisoType "////"),
        TestCase (assertEqual
            "should return fisoType for filePath of empty"
            None
            =<< fisoType "nonexistent"),
        TestCase (assertEqual
            "should return fisoType for filePath of physical folder"
            PFold
            =<< fisoType "src"),
        TestCase (assertEqual
            "should return fisoType for filePath of physical file"
            PFile
            =<< fisoType "readme.md")]

--

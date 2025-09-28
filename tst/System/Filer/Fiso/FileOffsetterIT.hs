module System.Filer.Fiso.FileOffsetterIT (testList)
where
-- ⚠

    import Test.HUnit (Test (TestCase, TestList), assertEqual)
    import System.Filer.Fiso.FileOffsetter (offsetFilePaths)

--
    testList :: Test
    testList = TestList (
        offsetFilePathsCases)

-- offsetFilePaths :: [FilePref] -> FileSuff -> BaseVar -> IO [FilePath]
    offsetFilePathsCases :: [Test]
    offsetFilePathsCases = [
        TestCase (assertEqual
            "should return offsetFilePaths"
             ["usr/use-filer"]
            =<< offsetFilePaths ["usr/use-filer"] "" "")]

--

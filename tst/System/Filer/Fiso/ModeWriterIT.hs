module System.Filer.Fiso.ModeWriterIT (testList)
where
-- ⚠

    import Control.Exception (catch)
    import System.Filer.Exception (FilerException)
    import System.Filer.Fiso.ModeWriter (setFisoMode)
    import Test.HUnit (Test (TestCase, TestList), assertEqual)

--
    testList :: Test
    testList = TestList (
        setFisoModeCases)

-- setFisoMode :: FilePath -> FisoMode -> IO ()
    setFisoModeCases :: [Test]
    setFisoModeCases = [
        TestCase (assertEqual
            "should not setFisoMode from invalid fisoMode"
            ()
            =<< (catch (setFisoMode "/" "o000") handleFE)),
        TestCase (assertEqual
            "should not setFisoMode from filePath with fisoType Null"
            ()
            =<< catch (setFisoMode "/" "000") handleFE),
        TestCase (assertEqual
            "should setFisoMode from filePath with fisoType PFile and valid fisoMode"
            ()
            =<< setFisoMode ".directory" "600")]

--
    handleFE :: FilerException -> IO ()
    handleFE filerException = putStrLn (show filerException) >> return ()

--

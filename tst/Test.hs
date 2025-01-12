-- ⚠
-- Test
import Test.HUnit (Counts, Test (TestList), runTestTT)
import qualified LibraryUT as LibraryUT (testList)

--
main :: IO Counts
main = runTestTT testList

--
testList :: Test
testList = TestList [
    LibraryUT.testList]

--

-- ⚠
-- Test
import Test.HUnit (Counts, Test (TestList), runTestTT)
import qualified System.ExiterIT as System_ExiterIT (testList)

--
main :: IO Counts
main = runTestTT testList

--
testList :: Test
testList = TestList [
    System_ExiterIT.testList]

--

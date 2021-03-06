import Lib (greeting)
import Test.Tasty
import Test.Tasty.HUnit
import Test.Tasty.QuickCheck as QC
import Test.Tasty.SmallCheck as SC

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests = testGroup "Tests" [smallCheckTests, quickCheckTests, unitTests]

smallCheckTests :: TestTree
smallCheckTests =
  testGroup
    "SmallCheck Tests"
    [ SC.testProperty "String length <= 3" $
        \s -> length (take 3 (s :: String)) <= 3,
      SC.testProperty "String length <= 2" $ -- should fail
        \s -> length (take 3 (s :: String)) <= 2
    ]

quickCheckTests :: TestTree
quickCheckTests =
  testGroup
    "QuickCheck Tests"
    [ QC.testProperty "String length <= 5" $
        \s -> length (take 5 (s :: String)) <= 5,
      QC.testProperty "String length <= 4" $ -- should fail
        \s -> length (take 5 (s :: String)) <= 4
    ]

unitTests :: TestTree
unitTests =
  testGroup
    "Unit Tests"
    [ testCase "Lib greeting 1" $
        assertEqual "description" "Hello, World!" greeting,
      testCase "String comparison 2" $ -- should fail
        assertEqual "description" "fail" "fail!"
    ]

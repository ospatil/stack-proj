module Main where

import Debug.Trace (trace)
import Lib ()

main :: IO ()

-- main = print greeting

factorial n = go n 1
  where
    go n acc
      | n > 1 = trace ("n = " ++ show n ++ ", acc = " ++ show acc) (go (n - 1) (acc * n))
      | otherwise = acc

main = do
  print (factorial 3)

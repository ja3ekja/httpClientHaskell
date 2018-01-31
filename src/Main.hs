{-# LANGUAGE OverloadedStrings #-}
module Main where

import           Client.ElkClient       (callELK)

main :: IO ()
main = do
  res <- callELK
  print res

{-# LANGUAGE OverloadedStrings #-}
module ElkClient (
          callELK
  ) where

import qualified Data.ByteString.Lazy  as B
import           Network.Wreq

callELK :: IO (Response B.ByteString)
callELK = do
  get "https://google.com"

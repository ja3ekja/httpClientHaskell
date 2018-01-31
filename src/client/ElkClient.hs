{-# LANGUAGE OverloadedStrings #-}
module Client.ElkClient (
          callELK
  ) where

import           Control.Exception       (SomeException, try)
import           Control.Lens
import qualified Data.ByteString.Lazy  as B
import qualified Data.ByteString.Lazy    as BL
import           Network.Connection      (TLSSettings (..))
import           Network.HTTP.Client.TLS (mkManagerSettings)
import           Network.Wreq

import           Http.HttpHelper       (getRequest)

callELK :: IO (Response B.ByteString)
callELK = do
    let url = "https:// elastic serach /_search"
    getRequest url

{-# LANGUAGE OverloadedStrings #-}
module Main where

import           ElkClient       (callELK)
import           Control.Exception       (SomeException, try)
import           Control.Lens
import qualified Data.ByteString.Lazy    as BL
import           Network.Connection      (TLSSettings (..))
import           Network.HTTP.Client.TLS (mkManagerSettings)
import           Network.Wreq

main :: IO ()
main = do
  let urlWithInvalidCert = "https:// elastic serach /_search"
  res <- try (get' urlWithInvalidCert) :: IO (Either SomeException (Response BL.ByteString))
  print $ fmap (^. responseStatus) res
  print res

get' url = let opts = defaults & manager .~ Left (mkManagerSettings (TLSSettingsSimple True False False) Nothing)
                               & auth ?~ basicAuth "uname" "pass"
                               & header "Accept" .~ ["application/json"]
           in getWith opts url

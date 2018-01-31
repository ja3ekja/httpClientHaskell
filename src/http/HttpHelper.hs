{-# LANGUAGE OverloadedStrings #-}
module Http.HttpHelper (
          getRequest
  ) where

import           Control.Exception       (SomeException, try)
import           Control.Lens
import qualified Data.ByteString.Lazy  as B
import qualified Data.ByteString.Lazy    as BL
import           Network.Connection      (TLSSettings (..))
import           Network.HTTP.Client.TLS (mkManagerSettings)
import           Network.Wreq

getRequest url = let opts = defaults & manager .~ Left (mkManagerSettings (TLSSettingsSimple True False False) Nothing)
                                            & auth ?~ basicAuth "uname" "pass"
                                            & header "Accept" .~ ["application/json"]
                                            in getWith opts url

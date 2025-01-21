{-# LANGUAGE QuasiQuotes #-}
module System.Filer (version)
where

    import Data.Text (unpack)
    import NeatInterpolation (text)

    version :: String
    version = unpack [text|
        0.1.3
    |]

--

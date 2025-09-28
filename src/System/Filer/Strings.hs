{-# LANGUAGE QuasiQuotes #-}
module System.Filer.Strings (version)
where

    import Data.Text (unpack)
    import NeatInterpolation (text)

    version :: String
    version = unpack [text|
        0.3.4
    |]

--


{-# LANGUAGE QuasiQuotes #-}
module Strings (how, version, completion)
where

    import Data.Text (unpack)
    import NeatInterpolation (text)

--
    how :: String
    how = unpack [text|
        ---
        -- $ rho-system --how
        -- $ rho-system --version
        -- $ source <(rho-system --completion)
        ---
    |]

--
    version :: String
    version = unpack [text|
        0.0.0
    |]

--
    completion :: String
    completion = unpack [text|
        #!/bin/bash
        complete -W '--how --version --completion' rho-system
    |]

--

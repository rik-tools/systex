module System.Filer.Exception (FilerException (FilerException), throwFE)
where
-- ⚠

    import Control.Exception (Exception, throwIO)

    data FilerException = FilerException String deriving (Eq, Read)

    instance Exception FilerException

    instance Show FilerException where
        show (FilerException message) = message

--
    throwFE :: String -> IO a
    throwFE message =
        throwIO (FilerException message)

--

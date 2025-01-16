module System.Filer.Fiso.ModeReader (fisoMode)
where
-- ⚠

    import System.Filer.Domain (FisoMode, FisoType (None, Null))
    import System.Filer.Exception (throwFE)
    import System.Filer.Fiso.TypeReader (fisoType)
    import System.Posix.Files (FileStatus, fileMode, getFileStatus)

--
    fisoMode :: FilePath -> IO FisoMode
    fisoMode filePath =
        fisoType filePath >>= fisoMode' filePath

    fisoMode' :: FilePath -> FisoType -> IO FisoMode
    fisoMode' filePath fisoType =
        case fisoType of
            None -> throwFE ("filer: fisoMode: fisoType of filePath is None: " ++ filePath)
            Null -> throwFE ("filer: fisoMode: fisoType of filePath is Null: " ++ filePath)
            _    -> getFileStatus filePath >>= fileStatusDecimal >>= return . octal

    fileStatusDecimal :: FileStatus -> IO Int
    fileStatusDecimal fileStatus =
        return (read (show  (fileMode fileStatus)) :: Int)

    octal :: Int -> String
    octal dec =
        octal' [] dec

    octal' :: [Int] -> Int -> String
    octal' ods dec =
        if dec > 0
            then octal' (dec `mod` 8: ods) (dec `div` 8)
            else concat $ reverse $ take 3 $ reverse $ map show ods

--

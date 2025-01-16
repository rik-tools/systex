module System.Filer.Fiso.ModeWriter (setFisoMode)
where
-- ⚠

    import System.Filer.Domain (FisoMode, FisoType (None, Null, VFold, VFile))
    import System.Filer.Exception (throwFE)
    import System.Filer.Fiso.ModeThinker (isFisoMode)
    import System.Filer.Fiso.TypeReader (fisoType)
    import System.Posix.Files (groupExecuteMode, groupReadMode, groupWriteMode, nullFileMode, otherExecuteMode, otherReadMode, otherWriteMode, setFileMode, ownerExecuteMode, ownerReadMode, ownerWriteMode)
    import System.Posix.Types (FileMode)

--
    setFisoMode :: FilePath -> FisoMode -> IO ()
    setFisoMode filePath fisoMode =
        if isFisoMode fisoMode
            then fisoType filePath >>= setFisoMode' filePath fisoMode
            else throwFE ("filer: setFisoMode: fisoMode is invalid: " ++ fisoMode)

    setFisoMode' :: FilePath -> FisoMode ->  FisoType -> IO ()
    setFisoMode' filePath fisoMode fisoType =
        case fisoType of
            None  -> throwFE ("filer: setFisoMode: fisoType of filePath is None: " ++ filePath)
            Null  -> throwFE ("filer: setFisoMode: fisoType of filePath is Null: " ++ filePath)
            VFold -> throwFE ("filer: setFisoMode: fisoType of filePath is VFold: " ++ filePath)
            VFile -> throwFE ("filer: setFisoMode: fisoType of filePath is NVFile: " ++ filePath)
            _     -> setting filePath fisoMode

    setting :: FilePath -> FisoMode -> IO ()
    setting filePath fisoMode =
        case fisoMode of
            [u, g, o] -> setFileMode filePath (umo u + gmo g + omo o)
            _ -> error "never"

    umo :: Char -> FileMode
    umo c =
        case c of
            '0' -> nullFileMode
            '1' -> ownerExecuteMode
            '2' -> ownerWriteMode
            '3' -> ownerWriteMode + ownerExecuteMode
            '4' -> ownerReadMode
            '5' -> ownerReadMode + ownerExecuteMode
            '6' -> ownerReadMode + ownerWriteMode
            '7' -> ownerReadMode + ownerWriteMode + ownerExecuteMode
            _ -> error "never"

    gmo :: Char -> FileMode
    gmo c =
        case c of
            '0' -> nullFileMode
            '1' -> groupExecuteMode
            '2' -> groupWriteMode
            '3' -> groupWriteMode + groupExecuteMode
            '4' -> groupReadMode
            '5' -> groupReadMode + groupExecuteMode
            '6' -> groupReadMode + groupWriteMode
            '7' -> groupReadMode + groupWriteMode + groupExecuteMode
            _ -> error "never"

    omo :: Char -> FileMode
    omo c =
        case c of
            '0' -> nullFileMode
            '1' -> otherExecuteMode
            '2' -> otherWriteMode
            '3' -> otherWriteMode + otherExecuteMode
            '4' -> otherReadMode
            '5' -> otherReadMode + otherExecuteMode
            '6' -> otherReadMode + otherWriteMode
            '7' -> otherReadMode + otherWriteMode + otherExecuteMode
            _ -> error "never"

--

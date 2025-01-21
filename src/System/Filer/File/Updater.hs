module System.Filer.File.Updater (updateFile)
where
-- ⚠

    import Data.List (isInfixOf)
    import System.Filer.Domain (FileCont, FisoType (None, Null, PFold, PFile, VFold, VFile))
    import System.Filer.Exception (throwFE)
    import System.Filer.Fiso.TypeReader (fisoType)
    import System.Filer.File.Creator (createFile)
    import System.Filer.File.Recreator (recreateFile)
    import System.Filer.File.Reviewer (fileCont)

--
    updateFile :: FilePath -> FileCont -> IO ()
    updateFile filePath fileCont =
        fisoType filePath
        >>= updating filePath fileCont

    updating :: FilePath -> FileCont -> FisoType -> IO ()
    updating filePath newContent fisoType =
        case fisoType of
            None  -> createFile filePath newContent
            Null  -> throwFE ("filer: updateFile: fisoType of filePath is Null: " ++ filePath)
            PFold -> throwFE ("filer: updateFile: fisoType of filePath is PFold: " ++ filePath)
            PFile -> fileCont filePath >>= canUpdate newContent >>= updation filePath newContent
            VFold -> throwFE ("filer: updateFile: fisoType of filePath is VFold: " ++ filePath)
            VFile -> throwFE ("filer: updateFile: fisoType of filePath is VFile: " ++ filePath)

    updation :: FilePath -> FileCont -> Bool -> IO ()
    updation filePath fileCont newCanUpdate =
        if newCanUpdate
            then recreateFile filePath fileCont
            else return ()

    canUpdate :: FileCont -> FileCont -> IO Bool
    canUpdate newContent oldContent
        | null oldContent = return False
        | oldContent == newContent = return False
        | otherwise = return (isInfixOf needle (haystack oldContent))

    needle :: String
    needle = "⚠"

    haystack :: FileCont -> String
    haystack oldContent = unlines (take 2 (lines oldContent))

--

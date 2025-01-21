module System.Filer.File.Recreator (recreateFile)
where
-- ⚠

    import System.Filer.Domain (FileCont, FisoType (None, Null, PFold, PFile, VFold, VFile))
    import System.Filer.Exception (throwFE)
    import System.Filer.Fiso.TypeReader (fisoType)
    import System.Filer.File.Creator (createFile)
    import System.Filer.File.Deleter (deleteFile)

--
    recreateFile :: FilePath -> FileCont -> IO ()
    recreateFile filePath fileCont =
        fisoType filePath
        >>= recreating filePath fileCont

    recreating :: FilePath -> FileCont -> FisoType -> IO ()
    recreating filePath fileCont fisoType =
        case fisoType of
            None  -> createFile filePath fileCont
            Null  -> throwFE ("filer: recreateFile: fisoType of filePath is Null: " ++ filePath)
            PFold -> throwFE ("filer: recreateFile: fisoType of filePath is PFold: " ++ filePath)
            PFile -> deleteFile filePath >> createFile filePath fileCont
            VFold -> throwFE ("filer: recreateFile: fisoType of filePath is VFold: " ++ filePath)
            VFile -> throwFE ("filer: recreateFile: fisoType of filePath is VFile: " ++ filePath)

--

module System.Filer.File.Deleter (deleteFile)
where
-- ⚠

    import System.Directory (removeFile)
    import System.Filer.Exception (throwFE)
    import System.Filer.Domain (FisoType (None, Null, PFold, PFile, VFold, VFile))
    import System.Filer.Fiso.TypeReader (fisoType)

--
    deleteFile :: FilePath -> IO ()
    deleteFile filePath =
        fisoType filePath
        >>= deleting filePath

    deleting :: FilePath -> FisoType -> IO ()
    deleting filePath fisoType =
        case fisoType of
            None  -> return ()
            Null  -> throwFE ("filer: deleteFile: fisoType of filePath is Null: " ++ filePath)
            PFold -> throwFE ("filer: deleteFile: fisoType of filePath is PFold: " ++ filePath)
            PFile -> deletion filePath
            VFold -> throwFE ("filer: deleteFile: fisoType of filePath is VFold: " ++ filePath)
            VFile -> throwFE ("filer: deleteFile: fisoType of filePath is VFile: " ++ filePath)

    deletion :: FilePath -> IO ()
    deletion filePath =
        removeFile filePath

--

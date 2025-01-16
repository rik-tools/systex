module System.Filer.Fold.Deleter (deleteFold)
where
-- ⚠

    import System.Directory (removeDirectoryRecursive)
    import System.Filer.Exception (throwFE)
    import System.Filer.Domain (FisoType (None, Null, PFold, PFile, VFold, VFile))
    import System.Filer.Fiso.TypeReader (fisoType)

--
    deleteFold :: FilePath -> IO ()
    deleteFold filePath =
        fisoType filePath
        >>= deleting filePath

    deleting :: FilePath -> FisoType -> IO ()
    deleting filePath fisoType =
        case fisoType of
            None  -> return ()
            Null  -> throwFE ("filer: deleteFold: fisoType of filePath is Null: " ++ filePath)
            PFold -> deletion filePath
            PFile -> throwFE ("filer: deleteFold: fisoType of filePath is PFile: " ++ filePath)
            VFold -> throwFE ("filer: deleteFold: fisoType of filePath is VFold: " ++ filePath)
            VFile -> throwFE ("filer: deleteFold: fisoType of filePath is VFile: " ++ filePath)

    deletion :: FilePath -> IO ()
    deletion filePath =
        removeDirectoryRecursive filePath

--

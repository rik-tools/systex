module System.Filer.Fold.Creator (createFold)
where
-- ⚠

    import System.Directory (createDirectoryIfMissing)
    import System.Filer.Exception (throwFE)
    import System.Filer.Domain (FisoType (None, Null, PFold, PFile, VFold, VFile))
    import System.Filer.Fiso.ModeWriter (setFisoMode)
    import System.Filer.Fiso.TypeReader (fisoType)

--
    createFold :: FilePath -> IO ()
    createFold filePath =
        fisoType filePath
        >>= creating filePath

    creating :: FilePath -> FisoType -> IO ()
    creating filePath fisoType =
        case fisoType of
            None  -> creation filePath
            Null  -> throwFE ("filer: createFold: fisoType of filePath is Null: " ++ filePath)
            PFold -> return ()
            PFile -> throwFE ("filer: createFold: fisoType of filePath is PFile: " ++ filePath)
            VFold -> throwFE ("filer: createFold: fisoType of filePath is VFold: " ++ filePath)
            VFile -> throwFE ("filer: createFold: fisoType of filePath is VFile: " ++ filePath)

    creation :: FilePath -> IO ()
    creation filePath =
        createDirectoryIfMissing True filePath
        >> setFisoMode filePath "700"

--

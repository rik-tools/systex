module System.Filer.Link.Creator (createLink)
where
-- ⚠

    import System.Directory (createFileLink, makeAbsolute)
    import System.Filer.Domain (FisoType (None, Null, PFold, PFile, VFold, VFile))
    import System.Filer.Exception (throwFE)
    import System.Filer.Fiso.PathReader (dirname)
    import System.Filer.Fiso.TypeReader (fisoType)
    import System.Filer.Fold.Creator (createFold)

--
    createLink :: FilePath -> FilePath -> IO ()
    createLink linkPath filePath =
        fisoType linkPath
        >>= creating linkPath filePath

    creating :: FilePath -> FilePath -> FisoType -> IO ()
    creating linkPath filePath linkType =
        case linkType of
            None  -> fisoType filePath >>= creation linkPath filePath
            Null  -> throwFE ("filer: createLink: fisoType of linkPath is Null: " ++ linkPath)
            PFold -> throwFE ("filer: createLink: fisoType of linkPath is PFold: " ++ linkPath)
            PFile -> throwFE ("filer: createLink: fisoType of linkPath is PFile: " ++ linkPath)
            VFold -> throwFE ("filer: createLink: fisoType of linkPath is VFold: " ++ linkPath)
            VFile -> throwFE ("filer: createLink: fisoType of linkPath is VFile: " ++ linkPath)

    creation :: FilePath -> FilePath -> FisoType -> IO ()
    creation linkPath filePath fisoType =
        case fisoType of
            None  -> throwFE ("filer: createLink: fisoType of filePath is None: " ++ filePath)
            Null  -> creation' linkPath filePath
            PFold -> creation' linkPath filePath
            PFile -> creation' linkPath filePath
            VFold -> creation' linkPath filePath
            VFile -> creation' linkPath filePath

    creation' :: FilePath -> FilePath -> IO ()
    creation' linkPath filePath =
        case dirname linkPath of
            Just fold -> createFold fold >> makeAbsolute filePath >>= \filePath -> createFileLink filePath linkPath
            Nothing   ->                    makeAbsolute filePath >>= \filePath -> createFileLink filePath linkPath

--

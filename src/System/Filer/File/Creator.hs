module System.Filer.File.Creator (createFile)
where
-- ⚠

    import System.Directory (copyFile)
    import System.Filer.Domain (FileCont, FisoType (None, Null, PFold, PFile, VFold, VFile))
    import System.Filer.Exception (throwFE)
    import System.Filer.Fiso.ModeWriter (setFisoMode)
    import System.Filer.Fiso.PathReader (dirname)
    import System.Filer.Fiso.TypeReader (fisoType)
    import System.Filer.Fold.Creator (createFold)

--
    createFile :: FilePath -> FileCont -> IO ()
    createFile filePath fileCont =
        fisoType filePath
        >>= creating filePath fileCont

    creating :: FilePath -> FileCont -> FisoType -> IO ()
    creating filePath fileCont fisoType =
        case fisoType of
            None  -> creation filePath fileCont
            Null  -> throwFE ("filer: createFile: fisoType of filePath is Null: " ++ filePath)
            PFold -> throwFE ("filer: createFile: fisoType of filePath is PFold: " ++ filePath)
            PFile -> throwFE ("filer: createFile: fisoType of filePath is PFile: " ++ filePath)
            VFold -> throwFE ("filer: createFile: fisoType of filePath is VFold: " ++ filePath)
            VFile -> throwFE ("filer: createFile: fisoType of filePath is VFile: " ++ filePath)

    creation :: FilePath -> FileCont -> IO ()
    creation filePath fileCont =
        case dirname filePath of
            Just fold -> createFold fold >> creation' filePath fileCont
            Nothing   ->                    creation' filePath fileCont

    creation' :: FilePath -> FileCont -> IO ()
    creation' filePath fileCont =
        let tmpPath = "/tmp/filer-file"
        in writeFile tmpPath fileCont
        >> copyFile tmpPath filePath
        >> setFisoMode filePath "600"

--

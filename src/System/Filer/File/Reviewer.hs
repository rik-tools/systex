module System.Filer.File.Reviewer (fileCont)
where
-- ⚠

    import System.Filer.Domain (FileCont, FisoType (None, Null, PFold, PFile, VFold, VFile))
    import System.Filer.Exception (throwFE)
    import System.Filer.Fiso.TypeReader (fisoType)

--
    fileCont :: FilePath -> IO FileCont
    fileCont filePath =
        fisoType filePath
        >>= reviewing filePath

    reviewing :: FilePath -> FisoType -> IO FileCont
    reviewing filePath fisoType =
        case fisoType of
            None  -> throwFE ("filer: fileCont: fisoType of filePath is None: " ++ filePath)
            Null  -> throwFE ("filer: fileCont: fisoType of filePath is Null: " ++ filePath)
            PFold -> throwFE ("filer: fileCont: fisoType of filePath is PFold: " ++ filePath)
            PFile -> readFile filePath
            VFold -> throwFE ("filer: fileCont: fisoType of filePath is VFold: " ++ filePath)
            VFile -> throwFE ("filer: fileCont: fisoType of filePath is VFile: " ++ filePath)

--

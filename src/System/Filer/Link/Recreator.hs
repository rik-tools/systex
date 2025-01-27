module System.Filer.Link.Recreator (recreateLink)
where
-- ⚠

    import System.Filer.Domain (FisoType (None, Null, PFold, PFile, VFold, VFile))
    import System.Filer.Exception (throwFE)
    import System.Filer.Fiso.TypeReader (fisoType)
    import System.Filer.Link.Creator (createLink)
    import System.Filer.Link.Deleter (deleteLink)

--
    recreateLink :: FilePath -> FilePath -> IO ()
    recreateLink linkPath filePath =
        fisoType linkPath
        >>= recreating linkPath filePath

    recreating :: FilePath -> FilePath -> FisoType -> IO ()
    recreating linkPath filePath fisoType =
        case fisoType of
            None  -> createLink linkPath filePath
            Null  -> throwFE ("filer: recreateLink: fisoType of linkPath is Null: " ++ linkPath)
            PFold -> throwFE ("filer: recreateLink: fisoType of linkPath is PFold: " ++ linkPath)
            PFile -> throwFE ("filer: recreateLink: fisoType of linkPath is PFile: " ++ linkPath)
            VFold -> deleteLink linkPath >> createLink linkPath filePath
            VFile -> deleteLink linkPath >> createLink linkPath filePath

--

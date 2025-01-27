module System.Filer.Link.Deleter (deleteLink)
where
-- ⚠

    import System.Filer.Domain (FisoType (None, Null, PFold, PFile, VFold, VFile))
    import System.Filer.Exception (throwFE)
    import System.Filer.Fiso.TypeReader (fisoType)
    import System.Posix.Files (removeLink)

--
    deleteLink :: FilePath -> IO ()
    deleteLink linkPath =
        fisoType linkPath
        >>= deleting linkPath

    deleting :: FilePath -> FisoType -> IO ()
    deleting linkPath fisoType =
        case fisoType of
            None  -> return ()
            Null  -> throwFE ("filer: deleteLink: fisoType of linkPath is Null: " ++ linkPath)
            PFold -> throwFE ("filer: deleteLink: fisoType of linkPath is PFold: " ++ linkPath)
            PFile -> throwFE ("filer: deleteLink: fisoType of linkPath is PFile: " ++ linkPath)
            VFold -> removeLink linkPath
            VFile -> removeLink linkPath

--

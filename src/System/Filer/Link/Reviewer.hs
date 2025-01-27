module System.Filer.Link.Reviewer (linkCont)
where
-- ⚠

    import System.Filer.Domain (FisoType (None, Null, PFold, PFile, VFold, VFile))
    import System.Filer.Domain (LinkCont)
    import System.Filer.Exception (throwFE)
    import System.Filer.Fiso.TypeReader (fisoType)
    import System.Posix.Files (readSymbolicLink)

--
    linkCont :: FilePath -> IO LinkCont
    linkCont linkPath =
        fisoType linkPath
        >>= reviewing linkPath

    reviewing :: FilePath -> FisoType -> IO LinkCont
    reviewing linkPath fisoType =
        case fisoType of
            None  -> throwFE ("filer: linkCont: fisoType of linkPath is None: " ++ linkPath)
            Null  -> throwFE ("filer: linkCont: fisoType of linkPath is Null: " ++ linkPath)
            PFold -> throwFE ("filer: linkCont: fisoType of linkPath is PFold: " ++ linkPath)
            PFile -> throwFE ("filer: linkCont: fisoType of linkPath is PFile: " ++ linkPath)
            VFold -> readSymbolicLink linkPath
            VFile -> readSymbolicLink linkPath

--

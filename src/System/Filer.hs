module System.Filer (FileCont, FisoMode, FisoType (None, Null, PFold, PFile, VFold, VFile), LinkCont, FilerException, version, basename, dirname, fisoType, fisoMode, isFisoMode, setFisoMode, existAsFiles, offsetFilePaths, createFold, deleteFold, createFile, deleteFile, recreateFile, fileCont, updateFile, createLink, deleteLink, recreateLink, linkCont)
where
-- ⚠

    import System.Filer.Domain (FileCont, FisoMode, FisoType (None, Null, PFold, PFile, VFold, VFile), LinkCont)
    import System.Filer.Exception (FilerException)
    import System.Filer.Strings (version)
    import System.Filer.Fiso.PathReader (basename, dirname)
    import System.Filer.Fiso.TypeReader (fisoType)
    import System.Filer.Fiso.ModeReader (fisoMode)
    import System.Filer.Fiso.ModeThinker (isFisoMode)
    import System.Filer.Fiso.ModeWriter (setFisoMode)
    import System.Filer.Fiso.FileChecker (existAsFiles)
    import System.Filer.Fiso.FileOffsetter (offsetFilePaths)
    import System.Filer.Fold.Creator (createFold)
    import System.Filer.Fold.Deleter (deleteFold)
    import System.Filer.File.Creator (createFile)
    import System.Filer.File.Deleter (deleteFile)
    import System.Filer.File.Recreator (recreateFile)
    import System.Filer.File.Reviewer (fileCont)
    import System.Filer.File.Updater (updateFile)
    import System.Filer.Link.Creator (createLink)
    import System.Filer.Link.Deleter (deleteLink)
    import System.Filer.Link.Recreator (recreateLink)
    import System.Filer.Link.Reviewer (linkCont)

--

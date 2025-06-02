module System.Filer.Fiso.FileOffsetter (offsetFilePaths)
where
-- ⚠

    import System.Environment (lookupEnv)
    import System.Filer.Domain (FilePref, FileSuff, BaseVar)
    import System.Filer.Fiso.FileChecker (existAsFiles)

--
    offsetFilePaths :: [FilePref] -> FileSuff -> BaseVar -> IO [FilePath]
    offsetFilePaths filePrefs fileSuff baseVar =
        existAsFiles filePrefs fileSuff baseVar
        >>= offsetFilePaths' filePrefs fileSuff baseVar

    offsetFilePaths' :: [FilePref] -> FileSuff -> BaseVar -> Bool -> IO [FilePath]
    offsetFilePaths' filePrefs fileSuff baseVar filePathsExistAsFiles =
        if filePathsExistAsFiles
            then offsetFilePaths'' filePrefs fileSuff baseVar
            else return []

    offsetFilePaths'' :: [FilePref] -> FileSuff -> BaseVar -> IO [FilePath]
    offsetFilePaths'' filePrefs fileSuff baseVar =
        lookupEnv baseVar
        >>= basedCandidatesIO filePrefs fileSuff

    basedCandidatesIO :: [FilePref] -> FileSuff -> Maybe FilePath -> IO [FilePath]
    basedCandidatesIO filePrefs fileSuff maybeBase =
        case maybeBase of
            Nothing -> return (suffixedCandidates filePrefs fileSuff)
            Just base -> return (basedCandidates base filePrefs fileSuff)

    basedCandidates :: FilePath -> [FilePref] -> FileSuff -> [FilePath]
    basedCandidates base filePrefs fileSuff = map (basedCandidate base fileSuff) filePrefs

    basedCandidate :: FilePath -> FileSuff -> FilePref -> FilePath
    basedCandidate base fileSuff filePref = base ++ "/" ++ suffixedCandidate fileSuff filePref

    suffixedCandidates :: [FilePref] -> FileSuff -> [FilePath]
    suffixedCandidates filePrefs fileSuff = map (suffixedCandidate fileSuff) filePrefs

    suffixedCandidate :: FileSuff -> FilePref -> FilePath
    suffixedCandidate fileSuff filePref =
        case fileSuff of
            "" -> filePref
            _  -> filePref ++ "." ++ fileSuff

--

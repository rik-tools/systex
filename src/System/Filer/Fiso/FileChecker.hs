module System.Filer.Fiso.FileChecker (existAsFiles)
where
-- ⚠

    import System.Directory (doesFileExist)
    import System.Environment (lookupEnv)
    import System.Filer.Domain (FilePref, FileSuff, BaseVar)

--
    existAsFiles :: [FilePref] -> FileSuff -> BaseVar -> IO Bool
    existAsFiles filePrefs fileSuff baseVar =
        lookupEnv baseVar
        >>= basedCandidatesIO filePrefs fileSuff
        >>= boolIOs
        >>= boolsIO
        >>= boolIO

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

    boolIOs :: [FilePath] -> IO [IO Bool]
    boolIOs candidates = return (map doesFileExist candidates)

    boolsIO :: [IO Bool] -> IO [Bool]
    boolsIO boolIOs = sequence boolIOs :: IO [Bool]

    boolIO :: [Bool] -> IO Bool
    boolIO bools = return (foldr (&&) True bools)

--

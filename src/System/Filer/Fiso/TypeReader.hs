module System.Filer.Fiso.TypeReader (fisoType)
where
-- ⚠

    import System.Directory (doesDirectoryExist, doesFileExist, doesPathExist, pathIsSymbolicLink)
    import System.Filer.Domain (FisoType (None, Null, PFold, PFile, VFold, VFile))

--
    fisoType :: FilePath -> IO FisoType
    fisoType filePath =
        if isNull filePath
            then return Null
            else doesPathExist filePath >>= fisoType' filePath

    fisoType' :: FilePath -> Bool -> IO FisoType
    fisoType' filePath pathExists =
        if pathExists then fisoType'' filePath else return None

    fisoType'' :: FilePath -> IO FisoType
    fisoType'' filePath =
        doesDirectoryExist filePath
        >>= \pathIsFold -> doesFileExist filePath
        >>= \pathIsFile -> pathIsSymbolicLink filePath
        >>= \pathIsLink -> fisoType''' [pathIsFold, pathIsFile, pathIsLink]

    fisoType''' :: [Bool] -> IO FisoType
    fisoType''' bs =
        case bs of
            [True,  False, False] -> return PFold
            [False, True,  False] -> return PFile
            [True,  False, True]  -> return VFold
            [False, True,  True]  -> return VFile
            _                     -> error "never"

    isNull :: FilePath -> Bool
    isNull filePath =
        if null filePath
            then True
            else foldr (&&) True (map ((==)'/') filePath)

--

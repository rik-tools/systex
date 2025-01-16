module System.Filer.Fiso.PathReader (basename, dirname)
where
-- ⚠

    import Data.List (intercalate, isInfixOf)
    import Data.List.Split (splitOn)

--
    basename :: FilePath -> FilePath
    basename filePath =
        (last . splitOn "/") filePath

--
    dirname :: FilePath -> Maybe FilePath
    dirname filePath =
        if isInfixOf "/" filePath
            then (Just . intercalate "/" . init . splitOn "/") filePath
            else Nothing

--

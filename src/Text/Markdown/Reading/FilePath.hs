module Text.Markdown.Reading.FilePath (promotedMD)
where
-- ⚠

    import System.Directory (doesFileExist)
    import System.Filer (FileCont)
    import System.IO (IOMode (ReadMode), hGetContents', withFile)

--
    promotedMD :: FilePath -> IO FileCont
    promotedMD filePath =
        doesFileExist filePath
        >>= \fileExists -> if fileExists
            then withFile filePath ReadMode hGetContents'
            else error ("unknown file path: " ++ filePath)


--

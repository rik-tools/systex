module Text.Markdown.Reading.Reader (readingM)
where
-- ⚠

    import System.Directory (doesFileExist)
    import System.Filer (FileCont)
    import System.IO (IOMode (ReadMode), hGetContents', withFile)

--
    readingM :: FilePath -> IO FileCont
    readingM filePath =
        doesFileExist filePath
        >>= \fileExists -> if fileExists
            then withFile filePath ReadMode hGetContents'
            else error ("unknown file path: " ++ filePath)


--

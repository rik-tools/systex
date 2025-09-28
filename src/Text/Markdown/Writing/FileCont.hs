module Text.Markdown.Writing.FileCont (demotedFP)
where
-- ⚠

    import System.Filer (FileCont)

--
    demotedFP :: FilePath -> FileCont -> IO ()
    demotedFP filePath fileCont =
        writeFile filePath fileCont

--

module System.Exiter (exit)
where
-- ⚠

    import System.IO (hPutStr, stderr)
    import System.Exit (ExitCode (ExitFailure, ExitSuccess), exitWith)

--
    exit :: Int -> String -> IO a
    exit 0 _ = exitWith ExitSuccess
    exit n s = hPutStr stderr ("[exit " ++ show n ++ ": " ++ s ++ "]\n") >> exitWith (ExitFailure n)

--

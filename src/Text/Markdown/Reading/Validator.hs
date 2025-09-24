module Text.Markdown.Reading.Validator (validatingM)
where
-- ⚠

    import System.Directory (canonicalizePath, doesFileExist)
    import System.Filer (dirname)
    import Text.Markdown.Domain.Position (Position)
    import Text.Markdown.Domain.IElement (IElement (IX, IL, IP, I1, I2, I3, II, IU, IJ, IO, IC, IR, IT, IZ, IB))
    import Text.Markdown.Domain.OElement (OElement (OX, OL, OP, O1, O2, O3, OI, OU, OJ, OO, OC, OR, OT, OZ, OB))

--
    validatingM :: FilePath -> [IElement] -> IO [OElement]
    validatingM filePath inns =
        case dirname filePath of
             Just folder -> validatingM' (folder ++ "/") inns []
             Nothing -> validatingM' "" inns []

    validatingM' :: FilePath -> [IElement] -> [OElement] -> IO [OElement]
    validatingM' origin inns outs =
        case inns of
            []                  -> return outs
            IX position string: rest     ->                                 vx  origin rest outs position string
            IL position label link: rest -> terminM origin link         >>= vl  origin rest outs position label
            IP position subs: rest       -> validatingM' origin subs [] >>= vp  origin rest outs position
            I1 position subs: rest       -> validatingM' origin subs [] >>= vh1 origin rest outs position
            I2 position subs: rest       -> validatingM' origin subs [] >>= vh2 origin rest outs position
            I3 position subs: rest       -> validatingM' origin subs [] >>= vh3 origin rest outs position
            II position subs: rest       -> validatingM' origin subs [] >>= vi  origin rest outs position
            IU position subs: rest       -> validatingM' origin subs [] >>= vu  origin rest outs position
            IJ position i subs: rest     -> validatingM' origin subs [] >>= vj  origin rest outs position i
            IO position subs: rest       -> validatingM' origin subs [] >>= vo  origin rest outs position
            IC position subs: rest       -> validatingM' origin subs [] >>= vc  origin rest outs position
            IR position subs: rest       -> validatingM' origin subs [] >>= vr  origin rest outs position
            IT position subs: rest       -> validatingM' origin subs [] >>= vt  origin rest outs position
            IZ position subs: rest       -> validatingM' origin subs [] >>= vz  origin rest outs position
            IB position lang code: rest  ->                                 vb  origin rest outs position lang code

    terminM :: FilePath -> FilePath -> IO (FilePath, Bool)
    terminM origin link =
        canonicalizePath (origin ++ link)
        >>= \fqPath -> doesFileExist fqPath
        >>= \fileExists -> return (fqPath, fileExists)

--
    vx  :: FilePath -> [IElement] -> [OElement] -> Position -> String -> IO [OElement]
    vl  :: FilePath -> [IElement] -> [OElement] -> Position -> String -> (FilePath, Bool) -> IO [OElement]
    vp  :: FilePath -> [IElement] -> [OElement] -> Position -> [OElement] -> IO [OElement]
    vh1 :: FilePath -> [IElement] -> [OElement] -> Position -> [OElement] -> IO [OElement]
    vh2 :: FilePath -> [IElement] -> [OElement] -> Position -> [OElement] -> IO [OElement]
    vh3 :: FilePath -> [IElement] -> [OElement] -> Position -> [OElement] -> IO [OElement]
    vi  :: FilePath -> [IElement] -> [OElement] -> Position -> [OElement] -> IO [OElement]
    vu  :: FilePath -> [IElement] -> [OElement] -> Position -> [OElement] -> IO [OElement]
    vj  :: FilePath -> [IElement] -> [OElement] -> Position -> Int -> [OElement] -> IO [OElement]
    vo  :: FilePath -> [IElement] -> [OElement] -> Position -> [OElement] -> IO [OElement]
    vc  :: FilePath -> [IElement] -> [OElement] -> Position -> [OElement] -> IO [OElement]
    vr  :: FilePath -> [IElement] -> [OElement] -> Position -> [OElement] -> IO [OElement]
    vt  :: FilePath -> [IElement] -> [OElement] -> Position -> [OElement] -> IO [OElement]
    vz  :: FilePath -> [IElement] -> [OElement] -> Position -> [OElement] -> IO [OElement]
    vb  :: FilePath -> [IElement] -> [OElement] -> Position -> String -> [String] -> IO [OElement]

--
    vx  origin rest outs position string                     = validatingM' origin rest (outs ++ [OX position string])
    vl  origin rest outs position label (link, targetExists) = validatingM' origin rest (outs ++ [OL position label link targetExists])
    vp  origin rest outs position subs                       = validatingM' origin rest (outs ++ [OP position subs])
    vh1 origin rest outs position subs                       = validatingM' origin rest (outs ++ [O1 position subs])
    vh2 origin rest outs position subs                       = validatingM' origin rest (outs ++ [O2 position subs])
    vh3 origin rest outs position subs                       = validatingM' origin rest (outs ++ [O3 position subs])
    vi  origin rest outs position subs                       = validatingM' origin rest (outs ++ [OI position subs])
    vu  origin rest outs position subs                       = validatingM' origin rest (outs ++ [OU position subs])
    vj  origin rest outs position i subs                     = validatingM' origin rest (outs ++ [OJ position i subs])
    vo  origin rest outs position subs                       = validatingM' origin rest (outs ++ [OO position subs])
    vc  origin rest outs position subs                       = validatingM' origin rest (outs ++ [OC position subs])
    vr  origin rest outs position subs                       = validatingM' origin rest (outs ++ [OR position subs])
    vt  origin rest outs position subs                       = validatingM' origin rest (outs ++ [OT position subs])
    vz  origin rest outs position subs                       = validatingM' origin rest (outs ++ [OZ position subs])
    vb  origin rest outs position lang code                  = validatingM' origin rest (outs ++ [OB position lang code])

--


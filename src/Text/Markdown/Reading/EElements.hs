module Text.Markdown.Reading.EElements (promotedIs)
where
-- ⚠

    import Text.Markdown.Domain.Position (Position)
    import Text.Markdown.Domain.EElement (EElement (EX, EL, EP, E1, E2, E3, EI, EU, EJ, EO, EC, ER, ET, EZ, EB))
    import Text.Markdown.Domain.IElement (IElement (IX, IL, IP, I1, I2, I3, II, IU, IJ, IO, IC, IR, IT, IZ, IB))

--
    promotedIs :: [EElement] -> IO [IElement]
    promotedIs = return . positing

    positing :: [EElement] -> [IElement]
    positing = outer (0, -1, -1, -1)

--
    outer :: Position -> [EElement] -> [IElement]
    outer position vds =
        case vds of
            [] -> []
            EP subs: rest -> ip  position subs: outer (incI position) rest
            E1 subs: rest -> ih1 position subs: outer (incI position) rest
            E2 subs: rest -> ih2 position subs: outer (incI position) rest
            E3 subs: rest -> ih3 position subs: outer (incI position) rest
            EU subs: rest -> iu  position subs: outer (incI position) rest
            EO subs: rest -> io  position subs: outer (incI position) rest
            ET subs: rest -> it  position subs: outer (incI position) rest
            EZ subs: rest -> iz  position subs: outer (incI position) rest
            EB l c : rest -> IB  position l c : outer (incI position) rest
            vd     : _     -> error (show vd)

    ip  :: Position -> [EElement] -> IElement
    ih1 :: Position -> [EElement] -> IElement
    ih2 :: Position -> [EElement] -> IElement
    ih3 :: Position -> [EElement] -> IElement
    iu  :: Position -> [EElement] -> IElement
    io  :: Position -> [EElement] -> IElement
    it  :: Position -> [EElement] -> IElement
    iz  :: Position -> [EElement] -> IElement

    ip  position subs = IP position (mid1 (incJ position) subs)
    ih1 position subs = I1 position (mid1 (incJ position) subs)
    ih2 position subs = I2 position (mid1 (incJ position) subs)
    ih3 position subs = I3 position (mid1 (incJ position) subs)
    iu  position subs = IU position (mid1 (incJ position) subs)
    io  position subs = IO position (mid1 (incJ position) subs)
    it  position subs = IT position (mid1 (incJ position) subs)
    iz  position subs = IZ position (mid1 (incJ position) subs)

--
    mid1 :: Position -> [EElement] -> [IElement]
    mid1 position vds =
        case vds of
            [] -> []
            EX  string: rest -> IX position string: mid1 (incJ position) rest
            EL  la li : rest -> IL position la li : mid1 (incJ position) rest
            EI  subs  : rest -> ii position   subs: mid1 (incJ position) rest
            EJ  n subs: rest -> ij position n subs: mid1 (incJ position) rest
            ER  subs  : rest -> ir position   subs: mid1 (incJ position) rest
            vd        : _    -> error (show vd)

    ii :: Position -> [EElement] -> IElement
    ij :: Position -> Int -> [EElement] -> IElement
    ir :: Position -> [EElement] -> IElement

    ii position subs                = II position   (mid2 (incK position) subs)
    ij position n subs              = IJ position n (mid2 (incK position) subs)
    ir position subs                = IR position   (mid2 (incK position) subs)

--
    mid2 :: Position -> [EElement] -> [IElement]
    mid2 position vds =
        case vds of
            [] -> []
            EX  string: rest -> IX position string: mid2 (incK position) rest
            EL  la li : rest -> IL position la li : mid2 (incK position) rest
            EC  subs  : rest -> ic position subs  : mid2 (incK position) rest
            vd        : _    -> error (show vd)

    ic :: Position -> [EElement] -> IElement
    ic position subs = IC position (inner (incH position) subs)

--
    inner :: Position -> [EElement] -> [IElement]
    inner position vds =
        case vds of
            [] -> []
            EX  string: rest -> IX position string: inner (incH position) rest
            EL  la li : rest -> IL position la li : inner (incH position) rest
            vd        : _    -> error (show vd)

--
    incI :: Position -> Position
    incI (i, _, _, _) = (i + 1, -1, -1, -1)

    incJ :: Position -> Position
    incJ (i, j, _, _) = (i, j + 1, -1, -1)

    incK :: Position -> Position
    incK (i, j, k, _) = (i, j, k + 1, -1)

    incH :: Position -> Position
    incH (i, j, k, h) = (i, j, k, h + 1)

--


module Text.Markdown.Writing.OElements (demotedIs)
where
-- ⚠

    import Text.Markdown.Domain.IElement (IElement (IX, IL, IP, I1, I2, I3, II, IU, IJ, IO, IC, IR, IT, IZ, IB))
    import Text.Markdown.Domain.OElement (OElement (OX, OL, OP, O1, O2, O3, OI, OU, OJ, OO, OC, OR, OT, OZ, OB))

--
    demotedIs :: [OElement] -> [IElement]
    demotedIs elements =
        case elements of
            [] -> []
            OX position string: rest -> IX position string: demotedIs rest
            OL position label target _: rest -> IL position label target: demotedIs rest
            OP position subelements: rest -> IP position (demotedIs subelements): demotedIs rest
            O1 position subelements: rest -> I1 position (demotedIs subelements): demotedIs rest
            O2 position subelements: rest -> I2 position (demotedIs subelements): demotedIs rest
            O3 position subelements: rest -> I3 position (demotedIs subelements): demotedIs rest
            OI position subelements: rest -> II position (demotedIs subelements): demotedIs rest
            OU position subelements: rest -> IU position (demotedIs subelements): demotedIs rest
            OJ position index subelements: rest -> IJ position index (demotedIs subelements): demotedIs rest
            OO position subelements: rest -> IO position (demotedIs subelements): demotedIs rest
            OC position subelements: rest -> IC position (demotedIs subelements): demotedIs rest
            OR position subelements: rest -> IR position (demotedIs subelements): demotedIs rest
            OT position subelements: rest -> IT position (demotedIs subelements): demotedIs rest
            OZ position subelements: rest -> IZ position (demotedIs subelements): demotedIs rest
            OB position tipe code: rest -> IB position tipe code: demotedIs rest


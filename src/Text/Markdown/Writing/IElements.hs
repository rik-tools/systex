module Text.Markdown.Writing.IElements (demotedEs)
where
-- ⚠

    import Text.Markdown.Domain.EElement (EElement (EX, EL, EP, E1, E2, E3, EI, EU, EJ, EO, EC, ER, ET, EZ, EB))
    import Text.Markdown.Domain.IElement (IElement (IX, IL, IP, I1, I2, I3, II, IU, IJ, IO, IC, IR, IT, IZ, IB))

--
    demotedEs :: [IElement] -> [EElement]
    demotedEs elements =
        case elements of
            [] -> []
            IX _ string: rest -> EX string: demotedEs rest
            IL _ label target: rest -> EL label target: demotedEs rest
            IP _ subelements: rest -> EP (demotedEs subelements): demotedEs rest
            I1 _ subelements: rest -> E1 (demotedEs subelements): demotedEs rest
            I2 _ subelements: rest -> E2 (demotedEs subelements): demotedEs rest
            I3 _ subelements: rest -> E3 (demotedEs subelements): demotedEs rest
            II _ subelements: rest -> EI (demotedEs subelements): demotedEs rest
            IU _ subelements: rest -> EU (demotedEs subelements): demotedEs rest
            IJ _ index subelements: rest -> EJ index (demotedEs subelements): demotedEs rest
            IO _ subelements: rest -> EO (demotedEs subelements): demotedEs rest
            IC _ subelements: rest -> EC (demotedEs subelements): demotedEs rest
            IR _ subelements: rest -> ER (demotedEs subelements): demotedEs rest
            IT _ subelements: rest -> ET (demotedEs subelements): demotedEs rest
            IZ _ subelements: rest -> EZ (demotedEs subelements): demotedEs rest
            IB _ tipe code: rest -> EB tipe code: demotedEs rest


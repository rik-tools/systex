module Text.Markdown.Writing.AElementz (demotedAs)
where
-- ⚠

    import Text.Markdown.Domain.AElement (AElement (ACr, AEm, AH1, AH2, AH3, APa, AUI, AOI, ATR, ABO))

--
    demotedAs :: [[AElement]] -> [AElement]
    demotedAs elementz =
        case elementz of
            [] -> []
            elements: rest -> demotedA elements ++ demotedAs rest

    demotedA :: [AElement] -> [AElement]
    demotedA elements =
        case elements of
            ATR _: _ -> elements
            AUI _: _ -> elements
            AOI _: _ -> elements
            ABO _: _ -> elements
            _: _: _ -> error "never"
            [ACr _] -> elements
            [APa _] -> elements
            [AH1 _] -> AEm: AEm: AEm: elements
            [AH2 _] -> AEm: AEm: elements
            [AH3 _] -> AEm: elements
            [_] -> error "never"
            [] -> []

--

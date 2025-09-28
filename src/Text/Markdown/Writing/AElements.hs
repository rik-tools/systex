module Text.Markdown.Writing.AElements (demotedMD)
where
-- ⚠

    import System.Filer (FileCont)
    import Text.Markdown.Domain.AElement (AElement (ACr, AEm, AH1, AH2, AH3, APa, AUI, AOI, ATR, ABO, ABC))

--
    demotedMD :: [AElement] -> FileCont
    demotedMD elements =
        unlines (map string elements)

    string :: AElement -> String
    string element =
        case element of
            AEm -> ""
            APa string -> string
            ACr string -> string
            AH1 string -> string
            AH2 string -> string
            AH3 string -> string
            AUI string -> string
            AOI string -> string
            ATR string -> string
            ABO string -> string
            ABC -> "```"


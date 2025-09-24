{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Eta reduce" #-}
module Text.Markdown.Reading.Converter (convertingM)
where
-- ⚠

    import Data.Char (isSpace)
    import Data.List (isInfixOf)
    import Data.List.Split (splitOn)
    import Data.List.Tools (takeUntil)
    import Text.Regex.TDFA ((=~), getAllTextMatches)
    import Text.Markdown.Domain.AElement (AElement (APa, AH1, AH2, AH3, AUI, AOI, ATR, ACr, ABO, ABC))
    import Text.Markdown.Domain.EElement (EElement (EX, EL, EP, E1, E2, E3, EI, EU, EJ, EO, EC, ER, ET, EZ, EB))

--
    convertingM :: [[AElement]] -> IO [EElement]
    convertingM =
        return . markdowns

    markdowns :: [[AElement]] -> [EElement]
    markdowns mdChunks =
        case mdChunks of
            [] -> []
            [AH1 string]: rest -> h1 string: markdowns rest
            [AH2 string]: rest -> h2 string: markdowns rest
            [AH3 string]: rest -> h3 string: markdowns rest
            [APa string]: rest -> pa string: markdowns rest
            [ACr string]: rest -> cr string: markdowns rest
            (AUI string: mdlUIs): rest -> u (AUI string: mdlUIs): markdowns rest
            (AOI string: mdlOIs): rest -> o (AOI string: mdlOIs): markdowns rest
            (ATR string: mdlTRs): rest -> t (ATR string: mdlTRs): markdowns rest
            (ABO string: mdlCIs): rest -> b (ABO string: mdlCIs): markdowns rest
            _: rest -> markdowns rest

--
    regex :: String
    regex = "\\[[^]]+\\]\\([^)]+\\)|[^\\[]+"

    parts :: String -> [EElement]
    parts string = map xl (strings string)

    strings :: String -> [String]
    strings string = getAllTextMatches (string =~ regex) :: [String]

    xl :: String -> EElement
    xl string =
        if isInfixOf "](" string
            then EL (label string) (link string)
            else EX string

    label :: String -> String
    label string =
        case string of
            "" -> error "never"
            _  -> case splitOn "](" string of
                [label, _] -> drop 1 label
                _          -> error "never"

    link :: String -> String
    link string =
        case string of
            "" -> error "never"
            _  -> init (last (splitOn "](" string))

--
    pa :: String -> EElement
    pa string = EP (parts string)

    h1 :: String -> EElement
    h1 string = E1 (parts (drop 2 string))

    h2 :: String -> EElement
    h2 string = E2 (parts (drop 3 string))

    h3 :: String -> EElement
    h3 string = E3 (parts (drop 4 string))

--
    cr :: String -> EElement
    cr string = EZ (parts string)

--
    u :: [AElement] -> EElement
    u mdChunk = EU (is mdChunk)

    is :: [AElement] -> [EElement]
    is mdChunk =
        case mdChunk of
            AUI string: mdAElements -> i string: is mdAElements
            _  -> []

    i :: String -> EElement
    i string = EI (parts (drop 2 string))

--
    o :: [AElement] -> EElement
    o mdChunk = EO (js mdChunk)

    js :: [AElement] -> [EElement]
    js mdChunk =
        case mdChunk of
            AOI string: mdAElements -> j string: js mdAElements
            _ -> []

    j :: String -> EElement
    j string = EJ (read (init (takeUntil isDot string)) :: Int) (parts (dropWhile isNumbering string))

--
    t :: [AElement] -> EElement
    t mdAElements = ET (map r mdAElements)

    r :: AElement -> EElement
    r mdAElement =
        case mdAElement of
            ATR string -> ER (cs string)
            _ -> error "never"

    cs :: String -> [EElement]
    cs string =
        case string of
            '|': string     -> case reverse string of
                '|': string -> map EC (map parts (map trimming (splitOn "|" (reverse string))))
                _           -> error "never"
            _               -> error "never"

--
    b :: [AElement] -> EElement
    b mdAElements =
        case mdAElements of
            ABO string: rest -> EB (lang string) (script rest)
            _ -> error "never"

    lang :: String -> String
    lang string = drop 3 string

    script :: [AElement] -> [String]
    script mdAElements =
        case mdAElements of
            [ABC] -> []
            APa string: rest -> case cleaned string of
                "" -> script rest
                s  -> s: script rest
            _ -> error "never"

    cleaned :: String -> String
    cleaned string =
        unwords (filter isClean (words string))

    isClean :: String -> Bool
    isClean string =
        string /= "clear"
        && string /= "clear;"

--
    trimming :: String -> String
    trimming string = (reverse . dropWhile isSpace . reverse . dropWhile isSpace) string

--
    isDot :: Char -> Bool
    isDot char = char == '.'

--
    isNumbering :: Char -> Bool
    isNumbering char = elem char " .0123456789"

--


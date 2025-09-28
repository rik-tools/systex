module Text.Markdown.Reading.FileCont (promotedAs)
where
-- ⚠

    import Data.List (isPrefixOf)
    import System.Filer (FileCont)
    import Text.Regex.TDFA ((=~))
    import Text.Markdown.Domain.AElement (AElement (AEm, APa, AH1, AH2, AH3, AUI, AOI, ATR, ACr, ABO, ABC))

    labelR  :: String; labelR  = "[a-zA-Z0-9 -]+"
    targetR :: String; targetR = "[a-zA-Z0-9 /-]+"
    linkR   :: String; linkR   = "\\[" ++ labelR ++ "\\]\\(" ++ targetR ++ "\\)"
    crumbR  :: String; crumbR  = linkR ++ "|" ++ labelR
    crumbsR :: String; crumbsR = crumbR ++ "(: " ++ crumbR ++ ")*"

--
    promotedAs :: FileCont -> IO [AElement]
    promotedAs fileCont =
        let fileLines = lines fileCont
        in case fileLines of
            []          -> return []
            first: rest -> if first =~ crumbsR :: Bool
                then return (ACr first: map line rest)
                else return (map line fileLines)

    line :: String -> AElement
    line string
        | isEm string = AEm
        | isBC string = ABC
        | isBO string = ABO string
        | isH1 string = AH1 string
        | isH2 string = AH2 string
        | isH3 string = AH3 string
        | isUI string = AUI string
        | isOI string = AOI string
        | isTR string = ATR string
        | otherwise   = APa string

    isEm :: String -> Bool
    isEm string =
        string == ""

    isH1 :: String -> Bool
    isH1 string =
        string =~ "^# .+" :: Bool

    isH2 :: String -> Bool
    isH2 string =
        string =~ "^## .+" :: Bool

    isH3 :: String -> Bool
    isH3 string =
        string =~ "^### .+" :: Bool

    isUI :: String -> Bool
    isUI string =
        string =~ "^\\* .+" :: Bool

    isOI :: String -> Bool
    isOI string =
        string =~ "^[0-9]+\\. .+" :: Bool

    isTR :: String -> Bool
    isTR string =
        string =~ "^\\|.+" :: Bool

    isBO :: String -> Bool
    isBO string =
        length string > 3 && isPrefixOf "```" string

    isBC :: String -> Bool
    isBC string =
        string == "```"

--


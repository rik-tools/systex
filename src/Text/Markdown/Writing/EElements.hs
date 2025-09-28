module Text.Markdown.Writing.EElements (demotedAz)
where
-- ⚠

    import Data.List (intercalate)
    import Text.Markdown.Domain.AElement (AElement (ACr, AH1, AH2, AH3, APa, AUI, AOI, ATR, ABO, ABC))
    import Text.Markdown.Domain.EElement (EElement (EX, EL, EP, E1, E2, E3, EI, EU, EJ, EO, EC, ER, ET, EZ, EB))

    demotedAz :: [EElement] -> [[AElement]]
    demotedAz elements =
        case elements of
            [] -> []
            ET subelements: rest -> atrs subelements: demotedAz rest
            EU subelements: rest -> auis subelements: demotedAz rest
            EO subelements: rest -> aojs subelements: demotedAz rest
            EP subelements: rest -> [APa (axl subelements)]: demotedAz rest
            E1 subelements: rest -> [AH1 ("# " ++ axl subelements)]: demotedAz rest
            E2 subelements: rest -> [AH2 ("## " ++ axl subelements)]: demotedAz rest
            E3 subelements: rest -> [AH3 ("### " ++ axl subelements)]: demotedAz rest
            EZ subelements: rest -> [ACr (axl subelements)]: demotedAz rest
            EB tipe code: rest -> ab tipe code: demotedAz rest
            _ -> error "never"

    atrs :: [EElement] -> [AElement]
    atrs ers =
        case ers of
            ER ecsHead: ER ecsNeck: rest -> atr ecsHead: atrNeck ecsNeck: atrs' rest
            _ -> error "never"

    atrs' :: [EElement] -> [AElement]
    atrs' ers =
        case ers of
            [] -> []
            ER ecs: rest -> atr ecs: atrs' rest
            _ -> error "never"

    atr :: [EElement] -> AElement
    atr ecs =
        ATR ("| " ++ intercalate " | " (map ac ecs) ++ " |")

    atrNeck :: [EElement] -> AElement
    atrNeck ecs =
        ATR ("|" ++ intercalate "|" (map ac ecs) ++ "|")

    ac :: EElement -> String
    ac element =
        case element of
            EC exls -> axl exls
            _ -> error "never"

    aojs :: [EElement] -> [AElement]
    aojs ejs =
        case ejs of
            [] -> []
            EJ index exls: rest -> AOI (show index ++ ". " ++ axl exls): aojs rest
            _ -> error "never"

    auis :: [EElement] -> [AElement]
    auis eis =
        case eis of
            [] -> []
            EI exls: rest -> AUI ("* " ++ axl exls): auis rest
            _ -> error "never"

    ab :: String -> [String] -> [AElement]
    ab tipe code =
        ABO ("```" ++ tipe): map APa code ++ [ABC]

    axl :: [EElement] -> String
    axl xls =
        case xls of
            [] -> ""
            EX string: rest -> string ++ axl rest
            EL label target: rest -> "[" ++ label ++ "](" ++ target ++ ")" ++ axl rest
            _ -> error "never"


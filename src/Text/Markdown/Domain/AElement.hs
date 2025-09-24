-- ⚠
module Text.Markdown.Domain.AElement (AElement (AEm, APa, AH1, AH2, AH3, AUI, AOI, ATR, ACr, ABO, ABC))
where

    data AElement = AEm | APa String | AH1 String | AH2 String | AH3 String | AUI String | AOI String | ATR String | ACr String | ABO String | ABC deriving (Eq, Show, Read)

--

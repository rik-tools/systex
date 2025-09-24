-- ⚠
module Text.Markdown.Domain.OElement (OElement (OX, OL, OP, O1, O2, O3, OI, OU, OJ, OO, OC, OR, OT, OZ, OB))
where

    import Text.Markdown.Domain.Predicate (IsTarget)
    import Text.Markdown.Domain.Position (Position)

    data OElement = OX Position String | OL Position String FilePath IsTarget | OP Position [OElement] | O1 Position [OElement] | O2 Position [OElement] | O3 Position [OElement] | OI Position [OElement] | OU Position [OElement] | OJ Position Int [OElement] | OO Position [OElement] | OC Position [OElement] | OR Position [OElement] | OT Position [OElement] | OZ Position [OElement] | OB Position String [String] deriving (Eq, Show, Read)

--

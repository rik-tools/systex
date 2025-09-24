-- ⚠
module Text.Markdown.Domain.EElement (EElement (EX, EL, EP, E1, E2, E3, EI, EU, EJ, EO, EC, ER, ET, EZ, EB))
where

    data EElement = EX String | EL String FilePath | EP [EElement] | E1 [EElement] | E2 [EElement] | E3 [EElement] | EI [EElement] | EU [EElement] | EJ Int [EElement] | EO [EElement] | EC [EElement] | ER [EElement] | ET [EElement] | EZ [EElement] | EB String [String] deriving (Eq, Show, Read)

--

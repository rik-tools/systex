{-# LANGUAGE QuasiQuotes #-}
module Data (originalFP, actualFP, fileCont, aElements, aElementz, eElements, iElements, oElements)
where
-- ⚠

    import Data.Text (unpack)
    import NeatInterpolation (text)
    import System.Filer (FileCont)
    import Text.Markdown.Domain.AElement (AElement (ACr, AEm, AH1, AH2, AH3, APa, AUI, AOI, ATR, ABO, ABC))
    import Text.Markdown.Domain.EElement (EElement (EX, EL, EP, E1, E2, E3, EI, EU, EJ, EO, EC, ER, ET, EZ, EB))
    import Text.Markdown.Domain.IElement (IElement (IX, IL, IP, I1, I2, I3, II, IU, IJ, IO, IC, IR, IT, IZ, IB))
    import Text.Markdown.Domain.OElement (OElement (OX, OL, OP, O1, O2, O3, OI, OU, OJ, OO, OC, OR, OT, OZ, OB))

    originalFP :: FilePath
    originalFP = "/tmp/original.md"

    actualFP :: FilePath
    actualFP = "/tmp/actual.md"

    fileCont :: FileCont
    fileCont = unpack [text|
        Umbrella: [Project](/tmp/readme.md)
        
        
        
        # Whatever
        This is a paragraph.
        
        
        ## Lists
        
        ### Unordered
        * Nothing
        * Something
        
        ### Ordered
        1. First
        2. Second
        
        
        ## Other
        
        ### Table
        | Key | Gem |
        |----:|-----|
        | 001 | one |
        | 002 | two |
        
        ### Block
        ```bash
        echo yo
        ```
    |] ++ "\n"

    aElements :: [AElement]
    aElements = [
        ACr "Umbrella: [Project](/tmp/readme.md)",
        AEm,
        AEm,
        AEm,
        AH1 "# Whatever",
        APa "This is a paragraph.",
        AEm,
        AEm,
        AH2 "## Lists",
        AEm,
        AH3 "### Unordered",
        AUI "* Nothing",
        AUI "* Something",
        AEm,
        AH3 "### Ordered",
        AOI "1. First",
        AOI "2. Second",
        AEm,
        AEm,
        AH2 "## Other",
        AEm,
        AH3 "### Table",
        ATR "| Key | Gem |",
        ATR "|----:|-----|",
        ATR "| 001 | one |",
        ATR "| 002 | two |",
        AEm,
        AH3 "### Block",
        ABO "```bash",
        APa "echo yo",
        ABC]

    aElementz :: [[AElement]]
    aElementz = [
        [ACr "Umbrella: [Project](/tmp/readme.md)"],
        [AH1 "# Whatever"],
        [APa "This is a paragraph."],
        [AH2 "## Lists"],
        [AH3 "### Unordered"],
        [AUI "* Nothing", AUI "* Something"],
        [AH3 "### Ordered"],
        [AOI "1. First", AOI "2. Second"],
        [AH2 "## Other"],
        [AH3 "### Table"],
        [ATR "| Key | Gem |", ATR "|----:|-----|", ATR "| 001 | one |", ATR "| 002 | two |"],
        [AH3 "### Block"],
        [ABO "```bash", APa "echo yo", ABC]]

    eElements :: [EElement]
    eElements = [
        EZ [EX "Umbrella: ", EL "Project" "/tmp/readme.md"],
        E1 [EX "Whatever"],
        EP [EX "This is a paragraph."],
        E2 [EX "Lists"],
        E3 [EX "Unordered"],
        EU [EI [EX "Nothing"], EI [EX "Something"]],
        E3 [EX "Ordered"],
        EO [EJ 1 [EX "First"], EJ 2 [EX "Second"]],
        E2 [EX "Other"],
        E3 [EX "Table"],
        ET [
            ER [EC [EX "Key"], EC [EX "Gem"]], 
            ER [EC [EX "----:"], EC [EX "-----"]], 
            ER [EC [EX "001"], EC [EX "one"]],
            ER [EC [EX "002"], EC [EX "two"]]],
        E3 [EX "Block"],
        EB "bash" ["echo yo"]]

    iElements :: [IElement]
    iElements = [
        IZ (0, -1, -1, -1) [
            IX (0, 0, -1, -1) "Umbrella: ",
            IL (0, 1, -1, -1) "Project" "/tmp/readme.md"],
        I1 (1, -1, -1, -1) [
            IX (1, 0, -1, -1) "Whatever"],
        IP (2, -1, -1, -1) [
            IX (2, 0, -1, -1) "This is a paragraph."],
        I2 (3, -1, -1, -1) [
            IX (3, 0, -1, -1) "Lists"],
        I3 (4, -1, -1, -1) [
            IX (4, 0, -1, -1) "Unordered"],
        IU (5, -1, -1, -1) [
            II (5, 0, -1, -1) [
                IX (5, 0, 0, -1) "Nothing"],
            II (5, 1, -1, -1) [
                IX (5, 1, 0, -1) "Something"]],
        I3 (6, -1, -1, -1) [
            IX (6, 0, -1, -1) "Ordered"],
        IO (7, -1, -1, -1) [
            IJ (7, 0, -1, -1) 1 [
                IX (7, 0, 0, -1) "First"],
            IJ (7, 1, -1, -1) 2 [
                IX (7, 1, 0, -1) "Second"]],
        I2 (8, -1, -1, -1) [
            IX (8, 0, -1, -1) "Other"],
        I3 (9, -1, -1, -1) [
            IX (9, 0, -1, -1) "Table"],
        IT (10, -1, -1, -1) [
            IR (10, 0, -1, -1) [
                IC (10, 0, 0, -1) [
                    IX (10, 0, 0, 0) "Key"],
                IC (10, 0, 1, -1) [
                    IX (10, 0, 1, 0) "Gem"]],
            IR (10, 1, -1, -1) [
                IC (10, 1, 0, -1) [
                    IX (10, 1, 0, 0) "----:"],
                IC (10, 1, 1, -1) [
                    IX (10, 1, 1, 0) "-----"]],
            IR (10, 2, -1, -1) [
                IC (10, 2, 0, -1) [
                    IX (10, 2, 0, 0) "001"],
                IC (10, 2, 1, -1) [
                    IX (10, 2, 1, 0) "one"]],
            IR (10, 3, -1, -1) [
                IC (10, 3, 0, -1) [
                    IX (10, 3, 0, 0) "002"],
                IC (10, 3, 1, -1) [
                    IX (10, 3, 1, 0) "two"]]],
        I3 (11, -1, -1, -1) [
            IX (11, 0, -1, -1) "Block"],
        IB (12, -1, -1, -1) "bash" ["echo yo"]]

    oElements :: [OElement]
    oElements = [
        OZ (0, -1, -1, -1) [
            OX (0, 0, -1, -1) "Umbrella: ",
            OL (0, 1, -1, -1) "Project" "/tmp/readme.md" False],
        O1 (1, -1, -1, -1) [
            OX (1, 0, -1, -1) "Whatever"],
        OP (2, -1, -1, -1) [
            OX (2, 0, -1, -1) "This is a paragraph."],
        O2 (3, -1, -1, -1) [
            OX (3, 0, -1, -1) "Lists"],
        O3 (4, -1, -1, -1) [
            OX (4, 0, -1, -1) "Unordered"],
        OU (5, -1, -1, -1) [
            OI (5, 0, -1, -1) [
                OX (5, 0, 0, -1) "Nothing"],
            OI (5, 1, -1, -1) [
                OX (5, 1, 0, -1) "Something"]],
        O3 (6, -1, -1, -1) [
            OX (6, 0, -1, -1) "Ordered"],
        OO (7, -1, -1, -1) [
            OJ (7, 0, -1, -1) 1 [
                OX (7, 0, 0, -1) "First"],
            OJ (7, 1, -1, -1) 2 [
                OX (7, 1, 0, -1) "Second"]],
        O2 (8, -1, -1, -1) [
            OX (8, 0, -1, -1) "Other"],
        O3 (9, -1, -1, -1) [
            OX (9, 0, -1, -1) "Table"],
        OT (10, -1, -1, -1) [
            OR (10, 0, -1, -1) [
                OC (10, 0, 0, -1) [
                    OX (10, 0, 0, 0) "Key"],
                OC (10, 0, 1, -1) [
                    OX (10, 0, 1, 0) "Gem"]],
            OR (10, 1, -1, -1) [
                OC (10, 1, 0, -1) [
                    OX (10, 1, 0, 0) "----:"],
                OC (10, 1, 1, -1) [
                    OX (10, 1, 1, 0) "-----"]],
            OR (10, 2, -1, -1) [
                OC (10, 2, 0, -1) [
                    OX (10, 2, 0, 0) "001"],
                OC (10, 2, 1, -1) [
                    OX (10, 2, 1, 0) "one"]],
            OR (10, 3, -1, -1) [
                OC (10, 3, 0, -1) [
                    OX (10, 3, 0, 0) "002"],
                OC (10, 3, 1, -1) [
                    OX (10, 3, 1, 0) "two"]]],
        O3 (11, -1, -1, -1) [
            OX (11, 0, -1, -1) "Block"],
        OB (12, -1, -1, -1) "bash" ["echo yo"]]


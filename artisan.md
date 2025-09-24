Rik Tools: [Systex](readme.md)



# Artisan
* Hacker pipe: ¦
* Hacker sour root: src
* Hacker test root: tst
* Hacker test runner: Test


## Presets
| Module       | Name     |
|--------------|----------|
| System.Filer | FileCont |


## Types
| Folder | Module                         | Name     | Value                |
|--------|--------------------------------|----------|----------------------|
| src    | Text.Markdown.Domain.Predicate | IsTarget | Bool                 |
| src    | Text.Markdown.Domain.Position  | Position | (Int, Int, Int, Int) |


## Data
| Folder | Module                        | Name     | Value |
|--------|-------------------------------|----------|-------|
| src    | Text.Markdown.Domain.AElement | AElement | AEm ¦ APa String ¦ AH1 String ¦ AH2 String ¦ AH3 String ¦ AUI String ¦ AOI String ¦ ATR String ¦ ACr String ¦ ABO String ¦ ABC deriving (Eq, Show, Read) |
| src    | Text.Markdown.Domain.EElement | EElement | EX String ¦ EL String FilePath ¦ EP [EElement] ¦ E1 [EElement] ¦ E2 [EElement] ¦ E3 [EElement] ¦ EI [EElement] ¦ EU [EElement] ¦ EJ Int [EElement] ¦ EO [EElement] ¦ EC [EElement] ¦ ER [EElement] ¦ ET [EElement] ¦ EZ [EElement] ¦ EB String [String] deriving (Eq, Show, Read) |
| src    | Text.Markdown.Domain.IElement | IElement | IX Position String ¦ IL Position String FilePath ¦ IP Position [IElement] ¦ I1 Position [IElement] ¦ I2 Position [IElement] ¦ I3 Position [IElement] ¦ II Position [IElement] ¦ IU Position [IElement] ¦ IJ Position Int [IElement] ¦ IO Position [IElement] ¦ IC Position [IElement] ¦ IR Position [IElement] ¦ IT Position [IElement] ¦ IZ Position [IElement] ¦ IB Position String [String] deriving (Eq, Show, Read) |
| src    | Text.Markdown.Domain.OElement | OElement | OX Position String ¦ OL Position String FilePath IsTarget ¦ OP Position [OElement] ¦ O1 Position [OElement] ¦ O2 Position [OElement] ¦ O3 Position [OElement] ¦ OI Position [OElement] ¦ OU Position [OElement] ¦ OJ Position Int [OElement] ¦ OO Position [OElement] ¦ OC Position [OElement] ¦ OR Position [OElement] ¦ OT Position [OElement] ¦ OZ Position [OElement] ¦ OB Position String [String] deriving (Eq, Show, Read) |

## Constants
| Folder | Module | Name | Type |
|--------|--------|------|------|


## Functions
| Folder | Module                           | Name         | Type                                    |
|--------|----------------------------------|--------------|-----------------------------------------|
| src    | Text.Markdown.Reading.Reader     | readingM     | FilePath -> IO FileCont                 |
| src    | Text.Markdown.Reading.Lineator   | lineatingM   | FileCont -> IO [AElement]               |
| src    | Text.Markdown.Reading.Aggregator | aggregatingM | [AElement] -> IO [[AElement]]           |
| src    | Text.Markdown.Reading.Converter  | convertingM  | [[AElement]] -> IO [EElement]           |
| src    | Text.Markdown.Reading.Positor    | positingM    | [EElement] -> IO [IElement]             |
| src    | Text.Markdown.Reading.Validator  | validatingM  | FilePath -> [IElement] -> IO [OElement] |


## Interfaces
| Folder | Module | Name |
|--------|--------|------|


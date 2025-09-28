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
| Folder | Module | Name       | Type         |
|--------|--------|------------|--------------|
| tst    | Data   | originalFP | FilePath     |
| tst    | Data   | actualFP   | FilePath     |
| tst    | Data   | fileCont   | FileCont     |
| tst    | Data   | aElements  | [AElement]   |
| tst    | Data   | aElementz  | [[AElement]] |
| tst    | Data   | eElements  | [EElement]   |
| tst    | Data   | iElements  | [IElement]   |
| tst    | Data   | oElements  | [OElement]   |


## Functions
| Folder | Module                          | Name       | Type                                    |
|--------|---------------------------------|------------|-----------------------------------------|
| src    | Text.Markdown.Reading.FilePath  | promotedMD | FilePath -> IO FileCont                 |
| src    | Text.Markdown.Reading.FileCont  | promotedAs | FileCont -> IO [AElement]               |
| src    | Text.Markdown.Reading.AElements | promotedAz | [AElement] -> IO [[AElement]]           |
| src    | Text.Markdown.Reading.AElementz | promotedEs | [[AElement]] -> IO [EElement]           |
| src    | Text.Markdown.Reading.EElements | promotedIs | [EElement] -> IO [IElement]             |
| src    | Text.Markdown.Reading.IElements | promotedOs | FilePath -> [IElement] -> IO [OElement] |
| src    | Text.Markdown.Writing.OElements | demotedIs  | [OElement] -> [IElement]                |
| src    | Text.Markdown.Writing.IElements | demotedEs  | [IElement] -> [EElement]                |
| src    | Text.Markdown.Writing.EElements | demotedAz  | [EElement] -> [[AElement]]              |
| src    | Text.Markdown.Writing.AElementz | demotedAs  | [[AElement]] -> [AElement]              |
| src    | Text.Markdown.Writing.AElements | demotedMD  | [AElement] -> FileCont                  |
| src    | Text.Markdown.Writing.FileCont  | demotedFP  | FilePath -> FileCont -> IO ()           |


## Interfaces
| Folder | Module        | Name       |
|--------|---------------|------------|
| src    | Text.Markdown | promotedMD |
| src    | Text.Markdown | promotedAs |
| src    | Text.Markdown | promotedAz |
| src    | Text.Markdown | promotedEs |
| src    | Text.Markdown | promotedIs |
| src    | Text.Markdown | promotedOs |
| src    | Text.Markdown | demotedIs  |
| src    | Text.Markdown | demotedEs  |
| src    | Text.Markdown | demotedAz  |
| src    | Text.Markdown | demotedAs  |
| src    | Text.Markdown | demotedMD  |
| src    | Text.Markdown | demotedFP  |


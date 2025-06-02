[Rho System](readme.md)



# Artisan
* Hacker pipe: ¦
* Hacker main root: app
* Hacker sour root: src
* Hacker test root: tst
* Hacker main runner: Main
* Hacker test runner: Test


## Presets
| Module | Name |
|--------|------|


## Types
| Folder | Module              | Name     | Value  |
|--------|---------------------|----------|--------|
| src    | System.Filer.Domain | FisoMode | String |
| src    | System.Filer.Domain | FileCont | String |
| src    | System.Filer.Domain | LinkCont | String |
| src    | System.Filer.Domain | FilePref | String |
| src    | System.Filer.Domain | FileSuff | String |
| src    | System.Filer.Domain | BaseVar  | String |


## Data
| Folder | Module                 | Name           | Value                                                                 |
|--------|------------------------|----------------|-----------------------------------------------------------------------|
| src    | System.Filer.Domain    | FisoType       | None ¦ Null ¦ PFold ¦ PFile ¦ VFold ¦ VFile deriving (Eq, Show, Read) |
| src    | System.Filer.Exception | FilerException | FilerException String deriving (Eq, Show, Read)                       |


## Constants
| Folder | Module               | Name    | Type   |
|--------|----------------------|---------|--------|
| src    | System.Filer.Strings | version | String |


## Functions
| Folder | Module                          | Name            | Type                                               |
|--------|---------------------------------|-----------------|----------------------------------------------------|
| src    | System.Exiter                   | exit            | Int -> String -> IO a                              |
| src    | System.Filer.Exception          | throwFE         | String -> IO a                                     |
| src    | System.Filer.Fiso.PathReader    | basename        | FilePath -> FilePath                               |
| src    | System.Filer.Fiso.PathReader    | dirname         | FilePath -> Maybe FilePath                         |
| src    | System.Filer.Fiso.TypeReader    | fisoType        | FilePath -> IO FisoType                            |
| src    | System.Filer.Fiso.ModeReader    | fisoMode        | FilePath -> IO FisoMode                            |
| src    | System.Filer.Fiso.ModeThinker   | isFisoMode      | FisoMode -> Bool                                   |
| src    | System.Filer.Fiso.ModeWriter    | setFisoMode     | FilePath -> FisoMode -> IO ()                      |
| src    | System.Filer.Fiso.FileChecker   | existAsFiles    | [FilePref] -> FileSuff -> BaseVar -> IO Bool       |
| src    | System.Filer.Fiso.FileOffsetter | offsetFilePaths | [FilePref] -> FileSuff -> BaseVar -> IO [FilePath] |
| src    | System.Filer.Fold.Creator       | createFold      | FilePath -> IO ()                                  |
| src    | System.Filer.Fold.Deleter       | deleteFold      | FilePath -> IO ()                                  |
| src    | System.Filer.File.Creator       | createFile      | FilePath -> FileCont -> IO ()                      |
| src    | System.Filer.File.Deleter       | deleteFile      | FilePath -> IO ()                                  |
| src    | System.Filer.File.Recreator     | recreateFile    | FilePath -> FileCont -> IO ()                      |
| src    | System.Filer.File.Reviewer      | fileCont        | FilePath -> IO FileCont                            |
| src    | System.Filer.File.Updater       | updateFile      | FilePath -> FileCont -> IO ()                      |
| src    | System.Filer.Link.Creator       | createLink      | FilePath -> FilePath -> IO ()                      |
| src    | System.Filer.Link.Deleter       | deleteLink      | FilePath -> IO ()                                  |
| src    | System.Filer.Link.Recreator     | recreateLink    | FilePath -> FilePath -> IO ()                      |
| src    | System.Filer.Link.Reviewer      | linkCont        | FilePath -> IO LinkCont                            |


## Interfaces
| Folder | Module       | Name         |
|--------|--------------|--------------|
| src    | System.Filer | version      |
| src    | System.Filer | basename     |
| src    | System.Filer | dirname      |
| src    | System.Filer | fisoType     |
| src    | System.Filer | fisoMode     |
| src    | System.Filer | isFisoMode   |
| src    | System.Filer | setFisoMode  |
| src    | System.Filer | existAsFiles |
| src    | System.Filer | createFold   |
| src    | System.Filer | deleteFold   |
| src    | System.Filer | createFile   |
| src    | System.Filer | deleteFile   |
| src    | System.Filer | recreateFile |
| src    | System.Filer | fileCont     |
| src    | System.Filer | updateFile   |
| src    | System.Filer | createLink   |
| src    | System.Filer | deleteLink   |
| src    | System.Filer | recreateLink |
| src    | System.Filer | linkCont     |

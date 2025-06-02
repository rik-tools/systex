-- ⚠
module System.Filer.Domain (FisoMode, FileCont, LinkCont, FilePref, FileSuff, BaseVar, FisoType (None, Null, PFold, PFile, VFold, VFile))
where

    type FisoMode = String
    type FileCont = String
    type LinkCont = String
    type FilePref = String
    type FileSuff = String
    type BaseVar = String

    data FisoType = None | Null | PFold | PFile | VFold | VFile deriving (Eq, Show, Read)

--
